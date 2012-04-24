package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

/**
*
* @author Ana
*/
@WebServlet("/Registro")
public class Registro extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
   
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException, SQLException {
       response.setContentType("text/html;charset=UTF-8");
       
       String url = "jdbc:mysql://localhost/SISCON";
       Connection con = (Connection) DriverManager.getConnection(url, "root", "");
       Statement query = (Statement) con.createStatement();
       
       HttpSession session = request.getSession();
       String not = "";
       String error = "";
       
       String matricula = request.getParameter("matricula");
       String contrasenia = request.getParameter("contraseniaC");
       String nombre = request.getParameter("nombre");
       String apellidos = request.getParameter("apellidoP") + " " + request.getParameter("apellidoM");
       char genero = request.getParameter("sexo").charAt(0);
       int departamento = Integer.parseInt(request.getParameter("departamento"));
       String email = request.getParameter("email");
       String telefonos[] = request.getParameter("telefonos").split("\\n");
       
       int cont = 0;
       String c = "SELECT * FROM usuario WHERE idUsuario='" + matricula + "'";
       ResultSet rs = query.executeQuery(c);
       while(rs.next()) {
    	   cont++;
       }
       
       if(cont > 0) {
    	   not = "Ese usuario ya est&aacute; registrado.";
           session.setAttribute("error", error);    
       }
       
       else {
    	   String q = "INSERT INTO usuario (`idDepartamento`, `idUsuario`, `nombreUsuario`, `apellidoUsuario`, `genero`, `email`, `alta`, " +
    	   		"`password`, `administrador`, `rol`) VALUES ('" + departamento + "', '" + matricula + "', '" + nombre + "', '" + apellidos + "', '" + 
    			   genero + "', '" + email + "', 0, '" + contrasenia + "', 0, 'P')";
          
          query.executeUpdate(q);
          
          String qe = "SELECT * FROM usuario WHERE idUsuario='" + matricula + "'";
          int index = -1;
          rs = query.executeQuery(qe);
          while (rs.next()) {
       	   	index = rs.getInt("indexUsuario");
          }
          
          for(int i = 0; i < telefonos.length; i++) {
       	   if (telefonos[i].indexOf('-') == -1) {
       		   query.executeUpdate("INSERT INTO telefono (`indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES ('" + index + "', '" + 
       			   departamento + "', '" + telefonos[i] + "', ' ')");
       	   }
       	   else {
       		   query.executeUpdate("INSERT INTO telefono (`indexUsuario`, `idDepartamento`, `telefono`, `extension`) VALUES ('" + index + "', '" + 
       			   departamento + "', '" + telefonos[i].split("-")[0] + "', '" + telefonos[i].split("-")[1] + "')");
       	   }
          }
          
          String qr = "INSERT INTO tablanotificacion (`indexUsuario`, `idDepartamento`) VALUES ('" + index + "', '" + departamento + "')";
          query.executeUpdate(qr);
          
          not = "Su solicitud de registro ha sido completada. ";
          session.setAttribute("not", not); 	   
       }
       
       RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/registrar_usuario.jsp");
       dispatcher.forward(request, response);
     
   }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /** 
    * Handles the HTTP <code>GET</code> method.
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (SQLException ex) {
           Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
       }
   }

   /** 
    * Handles the HTTP <code>POST</code> method.
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
       try {
           processRequest(request, response);
       } catch (SQLException ex) {
           Logger.getLogger(Registro.class.getName()).log(Level.SEVERE, null, ex);
       }
   }

   /** 
    * Returns a short description of the servlet.
    * @return a String containing servlet description
    */
   @Override
   public String getServletInfo() {
       return "Short description";
   }// </editor-fold>
}
