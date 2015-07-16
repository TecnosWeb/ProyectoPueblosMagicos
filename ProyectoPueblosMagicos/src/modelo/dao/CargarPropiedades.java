package modelo.dao;
import java.util.Properties;
import java.io.*;

import modelo.pojos.PropiedadesConexion;

public class CargarPropiedades {
	
	public PropiedadesConexion getPropiedades(String ruta)
	{
		PropiedadesConexion pc = null;
		Properties prop = new Properties();
		InputStream input = null; 
		try {
			pc=new PropiedadesConexion();
			input = new FileInputStream(ruta);
			prop.load(input);
			pc.setUrl(prop.getProperty("url"));
			pc.setUser(prop.getProperty("user"));
			pc.setPass(prop.getProperty("pass"));
			//pc.print();
		} catch ( IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pc;
	}
	
	/*public static void main(String args[])
	{
		CargarPropiedades cp = new CargarPropiedades();
		cp.getPropiedades("./WebContent/conf/config.properties");
		
	}*/
	
}
