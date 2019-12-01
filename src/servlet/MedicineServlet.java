package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.medicineDao.MedicineDao;
import dao.MySqlDAOFactory;
import entity.Medicine;

/**
 * Servlet implementation class ConnectServlet
 */
@WebServlet("/ConnectServlet")
public class MedicineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MedicineDao medDao= null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MedicineServlet() {
        super();
        
    }
    @Override
	public void init() {
    	medDao = (MedicineDao) getServletContext().getAttribute("MedicineDao");
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//ServletContext sc = request.getServletContext();
		response.setContentType("text/html; charset=UTF-8");
		
		
		List<Medicine> mList = medDao.getAll();
		
		
		
		
		request.setAttribute("med", mList);
		//sc.setAttribute("med", mList);
		
		request.getRequestDispatcher("medicine.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
