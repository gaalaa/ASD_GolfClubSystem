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
</head>
<body>
<%@include file="jspf/header.jspf"%>
<div>
    <div>

    </div>
    <div class="album py-5">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <% for (Product product : products) { %>
                <div class="col">
                        <div href="/#" class="card shadow-sm" >
                            <img src="<%= product.getImageUri() != null ? product.getImageUri() : "img/products/placeholder.png"%>"
                                 alt="Product image"
                                 class="card-img-top object-fit-cover align-self-center" style="height: 15rem; width: 10rem" />
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getName() %></h5>
                                <p class="card-text"><%= product.getDescription() %></p>
                                <p class="fw-bold">$<%= product.getPrice().toString() %></p>
                                <a class="stretched-link" href="${pageContext.request.contextPath}/store/product/<%= product.getId()%>"></a>
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/store/product?=<%= product.getId()%>">Add to Cart</a>
                            </div>
                        </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>

</body>
</html>
