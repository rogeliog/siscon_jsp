package servlets;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Conexion;
import clases.Usuarios;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
*
* @author Ana
*/
@WebServlet("/CambiaPerfil")
public class CambiaPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
	        response.setContentType("text/html;charset=UTF-8");
	        Connection con = Conexion.con();
	        Statement query = (Statement) con.createStatement();
	        
	        HttpSession session = request.getSession();
	        
	        Usuarios usuarioLoggeado = (Usuarios) request.getSession().getAttribute("usuario");
	       
	        String cambios = "";
	        String error = "";
	        int cont = 0;
	        
	        String pswdVieja = request.getParameter("pswdV");
	        String pswdNueva = request.getParameter("pswdC");
	        
	        String contraseniaMD5 = "";
	        String contraseniaNuevaMD5 = "";
	        
	        boolean cambiarPswd;
	        
		      //convertir contrasenia vieja a MD5
	    		MessageDigest m = MessageDigest.getInstance("MD5");
	    		m.update(pswdVieja.getBytes(), 0, pswdVieja.length());
	    		contraseniaMD5 = new BigInteger(1, m.digest()).toString(16);
	    		
	    		if(pswdNueva.equals("")) {
	    			cambiarPswd = false;
	    		}
	    		else {
	    			//convertir contrasenia nueva a MD5
		    		MessageDigest d = MessageDigest.getInstance("MD5");
		    		d.update(pswdNueva.getBytes(), 0, pswdNueva.length());
		    		contraseniaNuevaMD5 = new BigInteger(1, d.digest()).toString(16);
		    		cambiarPswd = true;
	    		}
	    		
	    	//cambiar contrasenia
	    		
	    	String q = "SELECT * FROM Usuario WHERE idUsuario='" + usuarioLoggeado.getMatricula() + "' and password ='" + contraseniaMD5 + "'";
	    	ResultSet rs = query.executeQuery(q);
	    	while (rs.next()) {
	        	cont++;	        	
	        }
	    	
	    	if(cont == 1) {
	    		if(cambiarPswd) {
		    		q = "UPDATE Usuario SET `password` = '" + contraseniaNuevaMD5 + "' WHERE `idUsuario` = '" + usuarioLoggeado.getMatricula() + "'";
		        	query.executeUpdate(q);
	    		}
	    		
	        	//cambiar telefonos
		    	String telefonos[] = request.getParameter("telefonos").split("\\n");
		    	
		    	q = "DELETE FROM Telefono WHERE indexUsuario = " + usuarioLoggeado.IdU();
		    	query.executeUpdate(q);
		    	
		    	for(int i = 0; i < telefonos.length; i++) {
	                if (telefonos[i].indexOf('-') == -1) {
	                  query.executeUpdate("INSERT INTO Telefono (`indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES ('" + usuarioLoggeado.IdU() + "', '" + 
	                     usuarioLoggeado.IdD() + "', '" + telefonos[i] + "', ' ')");
	                  }
	                else {
	                  query.executeUpdate("INSERT INTO Telefono (`indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES ('" + usuarioLoggeado.IdU() + "', '" + 
	                     usuarioLoggeado.IdD() + "', '" + telefonos[i].split("-")[0] + "', '" + telefonos[i].split("-")[1] + "')");
	                }
	            }
		    	
		    	usuarioLoggeado.setTelefonos(telefonos);
		    	
		    	cambios = "Se han realizado los cambios";
	        	session.setAttribute("cambios", cambios);
	    	}
	    	
	    	else {
	    		error = "La contrase&ntilde;a actual es incorrecta. Intenta otra vez.";
	    		session.setAttribute("error", error);
	    	}
	    	
	        response.sendRedirect("perfil.jsp");
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
    @Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(CambiaPerfil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | NoSuchAlgorithmException ex) {
            Logger.getLogger(CambiaPerfil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
