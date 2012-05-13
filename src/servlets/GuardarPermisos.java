package servlets;

import java.io.IOException;
import java.sql.DriverManager;
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

import clases.Usuarios;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

/**
*
* @author Ana
*/
@WebServlet("/GuardarPermisos")
public class GuardarPermisos extends HttpServlet {
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
	        
	        HttpSession session = request.getSession();
	       
	        String cambios = "";
	        
	        String parametros[] = 
	        	{
	        		"buscarProfesores_profesores",
	        		"buscarMaterias_profesores",
	        		"buscarSalones_profesores",
	        		"buscarProfesores_carrera",
	        		"buscarMaterias_carrera",
	        		"buscarSalones_carrera"
	        	};
	        
	        String permisos[] = new String[6];
	        
	        for(int i = 0; i < permisos.length; i++) {
	        	if(request.getParameterValues(parametros[i]) != null) {
	        		permisos[i] = "1";
	        	}
	        	else {
	        		permisos[i] = "0";
	        	}
	        }
	        
	        String q[] =
	        	{
	        		"UPDATE Usuario SET `buscarHorarioProfesores` = " + permisos[0] + " WHERE rol = 'P'",
	        		"UPDATE Usuario SET `buscarHorarioMateria` = " + permisos[1] + " WHERE rol = 'P'",
	        		"UPDATE Usuario SET `buscarHorarioSalon` = " + permisos[2] + " WHERE rol = 'P'",
	        		"UPDATE Usuario SET `buscarHorarioProfesores` = " + permisos[3] + " WHERE rol = 'C'",
	        		"UPDATE Usuario SET `buscarHorarioMateria` = " + permisos[4] + " WHERE rol = 'C'",
	        		"UPDATE Usuario SET `buscarHorarioSalon` = " + permisos[5] + " WHERE rol = 'C'",
	        	};
	        
	        for(int i = 0; i < q.length; i++) {
	        	query.executeUpdate(q[i]);
	        }
	             
	        cambios = "Se han realizado los cambios";
	        session.setAttribute("cambios", cambios);
	        
	        Usuarios usuarioLoggeado = (Usuarios) session.getAttribute("usuario");
	        if(usuarioLoggeado.getRol() == 'P') {
	        	if(permisos[0].equals("1"))
	        		usuarioLoggeado.setBuscarProfesores(true);
	        	else
	        		usuarioLoggeado.setBuscarProfesores(false);
	        	if(permisos[1].equals("1"))
	        		usuarioLoggeado.setBuscarMateria(true);
	        	else
	        		usuarioLoggeado.setBuscarMateria(false);
	        	if(permisos[2].equals("1"))
	        		usuarioLoggeado.setBuscarSalon(true);
	        	else
	        		usuarioLoggeado.setBuscarSalon(false);
	        }
	        else if(usuarioLoggeado.getRol() == 'C') {
	        	if(permisos[3].equals("1"))
	        		usuarioLoggeado.setBuscarProfesores(true);
	        	else
	        		usuarioLoggeado.setBuscarProfesores(false);
	        	if(permisos[4].equals("1"))
	        		usuarioLoggeado.setBuscarMateria(true);
	        	else
	        		usuarioLoggeado.setBuscarMateria(false);
	        	if(permisos[5].equals("1"))
	        		usuarioLoggeado.setBuscarSalon(true);
	        	else
	        		usuarioLoggeado.setBuscarSalon(false);
	        }

	        // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/administrarPermisos.jsp");
	        // dispatcher.forward(request, response);
           response.sendRedirect("administrarPermisos.jsp");
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
