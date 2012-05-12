package servlets;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorNotificaciones() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acepta = (String) request.getParameter("acepta");
		String rechaza = (String) request.getParameter("rechaza");
		String tipo = (String) request.getParameter("tipo");
		String id = (String)request.getParameter("id");
		String esAdmin = (String)request.getParameter("Admin");
		
		Usuarios usuariologgeado = (Usuarios) request.getSession().getAttribute("usuario");
		
		if(acepta.equals("true") && rechaza.equals("false")){
			String url = "jdbc:mysql://localhost/SISCON";
	        try {
	        	Connection con = (Connection) DriverManager.getConnection(url,"root","");
	            Statement query = (Statement) con.createStatement();
	        	
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
	            query.executeUpdate("delete from tablaNotificacion where indexUsuario ='"+ id +"'");
	        } catch (SQLException ex) {
//	            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
	        }
		}else if(rechaza.equals("true") && acepta.equals("false")){
			String url = "jdbc:mysql://localhost/SISCON";
	        try {
	            Connection con = (Connection) DriverManager.getConnection(url,"root","");
	            Statement query = (Statement) con.createStatement();
	            query.executeUpdate("DELETE FROM tablaNotificacion WHERE indexUsuario ='"+ id +"'");
	        } catch (SQLException ex) {
//	            Logger.getLogger(DBManager.class.getName()).log(Level.SEVERE, null, ex);
	        }
		}
		String url = "/notificaciones.jsp";
		ServletContext sc = this.getServletContext();
        RequestDispatcher dispatcher = sc.getRequestDispatcher(url);
        dispatcher.forward(request, response);
		
	}
}
