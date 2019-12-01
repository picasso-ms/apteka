package servlet;

import dao.medicineDao.MedicineDao;
import entity.Medicine;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "ChangeMedicine")
public class ChangeMedicine extends HttpServlet {

    MedicineDao medDao= null;
    HashMap<Integer,String> category;
    HashMap<Integer,String> producer;
    HashMap<Integer,String> storageMod;
    /**
     * @see HttpServlet#HttpServlet()
     */

    @Override
    public void init() {

        medDao = (MedicineDao) getServletContext().getAttribute("MedicineDao");
        category = medDao.getDirectory("apteka.category","name","id_category");
        producer = medDao.getDirectory("apteka.producer","name","id_producer");
        storageMod = medDao.getDirectory("apteka.storagemode","storage_mode","id_storage_mod");


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        int idM = Integer.parseInt(request.getParameter("idM"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        int idC = Integer.parseInt(request.getParameter("idC"));
        int idP = Integer.parseInt(request.getParameter("idP"));
        int idS= Integer.parseInt(request.getParameter("idS"));

        medDao.changeMedicine(idM,name,price,amount,idC,idP,idS);
        response.sendRedirect("medicine");




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id  = Integer.parseInt(request.getParameter("idM"));

        Medicine m = medDao.getByID(id);
        request.setAttribute("medicine",m);
        request.setAttribute("category",category);
        request.setAttribute("producer",producer);
        request.setAttribute("storageMod",storageMod);


        request.getRequestDispatcher("changemedicine.jsp").forward(request,response);


    }
}
