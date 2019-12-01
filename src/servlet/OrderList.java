package servlet;

import dao.orderDao.OrderDao;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderList")
public class OrderList extends HttpServlet {
    OrderDao orderDao;


    @Override
    public void init() throws ServletException {
        super.init();
        orderDao = (OrderDao) getServletContext().getAttribute("OrderDao");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Order> orderList = orderDao.getOrders();
        List<Order> oL = new ArrayList<Order>();
        String idS = request.getParameter("idS");
        int idStatus = 1;
        if(idS != null)
            idStatus = Integer.parseInt(idS);


        for (Order o : orderList){
            if(o.getId_order_status() == idStatus)
                oL.add(o);
        }

        request.setAttribute("orderList",oL);

        request.getRequestDispatcher("orderlist.jsp").forward(request,response);

    }
}
