<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.golfclub.golfclubsystem.Attributes" %>
<%@ page import="com.golfclub.golfclubsystem.models.ShoppingCart" %>
<%@ page import="com.golfclub.golfclubsystem.models.ShoppingCartItem" %>
<%
    ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute(Attributes.Cart);
%>

<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icons/bootstrap-icons.min.css">
</head>
<body>
<%@include file="jspf/header.jspf"%>

<div class="container">
    <h2>Shopping Cart</h2>
    <% if (cart.count() == 0) { %>
    <p>Your cart is empty. Check out our stock in the <a href="${pageContext.request.contextPath}/store">store</a>.</p>
    <% } else { %>
        <% for (ShoppingCartItem item : cart.items) { %>
            <div class="card mb-3" style="width: 50%;" data-asd-id="<%= item.product.getId() %>">
                <div class="card-body">
                    <div class="d-flex align-items-baseline justify-content-between">
                        <div class="d-flex align-items-baseline">
                            <div class="fw-bold me-3" style="font-size: 1.2rem"><%= item.product.getName() %></div>
                            <div class="me-1">Quantity:</div>
                            <div id="quantity" class="fw-bold me-3"><%= item.quantity %></div>
                            <button class="btn btn-outline-primary me-1" onclick="onRemoveItemClicked(<%= item.product.getId() %>)">
                                <i class="bi bi-dash"></i>
                            </button>
                            <button class="btn btn-outline-primary" onclick="onAddItemClicked(<%= item.product.getId() %>)">
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                        <div>
                            <span class="fw-bold">$</span>
                            <span id="price" class="fw-bold"><%= item.getTotalPrice() %></span>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
        <div class="d-flex mt-2">
            <h3>Total: $</h3>
            <h3 id="total"><%= cart.totalAmount() %></h3>
        </div>
        <a href="${pageContext.request.contextPath}/store/checkout" class="btn btn-primary mt-2">Continue to Checkout</a>
    <% } %>
</div>
</body>

<script>
    class ShoppingCart {
        /** @type {ShoppingCartItem[]} */
        items;
     }
    class ShoppingCartItem {
        /** @type {Product} */
        product;
        /** @type {Number} */
        quantity;
    }

    class Product {
        /** @type {Number} */
        id;
        /** @type {String} */
        name;
        /** @type {String} */
        description;
        /** @type {Number} */
        price;
        /** @type {Number} */
        stock;
    }

    const totalText = document.querySelector('#total');

    /**
     * @param {number} productId
     * @returns {Promise<void>}
     */
    async function onAddItemClicked(productId) {
        const resp = await fetch(`${pageContext.request.contextPath}/store/cart/add?productId=\${productId}`, {
            method: 'POST'
        });
        if (resp.status !== 200) {
            console.error(resp);
            return;
        }

        /** @Type {ShoppingCart} */
        const cart = await resp.json();
        updateProductCard(productId, cart);

        await recalculateTotal();
    }

    /**
     * @param {number} productId
     * @returns {Promise<void>}
     */
    async function onRemoveItemClicked(productId) {
        const resp = await fetch(`${pageContext.request.contextPath}/store/cart/remove?productId=\${productId}`, {
            method: 'POST'
        });
        if (resp.status !== 200) {
            console.error(resp);
            return;
        }

        /** @Type {ShoppingCart} */
        const cart = await resp.json();
        updateProductCard(productId, cart);

        await recalculateTotal();
    }

    /**
     * @param {Number} productId
     * @param {ShoppingCart} cart
     */
    function updateProductCard(productId, cart) {
        let found = false;
        const product = document.querySelector(`[data-asd-id="\${productId}"]`);
        for (const item of cart.items) {
            if (item.product.id === productId) {
                found = true;
                const quantity = product.querySelector('#quantity');
                quantity.innerHTML = item.quantity.toString();

                const price = product.querySelector('#price');
                price.innerHTML = (item.product.price * item.quantity).toFixed(2);
                break;
            }
        }

        // The item is no longer in the cart.
        if (!found) {
            product.remove();
        }
    }

    async function recalculateTotal() {
        const resp = await fetch('${pageContext.request.contextPath}/store/cart/get');
        if (resp.status !== 200) {
            console.error(resp);
            return;
        }

        const cart = await resp.json();
        let total = 0;
        for (const item of cart.items) {
            total += item.product.price * item.quantity;
        }
        totalText.innerHTML = total.toFixed(2);
    }
</script>
</html>
