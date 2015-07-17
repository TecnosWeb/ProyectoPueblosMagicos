package modelo.dao;

import modelo.pojos.CoordenadaBean;
import modelo.pojos.PuebloBean;

public class CoordenadaDAO {

	private PuebloDao pDao=new PuebloDao();
	public CoordenadaDAO(ConexionBD cbd) {
		pDao.setConDao(cbd.getCon());
		System.out.println("pDao correcto");
		// TODO Auto-generated constructor stub
	}
	
	public PuebloBean[] pueblosEnRango(CoordenadaBean coord){
		String aux="";
		double R = 6378.137; // Radius of earth in KM
		double rad=Math.PI / 180;//pi/180
		double dLat;
		double dLon;
		PuebloBean[] allPueblos;
		allPueblos=pDao.getAllPueblos();
		//System.out.println(allPueblos.length);
		for(int i=0;i<allPueblos.length;i++){
			dLat = (coord.getLatitude() - allPueblos[i].getLatitude()) *rad;
		    dLon = (coord.getLongitude() - allPueblos[i].getLongitude()) * rad;
		    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		    Math.cos(coord.getLatitude() * rad) * Math.cos(allPueblos[i].getLatitude() *rad) *
		    Math.sin(dLon/2) * Math.sin(dLon/2);
		    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    double d = R * c;
		    if(d<=coord.getRatio()){
		    	aux+=allPueblos[i].getNombrePueblo()+",";
		    //	System.out.println("dentro del rango: "+aux);
		    }
		}
		String []pueblosAux=aux.split(",");
		//System.out.println(pueblosAux.length);
		PuebloBean[] result=new PuebloBean[pueblosAux.length];
		for(int i=0;i<pueblosAux.length;i++){
			result[i]=pDao.consultarPueblo(pueblosAux[i]);
		}
		return result;
	}
	public static void main(String args[]){
		CoordenadaBean coord = new CoordenadaBean();
		coord.setLatitude(19.6319347);
		coord.setLongitude(-99.02011270000001);
		coord.setRatio(100);
		/*CoordenadaDAO c = new CoordenadaDAO();
		PuebloBean[] result =c.pueblosEnRango(coord);
		for(PuebloBean a:result)
			a.getNombrePueblo();*/
	}
}
