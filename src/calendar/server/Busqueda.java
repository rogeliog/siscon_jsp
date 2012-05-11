/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.server;

import calendar.data.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import calendar.queries.*;
import java.util.ArrayList;

/**
 *
 * @author guillermopunzet
 */
@WebServlet(name = "Busqueda", urlPatterns = {"/Busqueda"})
public class Busqueda extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String tipoDeConsulta = request.getParameter("tipoDeConsulta");
        String objeto = request.getParameter("objeto");
       
        String url = "/verProfesores.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        
        if (tipoDeConsulta != null)
        {
            String valor = request.getParameter("attr");
            if (valor == null)
                valor = "";

            ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
            
            usuarios = UsuarioDB.seleccionaUsuario(tipoDeConsulta, valor);

            request.setAttribute("usuarios", usuarios);

            dispatcher.forward(request, response);

       }
       else if (objeto == null)
       {
            url = "/verUsuario.jsp";

            int indexUsuario = Integer.parseInt(request.getParameter("id"));
            Usuario usuario =  UsuarioDB.seleccionaUsuarioPorId(indexUsuario);
            request.setAttribute("usuario", usuario);
            
            dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);

       }
       else if (objeto.equals("salon"))
       {
           url = "/verSalon.jsp";

           String claveSalon = request.getParameter("id");
           Salon salon = SalonDB.seleccionaSalonPorClave(claveSalon);
           request.setAttribute("salon", salon);

           dispatcher = getServletContext().getRequestDispatcher(url);
           dispatcher.forward(request, response);
       }
       else if (objeto.equals("materia"))
       {
           url = "/verMateria.jsp";
           
           String atributo1 = request.getParameter("atributo1");
           String valor1    = request.getParameter("valor1");
           
           String atributo2 = request.getParameter("anioPlan");
           
           ArrayList<Materia> materias = new ArrayList<Materia>();
           
           if (atributo2 == null)
           {
               materias = MateriaDB.seleccionaMateria(atributo1, valor1);
           }
           else
           {
               String attr2 = atributo1 + "," + "anioPlan";
               String val2  = valor1 + "," + atributo2;
               
               materias = MateriaDB.seleccionaMateria(attr2, val2);
           }
           
           dispatcher = getServletContext().getRequestDispatcher(url);
           dispatcher.forward(request, response);
       }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
