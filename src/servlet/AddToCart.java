package servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.medicineDao.MedicineDao;
import dao.MySqlDAOFactory;
import entity.Item;

/**
 * Servlet implementation class AddToCart
 */

public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MedicineDao medDao= null;
	//HashSet<Medicine> cart = null;
	HashSet<Item> cartI = null;


	/**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init() {
    	medDao = (MedicineDao) getServletContext().getAttribute("MedicineDao");;

    	
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession(false);
		response.setContentType("text/html; charset=UTF-8");

		//cart =  (HashSet<Medicine>)session.getAttribute("cart");
		cartI = (HashSet<Item>)session.getAttribute("cartI");
		String sAmount = request.getParameter("amount");
		/*int amount;

		if(sAmount == null) {
			amount = 1;
		}
		else amount = Integer.parseInt(sAmount);
		/*if(cart == null)
			cart = new HashSet<Medicine>();*/
		if(cartI == null)
			cartI = new HashSet<Item>();
		int id = Integer.parseInt(request.getParameter("idM"));



		//cart.add(medDao.getByID(id));
		Item item = new Item(medDao.getByID(id),1);
		cartI.add(item);


		for(Item i : cartI)
			System.out.println(i);
		System.out.println("//////////////////");

		//session.setAttribute("cart", cart);
		session.setAttribute("cartI",cartI);
		//cart.clear();

		response.sendRedirect("medicine");
	}

}
