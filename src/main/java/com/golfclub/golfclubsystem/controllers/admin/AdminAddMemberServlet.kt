package com.golfclub.golfclubsystem.controllers.admin

import com.golfclub.golfclubsystem.Attributes
import com.golfclub.golfclubsystem.dataContext.MemberDao
import com.golfclub.golfclubsystem.models.Member
import com.google.gson.Gson
import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import java.lang.Exception

@WebServlet("/admin/member/add")
class AdminAddMemberServlet : HttpServlet() {
    override fun doGet(req: HttpServletRequest, resp: HttpServletResponse) {
        resp.status = 404
    }

    override fun doPost(req: HttpServletRequest, resp: HttpServletResponse) {
        val session = req.session
        val currentUser = session.getAttribute(Attributes.User) as Member?

        if (currentUser == null || !currentUser.isAdmin) {
            resp.status = 403
            return
        }

        val memberDao = MemberDao()

        // Note(Pete): Jakarta EE is from the stone age and so it doesn't know how to deal with JSON, so we have
        // to manually read the text from the request then pass it onto Gson to do the decoding for us.
        // Thank goodness Gson is a competent library.
        val  reader = req.reader
        val sb = StringBuilder()
        for (line in reader.lines()) {
            sb.append(line)
        }
        val gson = Gson()
        val memberToAdd = gson.fromJson(sb.toString(), Member::class.java)

        try {
            memberDao.add(memberToAdd);

            val json = gson.toJson(memberToAdd);
            val out = resp.writer
            out.println(json)
        } catch (e: Exception) {
            resp.status = 500
        }
    }
}