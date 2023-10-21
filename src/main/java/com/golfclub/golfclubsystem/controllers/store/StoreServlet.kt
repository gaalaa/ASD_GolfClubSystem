package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.dataContext.ProductDao
import com.golfclub.golfclubsystem.models.ShoppingCart
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store")
class StoreServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        var cart = req.session.getAttribute(Attributes.Cart) as ShoppingCart?
        if (cart == null) {
            cart = ShoppingCart()
            req.session.setAttribute(Attributes.Cart, cart)
        }

        val productDao = ProductDao()
        val products = productDao.all

        req.setAttribute("products", products)
        val dispatcher = req.getRequestDispatcher("/WEB-INF/store.jsp")
        dispatcher.forward(req, resp)
    }
}