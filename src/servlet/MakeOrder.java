package servlet;

import dao.orderDao.OrderDao;
import entity.Item;
import entity.Order;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;

@WebServlet(name = "MakeOrder")
public class MakeOrder extends HttpServlet {

    private int err = 0;
    OrderDao orderDao = null;


    @Override
    public void init() throws ServletException {
        super.init();

        orderDao = (OrderDao) getServletContext().getAttribute("OrderDao");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        User u = (User) session.getAttribute("user");
        HashSet<Item> cartI = cartI = (HashSet<Item>)session.getAttribute("cartI");



        System.out.println(phone);
        if(name!=null && phone != null )
        {

            /*System.out.println(u.getId()+"!@!@!@!@!@@!");
            for (Item i : cartI)
                System.out.println(i.getM());
            System.out.println("make Order");//*/
            Order o = new Order(u.getId(),1,cartI,name,phone);
            orderDao.addOrder(o);
            request.setAttribute("idOrder",o.getId_order());
            cartI.clear();
            request.setAttribute("alert",2);
            request.getRequestDispatcher("alert.jsp").forward(request, response);
            //return;
        }
        else {
            err = 1;
        }


        response.sendRedirect("makeorder");



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("error",err);
        err = 0;
        request.getRequestDispatcher("makeorder.jsp").forward(request, response);

    }
}
