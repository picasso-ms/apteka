package servlet;

import dao.userDao.UserMySqlDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Login extends HttpServlet {

    UserMySqlDao userDao;
    int err = 0 ;
    User u;


    @Override
    public void init() throws ServletException {
        super.init();
        userDao = (UserMySqlDao) getServletContext().getAttribute("UserDao");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = (String) request.getAttribute("login");
        String password = (String) request.getAttribute("password");//*/
        //System.out.println((String)request.getAttribute("password2"));
        /*System.out.println(login);
        System.out.println(password);*/


        if(login!=null&&password!=null) {

            HttpSession session = request.getSession();
            u =userDao.getUserByLogin(login);
            System.out.println(u.getId()+"FromLogin");
            if(u == null)
            {

                request.setAttribute("err", 5);
                System.out.println("exist");

            }
            else
            {
                if(u.getPassword().equals(password))
                {
                    session.setAttribute("user",u);
                    response.sendRedirect("medicine");
                    return;

                }
                else request.setAttribute("err", 6);
            }


        }




        if(request.getAttribute("err") != null)
            err = (int) request.getAttribute("err");

        response.sendRedirect("login");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("error",err);
        err = 0;

        request.getRequestDispatcher("login.jsp").forward(request, response);

    }
}
