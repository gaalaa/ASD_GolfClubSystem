package com.golfclub.golfclubsystem.controllers.store

import com.golfclub.golfclubsystem.dataContext.ProductDao
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/store/product/*")
class StoreProductServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        println(req)
        val wildcard = req.pathInfo.trimStart('/')
        val productId = wildcard.toIntOrNull()
        if (productId == null) {
            resp.sendRedirect("/store")
        }

        val productDao = ProductDao()
        val product = productDao.get(productId!!)
        product.ifPresentOrElse({ p ->
            req.setAttribute("product", p)

            val dispatcher = req.getRequestDispatcher("/WEB-INF/store-product.jsp")
            dispatcher.forward(req, resp)
        }, {
            resp.sendRedirect("/store")
        })
    }
}