package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.dataContext.ProductDao
import com.golfclub.golfclubsystem.models.ShoppingCart
import com.golfclub.golfclubsystem.models.ShoppingCartItem
import com.google.gson.Gson
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store/cart")
class ShoppingCartServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        var cart = session.getAttribute(Attributes.Cart) as ShoppingCart?
        if (cart == null) {
            cart = ShoppingCart()
            req.setAttribute(Attributes.Cart, cart)
        }

        val gson = Gson()
        val json = gson.toJson(cart)

        val out = resp.writer
        out.println(json)
    }

    // Route: POST /store/cart?productId={int}
    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        var cart = session.getAttribute(Attributes.Cart) as ShoppingCart?
        if (cart == null) {
            cart = ShoppingCart()
            req.setAttribute(Attributes.Cart, cart)
        }

        val productId = req.getParameter("productId").toIntOrNull()
        if (productId == null) {
            resp.status = 400
            return
        }

        val productDao = ProductDao()
        val product = productDao.get(productId)
        if (product.isEmpty) {
            resp.status = 401
            return
        }

        cart.addProduct(product.get())
    }
}