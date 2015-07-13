package modelo.pojos;

public class PuebloBean {

	private String nombrePueblo;
	private String Estado;
	private double latitude;
	private double longitude;
	private String urlDescripcion;
	public String getNombrePueblo() {
		return nombrePueblo;
	}
	public void setNombrePueblo(String nombrePueblo) {
		this.nombrePueblo = nombrePueblo;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double d) {
		this.latitude = d;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getUrlDescripcion() {
		return urlDescripcion;
	}
	public void setUrlDescripcion(String urlDescripcion) {
		this.urlDescripcion = urlDescripcion;
	}
	public PuebloBean() {
		// TODO Auto-generated constructor stub
	}

}
