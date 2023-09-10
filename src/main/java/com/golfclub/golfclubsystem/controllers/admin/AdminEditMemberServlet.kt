package com.golfclub.golfclubsystem.controllers.admin

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.dataContext.MemberDao
import com.golfclub.golfclubsystem.models.Member
import com.google.gson.Gson
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet("/admin/member/edit")
class AdminEditMemberServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val currentUser = session.getAttribute(Attributes.User) as Member?
        resp.contentType = "application/json"

        if (currentUser != null && currentUser.isAdmin) {
            val id = req.getParameter("memberId")
            if (id == null) {
                resp.status = 400 // Bad Request
            }
            val memberDao = MemberDao()
            val member = id?.toInt()?.let { memberDao.get(it) }

            val gson = Gson()
            val json = gson.toJson(member)

            val out = resp.writer
            out.println(json)

        } else {
            resp.status = 403 // Forbidden
        }
    }
}