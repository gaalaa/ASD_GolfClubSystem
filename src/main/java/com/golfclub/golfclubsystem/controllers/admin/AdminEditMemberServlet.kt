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

    // Route: /admin/member/edit?memberId={int}
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val currentUser = session.getAttribute(Attributes.User) as Member?
        resp.contentType = "application/json"

        if (currentUser != null && currentUser.isAdmin) {
            val memberIdParam = req.getParameter("memberId")
            if (memberIdParam == null) {
                resp.status = 400 // Bad Request
                return
            }
            val memberDao = MemberDao()
            val id = memberIdParam.toIntOrNull()
            if (id == null) {
                resp.status = 400 // Bad Request
                return
            }

            val member = memberDao.get(id)

            if (member.isEmpty) {
                resp.status = 404 // Not Found
                return
            }

            val gson = Gson()
            val json = gson.toJson(member.get())

            val out = resp.writer
            out.println(json)

        } else {
            resp.status = 403 // Forbidden
        }
    }

    // Route: POST /admin/member/edit
    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val currentUser = session.getAttribute(Attributes.User) as Member?

        if (currentUser == null || !currentUser.isAdmin) {
            resp.status = 403 // Forbidden
            return
        }

        val memberToEdit = Member().apply {
            this.id = req.getParameter("id").toInt()
            this.firstName = req.getParameter("firstName")
            this.lastName = req.getParameter("lastName")
            this.email = req.getParameter("email")
        }

        val memberDao = MemberDao()
        memberDao.update(memberToEdit)

        resp.sendRedirect("/admin/members")
    }

    // Route: DELETE /admin/member/edit?memberId={int}
    override fun doDelete(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val currentUser = session.getAttribute(Attributes.User) as Member?

        if (currentUser == null || !currentUser.isAdmin) {
            resp.status = 403 // Forbidden
            return
        }

        val idToDeleteParam = req.getParameter("memberId")
        if (idToDeleteParam == null) {
            resp.status = 400 // Bad Request
            return
        }

        val id = idToDeleteParam.toIntOrNull()
        if (id == null) {
            resp.status = 400 // Bad Request
            return
        }

        val memberDao = MemberDao()
        val success = memberDao.delete(id)
        if (!success) {
            resp.status = 404 // Not Found
            return
        }
    }
}