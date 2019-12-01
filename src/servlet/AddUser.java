package servlet;

import dao.MySqlDAOFactory;
import dao.userDao.UserMySqlDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AddUser extends HttpServlet {

    UserMySqlDao userDao;
    int err = 0 ;

    @Override
    public void init() throws ServletException {
        super.init();
        userDao = (UserMySqlDao) getServletContext().getAttribute("UserDao");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /* String login = request.getParameter("login");
        String password = request.getParameter("password2");//*/

        String login = (String) request.getAttribute("login");
        String password = (String) request.getAttribute("password");//*/
//        System.out.println(login);
//        System.out.println(password);

        System.out.println("AddUser");
        if(login!=null&&password!=null) {

            System.out.println(userDao.getUserByLogin(login));
            if(userDao.getUserByLogin(login)== null)
            {
                userDao.addUserToDb(new User(login,password));
                request.setAttribute("alert",1);
                request.getRequestDispatcher("alert.jsp").forward(request, response);

            }
            else
            {
                request.setAttribute("err", 5);
                System.out.println("exist");
            }


        }

        /*if(login == null)
            System.out.println("!!!!!!!!!!!!!!!!!!!!!@#@#");*/
        //request.setAttribute("error",true);

        //boolean err = (boolean) request.getAttribute("err");




       if(request.getAttribute("err") != null)
           err = (int) request.getAttribute("err");
       //System.out.println(err);
        //


        //request.getRequestDispatcher("registration").forward(request,response);
        response.sendRedirect("registration");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("error",err);
        err = 0;
        request.getRequestDispatcher("registration.jsp").forward(request, response);
        //response.sendRedirect("registration");


    }
}
