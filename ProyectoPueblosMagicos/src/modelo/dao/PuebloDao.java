package modelo.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import modelo.pojos.PropiedadesConexion;
import modelo.pojos.PuebloBean;

public class PuebloDao {

	private Connection conDao = null;
	
	
	public void setConDao(Connection con) {
		this.conDao = con;
			System.out.println(conDao.equals(null));
		
	}


	public int GuardarPueblo(PuebloBean p){
		String query = "INSERT INTO pueblos (nombre,estado,latitud,longitud) VALUES ("+p.getNombrePueblo()+",'"+p.getEstado()+",'"+p.getLatitude()+",'"+p.getLongitude()+"')";
		int rr=0;
		try {
			Statement s = this.conDao.createStatement();
			rr = s.executeUpdate(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rr;
	}
	public PuebloBean consultarPueblo(String nombrePueblo){
		PuebloBean aux=new PuebloBean();
		String query="SELECT * FROM pueblos where nombre = '"+nombrePueblo+"'";
		//System.out.println(query);
		try {
			Statement consulta = this.conDao.createStatement();
			ResultSet r = consulta.executeQuery(query);
			if(r!=null)
			{	r.next();	
				aux.setNombrePueblo(r.getString(2));
				aux.setEstado(r.getString(3));
				aux.setLatitude(r.getDouble(4));
				aux.setLongitude(r.getDouble(5));
				aux.setUrlDescripcion(r.getString(6));
				}
			} 
			catch (SQLException e) {
			e.getMessage();
			System.out.println(e);
			e.printStackTrace();
			System.out.println("algo va mal en la consulta");
		}
		return aux;
		
	}
	public PuebloBean [] consultarPorEstados(int codEstado){
		PuebloBean[] aux=null;
		String query="SELECT * FROM pueblos WHERE estado in ("
				+ "SELECT nombreEstado FROM estadosalfa WHERE estadoID="+codEstado+")";
		//System.out.println(query);
		try {
			
			Statement consulta = this.conDao.createStatement();
			
			int rowcount = 0;
			
			ResultSet r = consulta.executeQuery(query);
			if (r.last()) {
			  rowcount = r.getRow();
			  r.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
			}
			if(r!=null)
			{	
				aux=new PuebloBean[rowcount];
				int i=0;
				while(r.next()){	
					aux[i]=new PuebloBean();
					aux[i].setNombrePueblo(r.getString(2));
					aux[i].setEstado(r.getString(3));
					aux[i].setLatitude(r.getDouble(4));
					aux[i].setUrlDescripcion(r.getString(6));
					aux[i++].setLongitude(r.getDouble(5));
					}
				} 
		}catch (SQLException e) {
			e.getMessage();
			System.out.println(e);
			e.printStackTrace();
			System.out.println("algo va mal en la consulta");
		}
		return aux;
		
	}
	public PuebloBean [] getAllPueblos(){
		PuebloBean []aux=null;

		String query="SELECT * FROM pueblos";
		//System.out.println(query);
		try {
			Statement consulta = this.conDao.createStatement();
			int rowcount = 0;
			
			ResultSet r = consulta.executeQuery(query);
			if (r.last()) {
			  rowcount = r.getRow();
			  r.beforeFirst(); // not rs.first() because the rs.next() below will move on, missing the first element
			}
			if(r!=null)
			{	
				aux=new PuebloBean[rowcount];
				System.out.println("Tamano de arreglo:"+aux.length);
				int i=0;
				while(r.next()){
					aux[i]=new PuebloBean();
					aux[i].setNombrePueblo(r.getString(2));
					aux[i].setEstado(r.getString(3));
					aux[i].setLatitude(r.getDouble(4));
					aux[i].setUrlDescripcion(r.getString(6));
					aux[i++].setLongitude(r.getDouble(5));
					}
			}
		}catch (SQLException e) {
			e.getMessage();
			System.out.println(e);
			e.printStackTrace();
			System.out.println("algo va mal en la consulta");
		}
		return aux;
		
	}
	public String cargarLista(int codigo){
		String result="";
		PuebloBean[] allPueblos=this.consultarPorEstados(codigo);
		for(int i=0;i<allPueblos.length;i++){
			result+="<option value='"+(i+1)+"'>"+allPueblos[i].getNombrePueblo()+"</option>";
			//System.out.println("Result es:"+result);
		}
		return result;
	}
	public String cargarEstados(){
		String result="";
		String query="SELECT distinct estado FROM pueblos ORDER BY estado";
		System.out.println(query);
		try {
			
			Statement consulta = this.conDao.createStatement();
			ResultSet r = consulta.executeQuery(query);
			if(r!=null)
			{	
				int i=1;
				while(r.next()){	
					result+="<option value='"+i+"'>"+r.getString(1)+"</option>";
					i++;
				}
			} 
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			//System.out.println("algo va mal en la consulta");
		}
		
		return result;
	}
	
	public static void main(String args[])
	{
		ConexionBD cbd= new ConexionBD();
		PropiedadesConexion pbd = new CargarPropiedades().getPropiedades("./WebContent/conf/config.properties");
		String a = cbd.conectar(pbd.getUrl(),pbd.getUser(),pbd.getPass());
		System.out.println(a);
		PuebloDao pdao = new PuebloDao();
		pdao.setConDao(cbd.getCon());
		PuebloBean p= pdao.consultarPueblo("Comala");
		String rr= p.getNombrePueblo();
		System.out.println(rr);
	}
}
