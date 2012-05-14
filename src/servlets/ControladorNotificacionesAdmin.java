package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

import clases.Conexion;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
/**
 * Servlet implementation class ControladorNotificaciones
 */
@WebServlet("/ControladorNotificacionesAdmin")
public class ControladorNotificacionesAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException {
		        response.setContentType("text/html;charset=UTF-8");
		    
		        Connection con = Conexion.con();
		        Statement query = (Statement) con.createStatement();
		        
		        String acepta = (String) request.getParameter("acepta");
				String rechaza = (String) request.getParameter("rechaza");
				String id = (String)request.getParameter("id");
				String esAdmin = (String)request.getParameter("Admin");
				
				
				if(acepta.equals("true")) {		        
		            if(esAdmin != null){
		            	query.executeUpdate("UPDATE Usuario SET alta = 1,administrador = 1, buscarHorarioProfesores = 1,buscarHorarioMateria = 1"
		            		+", buscarHorarioSalon=1 WHERE indexUsuario='"+ id +"'");
		            }else{
		            	query.executeUpdate("UPDATE Usuario SET alta = 1, buscarHorarioProfesores = 1,buscarHorarioMateria = 1"
			            		+", buscarHorarioSalon=1 WHERE indexUsuario='"+ id +"'");
		            }
		            query.executeUpdate("DELETE from tablaNotificacion where indexUsuario ='"+ id +"'");

				}
				
				else if(rechaza.equals("true")){
					query.executeUpdate("DELETE FROM tablaNotificacion WHERE indexUsuario ='"+ id +"'");			
				}
			
				String forward = "/notificaciones_admin.jsp";
				ServletContext sc = this.getServletContext();
				RequestDispatcher dispatcher = sc.getRequestDispatcher(forward);
				dispatcher.forward(request, response);
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
	            Logger.getLogger(ControladorNotificaciones.class.getName()).log(Level.SEVERE, null, ex);
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
	            Logger.getLogger(ControladorNotificaciones.class.getName()).log(Level.SEVERE, null, ex);
	        }
	    }

}
