package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.models.ShoppingCart
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store/checkout")
class CheckoutServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        var cart = session.getAttribute(Attributes.Cart) as ShoppingCart?
        if (cart == null) {
            cart = ShoppingCart()
            session.setAttribute(Attributes.Cart, cart)
        }

        val dispatcher = req.getRequestDispatcher("/WEB-INF/checkout.jsp")
        dispatcher.forward(req, resp)
    }
}