package servlet;

import dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        response.setCharacterEncoding("UTF-8");
        PrintWriter out  = response.getWriter();
        response.setContentType("text/html; charset=UTF-8");
        Connection con = null;
        PreparedStatement stmt = null;
        con = Database.getInstance().getConnection();
        try {
            stmt = con.prepareStatement("SELECT   sum(apteka.ordercart.amount) as am, apteka.ordercart.name, apteka.ordercart.id_order,apteka.orders.order_status \n" +
                    "\tFROM apteka.ordercart, apteka.orders where apteka.ordercart.id_order = apteka.orders.id_order and apteka.orders.order_status = 'done' group by name order by am desc");
            ResultSet rs =  stmt.executeQuery();

            out.println("<table>");
            out.println("<tr>");
            out.println("<td>");
            out.println("count");
            out.println("</td>");
            out.println("<td>");
            out.println("medecine");
            out.println("</td>");

            out.println("</tr>");


                while (rs.next()){

                    out.println("<tr>");
                        out.println("<td>");
                            out.println(rs.getString("am"));
                        out.println("</td>");
                    out.println("<td>");
                    out.println(rs.getString("name"));
                    out.println("</td>");

                    out.println("</tr>");

                }
            out.println("</table>");

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally
        {

            Database.close(stmt);
            Database.close(con);
        }
    }
}
