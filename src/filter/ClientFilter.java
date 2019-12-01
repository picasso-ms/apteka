package filter;

import entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "ClientFilter")
public class ClientFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();

        User u = (User) session.getAttribute("user");
        String uri = request.getRequestURI();
        System.out.println(uri);
        if(u==null){

            if(!(uri.equals("/apteka/medicine")||uri.equals("/apteka/login")||uri.equals("/apteka/registration")||uri.equals("/apteka")||uri.equals("/apteka/css/navbar.css")||uri.equals("/apteka/servlet"))){
                System.out.println("!!!!!");
                request.getRequestDispatcher("login").forward(request,response);
                //response.sendRedirect("login");
                return;
            }


        }
        else if(u.getStatus()==2){
            if(  uri.equals("/apteka/orderlist")||uri.equals("/apteka/changemedicine") ){
                request.getRequestDispatcher("login").forward(request,response);
                return;
            }
        }
        else if(u.getStatus()==1){
            if(  uri.equals("/apteka/cartlist") ){
                request.getRequestDispatcher("login").forward(request,response);
                return;
            }
        }






        /*
        switch (request.getRequestURI()){

            case "/apteka/medicine":


                break;

        }*/


        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
