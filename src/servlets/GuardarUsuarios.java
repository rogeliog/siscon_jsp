package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Conexion;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
*
* @author Ana
*/
@WebServlet("/GuardarUsuarios")
public class GuardarUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException, SQLException {
	        response.setContentType("text/html;charset=UTF-8");
<<<<<<< HEAD
	      Connection con = Conexion.con();
=======
	        Connection con = null;
	        con = Conexion.con();
>>>>>>> cfebd3bdf2b56a79e6af6a03f4e1978fc41a9a22
	        Statement query = (Statement) con.createStatement();
	        
	        HttpSession session = request.getSession();
	       
	        String cambios = "";
	        
	        int usuarios = Integer.parseInt(request.getParameter("usuarios"));
	        int users[] = new int[usuarios];
	        
	        for(int i = 0; i < users.length; i++) {
	        	users[i] = Integer.parseInt(request.getParameter("idUsers_" + i));
	        }
	        
	        String permisos[][] = new String[usuarios][2];
	       	        
	        for(int i = 0; i < permisos.length; i++) {
	        	permisos[i][0] = request.getParameter("tipo_" + users[i]);
	        	if(request.getParameterValues("Admin_" + users[i]) != null) {
	        		permisos[i][1] = "1";
	        	}
	        	else {
	        		permisos[i][1] = "0";
	        	}
	        }
	        
	        String q;
	        
	        for(int i = 0; i < permisos.length; i++) {
	        	q = "UPDATE Usuario SET `administrador` = " + Integer.parseInt(permisos[i][1]) + ", `rol` = '" + permisos[i][0].charAt(0) + 
	        			"' WHERE `Usuario`.`indexUsuario` = '" + users[i] + "'";
	        	query.executeUpdate(q);
	        }
	        
	        cambios = "Se han realizado los cambios";
	        session.setAttribute("cambios", cambios);
	        

	        // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrarUsuarios.jsp");
	        // dispatcher.forward(request, response);
           response.sendRedirect("administrarUsuarios.jsp");
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
        } catch (SQLException ex) {
            Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(IniciarSesion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
