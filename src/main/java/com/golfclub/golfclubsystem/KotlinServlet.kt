package com.golfclub.golfclubsystem

import jakarta.servlet.annotation.WebServlet
import jakarta.servlet.http.HttpServlet
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse

@WebServlet(name = "KotlinServlet", value = ["/kotlin-servlet"])
class KotlinServlet : HttpServlet() {

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse) {
        resp.contentType = "text/html"

        val out = resp.writer
        out.println("""
            <html>
            <body>
                <h1>Hello from Kotlin</h1>
            </body>
            </html>
        """.trimIndent())
    }

}