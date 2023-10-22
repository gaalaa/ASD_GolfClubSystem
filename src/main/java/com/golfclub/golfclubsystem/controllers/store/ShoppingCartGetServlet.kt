package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.models.ShoppingCart
import com.google.gson.Gson
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store/cart/get")
class ShoppingCartGetServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        var cart = req.session.getAttribute(Attributes.Cart) as ShoppingCart?
        if (cart == null) {
            cart = ShoppingCart()
            req.session.setAttribute(Attributes.Cart, cart)
        }

        val gson = Gson()
        val json = gson.toJson(cart)

        val out = resp.writer
        out.println(json)
    }
}