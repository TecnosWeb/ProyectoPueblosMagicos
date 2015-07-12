package modelo.pojos;

public class PropiedadesConexion {
private String url;
private String user;
private String pass;
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

	public PropiedadesConexion() {
	// TODO Auto-generated constructor stub
	}

	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}

	public void print()
	{
		System.out.println(url);
		System.out.println(user);
		System.out.println(pass);
	}
}
