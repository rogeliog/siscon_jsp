package clases;

/*
 * Clase Conexion
 * Establece la conexion a la base de datos MySQL
 * Se define el nombre de la base de datos, el nombre de usuario, el password
 * y el url para realizar la conexion.
 */

/**
 *
 * @author Oziel
 */
import java.sql.DriverManager;


import com.mysql.jdbc.Connection;

public class Conexion {
	// Datos necesarios para establecer la conexion
	static String bd = "SISCON";
	static String usuario = "root";
	static String password = "";
	static String url = "jdbc:mysql://localhost/" + bd;

	/**
	 * Método dbConnect 
	 * Establece la conexion mediante el driver JDBC	 
	 * @param db_connect_string, nombre de la base de datos.
	 * @param db_user_id, nombre de usuario
	 * @param db_password, la contraseña de la base de datos.
	 * @return Objeto Connection, la conexion a la base de datos.
	 */
	public static Connection dbConnect(String db_connect_string,
			String db_userid, String db_password) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = (Connection) DriverManager.getConnection(db_connect_string,
					db_userid, db_password);			
			return conn;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Metodo con Usado para crear la conexion con la informacion de conexion
	 * local. Es invocado por los servlets y jsp's que requieren de conexión a
	 * la base de datos.
	 * 
	 * @return Objeto Connection, la conexion a la base de datos.
	 */
	public static Connection con() {

		Connection conn = dbConnect(url, usuario, password);
		return conn;

	}

}
