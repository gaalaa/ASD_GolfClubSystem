package com.golfclub.golfclubsystem.controllers.admin

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.dataContext.MemberDao
import com.golfclub.golfclubsystem.models.Member
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/admin")
class AdminServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
//        val currentUser = session.getAttribute(Attributes.User) as Member?

        val dao = MemberDao()
        // Just for testing so I don't have to sign in.
        val currentUser = dao.get(1).get()
        session.setAttribute(Attributes.User, currentUser)

        if (currentUser != null) {
            if (currentUser.isAdmin) {
                val allMembers = dao.getAll()
                req.setAttribute("members", allMembers)

                val dispatcher = req.getRequestDispatcher("/WEB-INF/admin-dashboard-users.jsp")
                dispatcher.forward(req, resp)
            } else {
                resp.status = 403 // Forbidden
            }
        } else {
            resp.sendRedirect("/member/login");
        }
    }
}