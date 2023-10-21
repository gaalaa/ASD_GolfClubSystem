<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.golfclub.golfclubsystem.models.Product" %>
<%
    @SuppressWarnings("unchecked")
    List<Product> products = (List<Product>) request.getAttribute("products");
%>
<html>
<head>
    <title>Golf Shop</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icons/bootstrap-icons.min.css">
</head>
<body>
<%@include file="jspf/header.jspf" %>
<div class="container d-flex justify-content-end">
    <%@include file="jspf/cart.jspf" %>
</div>
<div>
    <div>

    </div>
    <div class="album py-3">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <% for (Product product : products) { %>
                <div class="col">
                    <a href="${pageContext.request.contextPath}/store/product/<%= product.getId()%>" style="text-decoration: unset; color: inherit;">
                        <div class="card shadow-sm">
                            <img src="<%= product.getImageUri() != null ? product.getImageUri() : "img/products/placeholder.png"%>"
                                 alt="Product image"
                                 class="card-img-top object-fit-cover align-self-center"
                                 style="height: 15rem; width: 10rem"/>
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getName() %> </h5>
                                <p class="card-text"><%= product.getDescription() %> </p>
                                <p class="fw-bold">$<%= product.getPrice().toString() %> </p>
                                <button class="btn btn-primary" onclick="onAddToCartClicked(event, <%= product.getId() %>)">
                                    Add to Cart
                                </button>
                            </div>
                        </div>
                    </a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

</body>

<script>
    const cartItemCountDot = document.querySelector('#cart-count-dot');
    const cartItemCountText = document.querySelector('#cart-count');

    updateVisibilityOfCartDot();

    function updateVisibilityOfCartDot() {
        cartItemCountDot.style['visibility'] = Number(cartItemCountText.innerHTML) === 0
            ? 'hidden'
            : 'unset';
    }

    /**
     * @param {Event} event
     * @param {number} productId
     */
    async function onAddToCartClicked(event, productId) {
        event.preventDefault();
        const response = await fetch(`${pageContext.request.contextPath}/store/cart?productId=\${productId}`, {
            method: 'POST',
        });

        if (response.status !== 200) {
            console.error(response.status, response.statusText);
            return;
        }

        cartItemCountText.innerText = (Number(cartItemCountText.innerHTML) + 1).toString();
        updateVisibilityOfCartDot();
    }
</script>
</html>
