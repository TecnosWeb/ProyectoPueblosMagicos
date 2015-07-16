package modelo.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.dao.ConexionBD;
import modelo.dao.PuebloDao;
/**
 * Servlet implementation class AjaxCargarLista
 */
@WebServlet("/AjaxCargarLista")
public class AjaxCargarLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PuebloDao pdao ;
	ConexionBD cbd;
	//HttpSession sesion;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCargarLista() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(){
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s = request.getSession();
		cbd=(ConexionBD) s.getAttribute("conexionBD");
		pdao=(PuebloDao) s.getAttribute("pDao");
		    	
		String par=request.getParameter("message");
		int p=Integer.parseInt(par);
		String respMess = pdao.cargarLista(p);
		System.out.println(respMess);
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(respMess);

	
	}

}
