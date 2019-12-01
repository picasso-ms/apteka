package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebFilter(filterName = "ValidationFilter")
public class ValidationFilter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        //System.out.println("Filter");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        int pos  = request.getRequestURI().lastIndexOf("/") + 1;
        //System.out.println(request.getRequestURI());

        String login = request.getParameter("login");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");

        if(password2 == null)
            password2 = password1;


        if(login != null&& password1!=null&& password2!=null ) {



            if (login.equals("")||password1.equals("")||password2.equals("")) {

                System.out.println(request.getRequestURI().substring(pos));
                request.setAttribute("err", 1);
                request.getRequestDispatcher( request.getRequestURI().substring(pos) ).forward(req, resp);
                return;

            }
            else if(!Pattern.matches("\\w+",login)){
                request.setAttribute("err", 2);
                //request.getRequestDispatcher("registration").forward(req, resp);
                request.getRequestDispatcher( request.getRequestURI().substring(pos) ).forward(req, resp);
                return;
            }
            else if(!password1.equals(password2)){
                request.setAttribute("err", 3);
                //request.getRequestDispatcher("registration").forward(req, resp);
                request.getRequestDispatcher( request.getRequestURI().substring(pos) ).forward(req, resp);
                return;
            }
            else if(!Pattern.matches("[a-zA-Z0-9]+",password1)||!Pattern.matches("[a-zA-Z0-9]+",password2)){
                request.setAttribute("err", 4);
                //request.getRequestDispatcher("registration").forward(req, resp);
                request.getRequestDispatcher( request.getRequestURI().substring(pos) ).forward(req, resp);
                return;
            }
            else {

                request.setAttribute("login",login);
                request.setAttribute("password",password1);
/*                request.getRequestDispatcher( request.getRequestURI().substring(pos) ).forward(req, resp);
                return;*/
            }
            //
        }
        /*else
        {


        }*/

        chain.doFilter(req, resp);


        //System.out.println("Finaly");
        //req.getRequestDispatcher("registration").forward(req, resp);


    }

    public void init(FilterConfig config) throws ServletException {

    }

}
