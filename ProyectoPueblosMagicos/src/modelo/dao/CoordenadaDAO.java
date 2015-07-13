package modelo.dao;

import modelo.pojos.CoordenadaBean;
import modelo.pojos.PuebloBean;

public class CoordenadaDAO {

	public CoordenadaDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public String[] pueblosEnRango(PuebloBean[] allPueblos,CoordenadaBean coord){
		String aux="";
		double R = 6378.137; // Radius of earth in KM
		double rad=Math.PI / 180;//pi/180
		double dLat;
		double dLon;
		
		for(int i=0;i<allPueblos.length;i++){
			System.out.println("latitud"+allPueblos[i].getLatitude());
			System.out.println("altitud"+allPueblos[i].getLongitude());
		    dLat = (coord.getLatitude() - allPueblos[i].getLatitude()) *rad;
		    dLon = (coord.getLongitude() - allPueblos[i].getLongitude()) * rad;
		    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		    Math.cos(coord.getLatitude() * rad) * Math.cos(allPueblos[i].getLatitude() *rad) *
		    Math.sin(dLon/2) * Math.sin(dLon/2);
		    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    double d = R * c;
		    System.out.println("El radio en km es "+d);
		    if(d<=coord.getRatio()){
		    	aux+=allPueblos[i].getNombrePueblo()+",";
		    	System.out.println("dentro del rango: "+aux);
		    }
		}
		
		return aux.split(",");
	}
	public static void main(String args[]){
		
		PuebloBean[] pueblos=new PuebloBean[3];
		pueblos[0]=new PuebloBean();
		pueblos[0].setLatitude(19.3190634);
		pueblos[0].setLongitude(-103.754982);
		pueblos[0].setNombrePueblo("Comala");
		pueblos[1]=new PuebloBean();
		pueblos[1].setLatitude(19.5134498);
		pueblos[1].setLongitude(-101.6091537);
		pueblos[1].setNombrePueblo("Patzcuaro");
		pueblos[2]=new PuebloBean();
			

		pueblos[2].setLatitude(19.9441384);
		pueblos[2].setLongitude(-97.95383453);
		pueblos[2].setNombrePueblo("Zacatlan");
		CoordenadaBean coord = new CoordenadaBean();
		coord.setLatitude(19.6319347);
		coord.setLongitude(-99.02011270000001);
		coord.setRatio(200);
		CoordenadaDAO c = new CoordenadaDAO();
		String[] result =c.pueblosEnRango(pueblos, coord);
		System.out.println(result.length);
		for(int i=0;i<result.length;i++)
			System.out.println("Nombre del pueblo "+result[i]+"\n");
		
	}
}
