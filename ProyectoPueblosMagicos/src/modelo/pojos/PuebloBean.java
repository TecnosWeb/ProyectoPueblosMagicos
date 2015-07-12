package modelo.pojos;

public class PuebloBean {

	private String nombrePueblo;
	private String Estado;
	private long latitude;
	private long longitude;
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
	public long getLatitude() {
		return latitude;
	}
	public void setLatitude(long latitude) {
		this.latitude = latitude;
	}
	public long getLongitude() {
		return longitude;
	}
	public void setLongitude(long longitude) {
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
