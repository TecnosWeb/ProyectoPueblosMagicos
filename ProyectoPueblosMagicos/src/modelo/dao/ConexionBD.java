package modelo.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

public class ConexionBD {
private Connection con;
	
public Connection getCon() {
	return con;
}


	/**
	 * @param args
	 */
public ResultSet select(String query) throws SQLException{
	Statement consulta = con.createStatement();
	ResultSet resultados = consulta.executeQuery(query);
	System.out.println("consulta creada");
	return resultados;
	
}
public String conectar(String url, String user, String pass){
		
		String conectar = "Correcto";
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			this.con = DriverManager.getConnection(url, user, pass);
			System.out.println("Conexion establecida!");
			return conectar;
			//bajar el objeto de la sesion, verificar si es nulo se crea la sesion, si no, lo creamos para validar una sola vez la conexion 
			//a la base de datos
				
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			conectar = e.getMessage();
			return conectar;
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			conectar = e.getMessage();
			return conectar;
		}
	}	
}
