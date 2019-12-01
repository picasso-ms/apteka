package servlet;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Item;
import entity.Medicine;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub

    }
    
    


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		


		request.getRequestDispatcher("cartlist.jsp").forward(request, response);
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		session = request.getSession();
		HashSet<Item> cartI = cartI = (HashSet<Item>)session.getAttribute("cartI");

		String uId = request.getParameter("uId");//update

		String rId = request.getParameter("rId");//remove
		int id;



		if (uId != null && !uId.trim().equals("")){
			id = Integer.parseInt(request.getParameter("uId"));
			int amount = Integer.parseInt(request.getParameter("amount"));


			for(Item i : cartI)
			{
				if(i.getM().getId_medicine() == id)
					i.setAmount(amount);

			}

		}
		if (rId != null && !rId.trim().equals("")){
			id = Integer.parseInt(request.getParameter("rId"));


			for(Item i : cartI)
			{
				if(i.getM().getId_medicine() == id) {
					cartI.remove(i);

					break;

				}

			}

		}


		response.sendRedirect("cartlist");

		/*System.out.println(request.getParameter("idMed"));
		//request.getRequestDispatcher("medicine.jsp").forward(request, response);
		response.sendRedirect("medicine");*/
		
	}

}
