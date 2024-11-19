package DatabaseConnection;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author carlo
 */
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.SQLException;

public class ConexionBd {
        Connection ConexionBd;
	Statement sentencia;
	String usuario, password, iP, puerto, nombreBD;

	public ConexionBd(String iP, String puerto, String nombreBD, String usuario, String password){
		this.usuario = usuario;
		this.password = password;
		this.iP = iP;
		this.puerto = puerto;
		this.nombreBD = nombreBD;
	}

	// sw es true si va a conectar con MySQL (3306) y postgresql (5432)
	// sw es false si va a conectar con access porque es por medio del odbc
	private void conectar	(String driver, String puente, boolean sw) 
					throws ClassNotFoundException,
						SQLException,
						InstantiationException, 
						IllegalAccessException{

		Class.forName(driver).newInstance();
		if (sw)
 			ConexionBd = DriverManager.getConnection ("jdbc:"+puente+
								"://"+iP+
								":"+puerto+
								"/"+nombreBD,usuario,password);
		else
			ConexionBd = DriverManager.getConnection ("jdbc:"+puente+
								":"+nombreBD,usuario,password);
		sentencia = ConexionBd.createStatement (ResultSet.TYPE_SCROLL_SENSITIVE,
								    ResultSet.CONCUR_UPDATABLE);
	}

	// Con JDBC
	public void ConexionBdJDBC() throws 	ClassNotFoundException, 
							SQLException,
							InstantiationException,
							IllegalAccessException{
		conectar("sun.jdbc.odbc.JdbcOdbcDriver","odbc",false);
	}

	// Con MySQL
	public void ConexionBdMySQL() throws   ClassNotFoundException,
							SQLException,
							InstantiationException,
							IllegalAccessException{
	
                conectar("com.mysql.cj.jdbc.Driver", "mysql", true);
	}

	// Con PostgreSql
	public void ConexionBdPostgres() throws ClassNotFoundException,
							SQLException,
							InstantiationException,
							IllegalAccessException{
		conectar("org.postgresql.Driver","postgresql",true);
	}

	public void actualizar(String actualiza) throws SQLException{
		sentencia.executeUpdate(actualiza);
	}

	public ResultSet consultar(String consulta) throws SQLException{
		return (sentencia.executeQuery(consulta));
	}

	// Devuelve el numero de filas de la tabla virtual
	public int contar(ResultSet rS) throws SQLException{
		int cont = 0;
		rS.beforeFirst();
		while (rS.next()) cont++;
		return (cont);
	}

	public void cerrar() throws SQLException{
		ConexionBd.close();
		sentencia.close();
	}
        
            // Método para obtener la conexión (lo que nos falta en tu clase actual)
        public Connection getConexionBd() {
            return this.ConexionBd;
        }
    
}