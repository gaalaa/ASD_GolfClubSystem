package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.models.ShoppingCart
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store/purchase-complete")
class PurchaseCompleteServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val cart = ShoppingCart()
        session.setAttribute(Attributes.Cart, cart)

        val dispatcher = req.getRequestDispatcher("/WEB-INF/purchase-complete.jsp")
        dispatcher.forward(req, resp)
    }
}