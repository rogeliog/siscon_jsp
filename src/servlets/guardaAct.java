/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clases.Usuarios;

/**
 *
 * @author Fernando
 */
@WebServlet("/guardaAct")
public class guardaAct extends HttpServlet {

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
            try
            {   
                /* Conexión a la base de datos */
	        Class.forName( "com.mysql.jdbc.Driver" );
		connection = DriverManager.getConnection("jdbc:mysql://localhost/SISCON","root","");
            }catch(Exception e){
                e.printStackTrace();
            }
            /* Lectura de archivos de la forma */
            Usuarios usuario = (Usuarios) session.getAttribute("usuario");
            int idDepartamento = usuario.IdD();
            int indexUsuario = usuario.IdU(); 
            String horaInicio = request.getParameter("horaInicio");
            String horaFin = request.getParameter("horaFin");
            String actividad = request.getParameter("actividad");
            String[] dias = request.getParameterValues("dias");
            String[] arr1 = horaInicio.split(":");
        	String[] arr2 = horaFin.split(":");
        	
        	Double diferencia = Integer.parseInt(arr2[0]) - Integer.parseInt(arr1[0]) + 0.0;
        	
        	if(Integer.parseInt(arr2[1]) > 0){
            diferencia = diferencia + 0.5;
        	}
        	if(Integer.parseInt(arr1[1]) > 0){
            diferencia = diferencia - 0.5;
        	}
            
            /* Guarda actividad en la base de datos */
            Statement statement = connection.createStatement();
            String query = "";
            for(int i=0; i<dias.length; i++){
                query = "INSERT INTO actividadesExtra (`idDepartamento`, `indexUsuario`, `idPeriodo`, `diaSemana`, `horaInicio`, `horaFin`, `duracion`, `actividad`) VALUES ("+idDepartamento+", "+indexUsuario + ", " + "201111" + ", '" + dias[i]+"', '"+horaInicio+"', '"+horaFin+"', "+ diferencia +", '"+actividad+"');";
                statement.executeUpdate(query);
            }
            connection.close();
            Usuarios usuario2 = (Usuarios) session.getAttribute("usuario");
            int indexUsuario2 = usuario2.IdU();
            
            ServletContext sc = getServletContext();
            RequestDispatcher rd = sc.getRequestDispatcher("/horario_usuario.jsp?id="+indexUsuario2);
            rd.forward(request, response);
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
            Logger.getLogger(guardaAct.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(guardaAct.class.getName()).log(Level.SEVERE, null, ex);
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