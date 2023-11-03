package com.golfclub.golfclubsystem.controllers.member;
import com.golfclub.golfclubsystem.EmailManager;
import com.golfclub.golfclubsystem.dataContext.MemberDao;
import com.golfclub.golfclubsystem.models.Member;
import com.golfclub.golfclubsystem.Attributes;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/member/cancelMembership")
public class CancelMembershipServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Member user = (Member) req.getSession().getAttribute(Attributes.User);
        if(user != null){
            try(MemberDao memberDao = new MemberDao()){
                memberDao.delete(user);
            } catch (Exception e){
                System.out.println(e);
            }

//            try{
//                EmailManager emailManager = new EmailManager();
//                emailManager.sendMail(user.getEmail(), "Membership Cancellation", "Dear " + user.getFullName()
//                        + "\n\nYour Membership has been cancelled. \n\nKind Regards,\nASD Gold Club System");
//            } catch (Exception e){
//                System.out.println(e);
//            }

            req.getSession().removeAttribute(Attributes.User);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/homepage.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
