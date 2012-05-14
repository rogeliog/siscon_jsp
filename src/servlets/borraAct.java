/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Conexion;
import clases.Usuarios;

/**
 *
 * @author Fernando
 */
@WebServlet("/borraAct")
public class borraAct extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
            Connection connection = null;
	        HttpSession session = request.getSession();
<<<<<<< HEAD
            try
            {   
                /* Conexión a la base de datos */
	      
		connection = Conexion.con();
            }catch(Exception e){
                e.printStackTrace();
            }
=======
            connection = Conexion.con();
>>>>>>> cfebd3bdf2b56a79e6af6a03f4e1978fc41a9a22
            String id = request.getParameter("borra");
            Statement statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM actividadesExtra WHERE `idActividadesExtra`= "+id+";");
            Usuarios usuario = (Usuarios) session.getAttribute("usuario");
            int indexUsuario = usuario.IdU();
            
            // ServletContext sc = getServletContext();
            // RequestDispatcher rd = sc.getRequestDispatcher("/horario_usuario.jsp?id="+indexUsuario);
            // rd.forward(request, response);
            response.sendRedirect("horario_usuario.jsp?id="+indexUsuario);
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
            Logger.getLogger(borraAct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(borraAct.class.getName()).log(Level.SEVERE, null, ex);
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
