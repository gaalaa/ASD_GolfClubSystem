package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.dataContext.ProductDao
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store")
class StoreServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val productDao = ProductDao()
        val products = productDao.all

        req.setAttribute("products", products)
        val dispatcher = req.getRequestDispatcher("/WEB-INF/store.jsp")
        dispatcher.forward(req, resp)
    }
}