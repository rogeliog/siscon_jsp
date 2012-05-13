package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
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

import clases.Usuarios;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
/**
 * Servlet implementation class ControladorNotificaciones
 */
@WebServlet("/ControladorNotificaciones")
public class ControladorNotificaciones extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException {
		        response.setContentType("text/html;charset=UTF-8");
		        try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        String url = "jdbc:mysql://localhost/SISCON";
		        Connection con = (Connection) DriverManager.getConnection(url, "root", "");
		        Statement query = (Statement) con.createStatement();
		        
		        String acepta = (String) request.getParameter("acepta");
				String rechaza = (String) request.getParameter("rechaza");
				String tipo = (String) request.getParameter("tipo");
				String id = (String)request.getParameter("id");
				String esAdmin = (String)request.getParameter("Admin");
				
				Usuarios usuariologgeado = (Usuarios) request.getSession().getAttribute("usuario");
				
				if(acepta.equals("true")) {		        	
		            String q = "SELECT * FROM `Usuario` WHERE alta = 1 AND rol = '" + tipo + "' AND `idDepartamento` = " + usuariologgeado.IdD()+"";
		            ResultSet rs = query.executeQuery(q);
		            int prof, materia, salon;
		            prof = materia = salon = 0;
		            if(tipo.charAt(0) != 'O') {
		            	while(rs.next()) {
		            		prof = rs.getBoolean("buscarHorarioProfesores") ? 1 : 0;
		            		materia = rs.getBoolean("buscarHorarioMateria") ? 1 : 0;
		            		salon = rs.getBoolean("buscarHorarioSalon") ? 1 : 0;
		            	}
		        	}
		            
		            if(esAdmin != null){
		            	query.executeUpdate("UPDATE Usuario SET alta = 1,rol ='"+tipo+"',administrador = 1, buscarHorarioProfesores = "+prof+",buscarHorarioMateria ="
		            			+materia+", buscarHorarioSalon="+salon+" WHERE indexUsuario='"+ id +"'");
		            }else{
		            	query.executeUpdate("UPDATE Usuario SET alta = 1,rol ='"+tipo+"',buscarHorarioProfesores = "+prof+",buscarHorarioMateria ="
		            			+materia+", buscarHorarioSalon="+salon+" WHERE indexUsuario='"+ id +"'");
		            }
		            query.executeUpdate("DELETE from tablaNotificacion where indexUsuario ='"+ id +"'");

				}
				
				else if(rechaza.equals("true")){
					query.executeUpdate("DELETE FROM tablaNotificacion WHERE indexUsuario ='"+ id +"'");			
				}
			
				String forward = "/notificaciones.jsp";
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
