package servlet;

import dao.orderDao.OrderDao;
import entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
    OrderDao orderDao;


    @Override
    public void init() throws ServletException {
        super.init();
        orderDao = (OrderDao) getServletContext().getAttribute("OrderDao");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int status = Integer.parseInt(request.getParameter("status"));
        String rId = request.getParameter("orId");
        String id = request.getParameter("oId");
        if(rId!=null)
        {
            System.out.println("Reject");
            System.out.println(status);
            int orId = Integer.parseInt(rId);
            orderDao.changeStatus(orId,status);
        }
        else if(id!=null)
        {
            int oId = Integer.parseInt(id);
            orderDao.changeStatus(oId,status+1);
        }

        response.sendRedirect("orderlist");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
