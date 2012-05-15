package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LimpiarBD
 */
@WebServlet("/LimpiarBD")
public class LimpiarBD extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException {
		
		String idDept = request.getParameter("idDepartamento");
        HttpSession session = request.getSession();
        String exito = "Probando";
        String error = "";
        
		System.out.println("ID de dept: " + idDept);
		
		session.setAttribute("exito", exito);
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
		try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LimpiarBD.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LimpiarBD.class.getName()).log(Level.SEVERE, null, ex);
        }
	}

}
