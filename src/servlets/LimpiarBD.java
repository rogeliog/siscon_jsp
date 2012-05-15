package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
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
 * Servlet implementation class LimpiarBD
 */
@WebServlet("/LimpiarBD")
public class LimpiarBD extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		
		String idDept = request.getParameter("idDepartamento");
        HttpSession session = request.getSession();
        String exito = "Finalizado.";
        String error = "Error al tratar de modificar la base de datos.";
        
        Connection con = null;
        con = Conexion.con();
        Statement query;
		try {
			query = (Statement) con.createStatement();
			String q = "DELETE FROM Grupo WHERE idDepartamento="+idDept+";";
	        query.executeUpdate(q);
	        q = "DELETE FROM Horarios WHERE idDepartamento="+idDept+";";
	        query.executeUpdate(q);
	        session.setAttribute("exito", exito);
		} catch (SQLException e) {
			session.setAttribute("error", error);
			// TODO Auto-generated catch block
			Logger.getLogger(LimpiarBD.class.getName()).log(Level.SEVERE, null, e);
			e.printStackTrace();
		}
		
		response.sendRedirect("subir_archivo.jsp");
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LimpiarBD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
            processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
            processRequest(request, response);
	}

}
