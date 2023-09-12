package com.golfclub.golfclubsystem.controllers.member;

        import com.golfclub.golfclubsystem.Attributes;
        import jakarta.servlet.RequestDispatcher;
        import jakarta.servlet.ServletException;
        import jakarta.servlet.annotation.WebServlet;
        import jakarta.servlet.http.HttpServlet;
        import jakarta.servlet.http.HttpServletRequest;
        import jakarta.servlet.http.HttpServletResponse;
        import jakarta.servlet.http.HttpSession;

        import java.io.IOException;

@WebServlet(name = "courseInfoServlet", value = "/courseInfo-servlet")

public class courseInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //resp.setStatus(404);
        //resp.sendRedirect("http://localhost:8080/GolfClubSystem_war_exploded/WEB-INF/courseInfo.jsp");
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/courseInfo.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*HttpSession session = req.getSession();
        session.removeAttribute(Attributes.User);
        resp.sendRedirect("/"); */
    }
}
