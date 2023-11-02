<%@ page import="com.golfclub.golfclubsystem.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Product product = (Product) request.getAttribute("product");
%>
<html>
<head>
    <title><%= product.getName() %></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icons/bootstrap-icons.min.css">
</head>

<style>
    .product-img {
        border: 1px solid #cdcdcd;
        border-radius: 1rem;
        height: 450px;
        width: 450px;
        object-fit: contain;
    }
</style>

<body>
<%@include file="jspf/header.jspf"%>
<div class="container d-flex justify-content-end">
    <%@include file="jspf/cart.jspf" %>
</div>

<div class="container">
    <a href="${pageContext.request.contextPath}/store" style="text-decoration: none; top: -25px; position: relative;"> < Back to store</a>
    <div class="d-flex ms-4">
        <img class="product-img" src="${pageContext.request.contextPath}/<%= product.getImageUri() != null
                ?  product.getImageUri()
                : "/img/products/placeholder.png"%>"
             alt="Product Image">
        <div class="d-flex flex-column m-3 justify-content-between">
            <div class="d-flex flex-column">
                <h2> <%= product.getName() %></h2>
                <% if (product.getStock() <= 0) { %>
                    <p class="text-danger">Out of stock</p>
                <% } %>
            </div>
            <div class="d-flex flex-column">
                <p> <%= product.getDescription() %></p>
                <p class="fw-bold" style="font-size: 2rem"> $<%= product.getPrice() %></p>
                <button class="btn btn-primary" onclick="onAddToCartClicked(event, <%= product.getId() %>)" >Add to Cart</button>
            </div>
        </div>

    </div>
</div>

<div id="to-checkout-modal" class="modal fade">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-body">
                <p>Item added to your cart.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Keep Shopping</button>
                <a href="${pageContext.request.contextPath}/store/cart" id="to-checkout-button" class="btn btn-primary">Go to checkout</a>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script>
    const cartItemCountDot = document.querySelector('#cart-count-dot');
    const cartItemCountText = document.querySelector('#cart-count');
    const toCheckoutModal = new bootstrap.Modal(document.querySelector('#to-checkout-modal'), {});

    updateVisibilityOfCartDot();

    function updateVisibilityOfCartDot() {
        cartItemCountDot.style.visibility = Number(cartItemCountText.innerHTML) === 0
            ? 'hidden'
            : 'unset';
    }

    /**
     * @param {Event} event
     * @param {number} productId
     */
    async function onAddToCartClicked(event, productId) {
        event.preventDefault();
        const response = await fetch(`${pageContext.request.contextPath}/store/cart/add?productId=\${productId}`, {
            method: 'POST',
        });

        if (response.status !== 200) {
            console.error(response.status, response.statusText);
            return;
        }

        cartItemCountText.innerText = (Number(cartItemCountText.innerHTML) + 1).toString();
        updateVisibilityOfCartDot();

        toCheckoutModal.show();
    }
</script>
</html>
