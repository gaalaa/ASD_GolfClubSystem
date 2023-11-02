<%@ page import="com.golfclub.golfclubsystem.models.ShoppingCart" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute(Attributes.Cart);
    Member member = (Member) request.getSession().getAttribute(Attributes.User);
%>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<%@include file="jspf/header.jspf"%>
<div class="container">
    <h2>Checkout</h2>
    <form id="checkout-form" class="col-5">
        <div class="mb-3">
            <h4>Details</h4>
            <div class="d-flex mb-2" style="gap: 1rem">
                <input id="first-name-input" type="text" class="form-control" placeholder="First Name"
                       value="<%= member != null ? member.getFirstName() : ""%>" required>
                <input id="last-name-input" type="text" class="form-control" placeholder="Last Name"
                       value="<%= member != null ? member.getLastName() : ""%>" required>
            </div>
            <input id="email-input" type="email" class="form-control" placeholder="Email"
                    value="<%= member != null ? member.getEmail() : ""%>" required>
        </div>
        <div class="mb-3">
            <h4>Address</h4>
            <input id="street-input" type="text" class="form-control mb-2" placeholder="Street" required>
            <input id="city-input" type="text" class="form-control mb-2" placeholder="City" required>
            <div class="d-flex mb-2" style="gap: 1rem">
                <input id="state-input" list="state-list-options" class="form-control" placeholder="State" required>
                <datalist id="state-list-options">
                    <option value="ACT"></option>
                    <option value="NSW"></option>
                    <option value="NT"></option>
                    <option value="QLD"></option>
                    <option value="SA"></option>
                    <option value="TAS"></option>
                    <option value="VIC"></option>
                    <option value="WA"></option>
                </datalist>
                <input id="postcode-input" type="text" class="form-control" placeholder="Postcode" required>
            </div>
        </div>
        <div class="mb-3">
            <h4>Payment Details</h4>
            <input id="card-number-input" type="text" class="form-control mb-2" placeholder="Card Number" required>
            <div class="d-flex mb-2" style="gap: 1rem">
                <input id="expiry-input" type="text" class="form-control" placeholder="Expiry MM/YY" required>
                <input id="cvv-input" type="text" class="form-control" placeholder="CVV" required>
            </div>
        </div>
        <div class="rounded p-2 mb-3" style="background-color: #e7e7e7">
            <div class="d-flex ms-2">
                <h4>Total: $</h4>
                <h4 id="total"><%= cart.totalAmount() %></h4>
            </div>
        </div>
    </form>
    <button class="btn btn-primary" onclick="onConfirmPressed()">Confirm Purchase</button>
</div>
</body>
<script>
    const form = document.querySelector('#checkout-form');
    const firstNameInput = document.querySelector('#first-name-input');
    const lastNameInput = document.querySelector('#last-name-input');
    const emailInput = document.querySelector('#email-input');
    const streetInput = document.querySelector('#street-input');
    const cityInput = document.querySelector('#city-input');
    const stateInput = document.querySelector('#state-input');
    const postcodeInput = document.querySelector('#postcode-input');
    const cardNumberInput = document.querySelector('#card-number-input');
    const expiryInput = document.querySelector('#expiry-input');
    const cvvInput = document.querySelector('#cvv-input');

    function onConfirmPressed() {
        form.classList.add('was-validated');
        if (firstNameInput.value === '')
            return;
        if (lastNameInput.value === '')
            return;
        if (emailInput.value === '')
            return;
        if (streetInput.value === '')
            return;
        if (cityInput.value === '')
            return;
        if (stateInput.value === '')
            return;
        if (postcodeInput.value === '')
            return;
        if (cardNumberInput.value === '')
            return;
        if (expiryInput.value === '')
            return;
        if (cvvInput.value === '')
            return;

        window.location.href = '${pageContext.request.contextPath}/store/purchase-complete'
    }
</script>
</html>
