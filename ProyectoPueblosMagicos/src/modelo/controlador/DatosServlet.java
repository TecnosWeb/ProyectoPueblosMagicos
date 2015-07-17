package modelo.controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import modelo.dao.CargarPropiedades;
import modelo.dao.ConexionBD;
import modelo.dao.CoordenadaDAO;
import modelo.dao.PuebloDao;
import modelo.pojos.CoordenadaBean;
//import modelo.pojos.PropiedadesConexion;
import modelo.pojos.PuebloBean;

/**
 * Servlet implementation class DatosServlet
 */
@WebServlet("/DatosServlet")
public class DatosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PuebloDao pDao;
    private CoordenadaDAO cDao;
    ConexionBD cbd=new ConexionBD();
    CoordenadaBean coord= new CoordenadaBean();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatosServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


		
		HttpSession s= request.getSession();
		cbd= (ConexionBD)s.getAttribute("conexionBD");
		///PropiedadesConexion pbd = new CargarPropiedades().getPropiedades("C:/Users/Didier/git/ProyectoPueblosMagicos/WebContent/conf/config.properties");
		//pbd.print();
		//String a = cbd.conectar(pbd.getUrl(), pbd.getUser(), pbd.getPass());
		//System.out.println(a);
	
		
		cDao=new CoordenadaDAO(cbd);
		double latitud= Double.parseDouble(request.getParameter("latitude"));
		double longitud= Double.parseDouble(request.getParameter("longitude"));
		coord.setLatitude(latitud);
		coord.setLongitude(longitud);
		coord.setRatio(0);
		s.setAttribute("coord", coord);
		
		pDao=(PuebloDao) s.getAttribute("pDao");    	
		String par=request.getParameter("message");
		PuebloBean pb=pDao.consultarPueblo(par);
		System.out.println(pb.getNombrePueblo());
		String markers="";
		String lat=Double.toString(pb.getLatitude());
		String lng=Double.toString(pb.getLongitude());
		markers+=pb.getNombrePueblo()+"/"+lat+"/"+lng+"|";
		System.out.println(markers);
		s.setAttribute("markers", markers);
		System.out.println("marcadores subidos a la sesion");
		String urls=pb.getUrlDescripcion()+"|";
		s.setAttribute("urls", urls);
		
		response.sendRedirect("map.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s= request.getSession();
		cbd= (ConexionBD)s.getAttribute("conexionBD");
		///PropiedadesConexion pbd = new CargarPropiedades().getPropiedades("C:/Users/Didier/git/ProyectoPueblosMagicos/WebContent/conf/config.properties");
		//pbd.print();
		//String a = cbd.conectar(pbd.getUrl(), pbd.getUser(), pbd.getPass());
		//System.out.println(a);
		cDao=new CoordenadaDAO(cbd);
		float radio=Float.parseFloat(request.getParameter("radio"));
		System.out.println("radio: "+radio);
		double latitud= Double.parseDouble(request.getParameter("latitude"));
		double longitud= Double.parseDouble(request.getParameter("longitude"));
		coord.setLatitude(latitud);
		coord.setLongitude(longitud);
		coord.setRatio(radio);
		s.setAttribute("coord", coord);
		
		PuebloBean[] pueblos=cDao.pueblosEnRango(coord);
		String markers="";
		String urls="";
		for(int i=0;i<pueblos.length;i++){
			String lat=Double.toString(pueblos[i].getLatitude());
			String lng=Double.toString(pueblos[i].getLongitude());
			markers+=pueblos[i].getNombrePueblo()+"/"+lat+"/"+lng+"|";
			urls+=pueblos[i].getUrlDescripcion()+"|";
		}
		s.setAttribute("markers", markers);
		s.setAttribute("urls", urls);
		
		response.sendRedirect("map.jsp");
	}

}
