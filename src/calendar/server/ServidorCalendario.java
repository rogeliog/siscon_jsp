/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package calendar.server;

import calendar.data.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


/**
 *
 * @author guillermopunzet
 */
@WebServlet(name = "ServidorCalendario", urlPatterns = {"/ServidorCalendario"})
public class ServidorCalendario extends HttpServlet {

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
        
        String objeto = request.getParameter("objeto");
        
        if (objeto == null)
        {
            int indexUsuario = Integer.parseInt(request.getParameter("id"));
            
            Usuario usuario = UsuarioDB.seleccionaUsuarioPorId(indexUsuario);

            Horario horario = HorarioDB.getHorarioProfesor(usuario.getIdUsuario());

            ArrayList<Actividad> actividades = horario.getActividades();

            try
            {
                JSONObject responseObj = new JSONObject();

                Iterator itr = actividades.iterator();

                List<JSONObject> act = new LinkedList<JSONObject>();

                while(itr.hasNext())
                {
                    JSONObject actObj = new JSONObject();
                    Actividad a = (Actividad) itr.next();

                    actObj.put("materia", a.getMateria());
                    actObj.put("nombreMateria", a.getNombreMateria());
                    actObj.put("nombreUsuario", a.getNombreUsuario());
                    actObj.put("apellidoUsuario", a.getApellidoUsuario());
                    actObj.put("curso", a.getCurso());
                    actObj.put("fechaInicio", a.getFechaInicio());
                    actObj.put("fechaFin", a.getFechaFin());
                    actObj.put("salon", a.getSalon());
                    act.add(actObj);
                }

                responseObj.put("horario", act);

                PrintWriter writer = response.getWriter();
                writer.write(responseObj.toString());
                writer.flush();

            }
            catch (Exception e)
            {
                throw new ServletException(e);
            }
        }
        else if (objeto.equals("salon"))
        {
            String claveSalon = request.getParameter("id");
            
            Salon salon = SalonDB.seleccionaSalonPorClave(claveSalon);

            Horario horario = salon.getHorario();

            ArrayList<Actividad> actividades = horario.getActividades();

            try
            {
                JSONObject responseObj = new JSONObject();

                Iterator itr = actividades.iterator();

                List<JSONObject> act = new LinkedList<JSONObject>();

                while(itr.hasNext())
                {
                    JSONObject actObj = new JSONObject();
                    Actividad a = (Actividad) itr.next();

                    actObj.put("materia", a.getMateria());
                    actObj.put("nombreMateria", a.getNombreMateria());
                    actObj.put("nombreUsuario", a.getNombreUsuario());
                    actObj.put("apellidoUsuario", a.getApellidoUsuario());
                    actObj.put("curso", a.getCurso());
                    actObj.put("fechaInicio", a.getFechaInicio());
                    actObj.put("fechaFin", a.getFechaFin());
                    actObj.put("salon", a.getSalon());
                    act.add(actObj);
                }

                responseObj.put("horario", act);

                PrintWriter writer = response.getWriter();
                writer.write(responseObj.toString());
                writer.flush();

            }
            catch (Exception e)
            {
                throw new ServletException(e);
            }
        }
        else if (objeto.equals("grupos"))
        {

            String id = request.getParameter("id");
            String segment[] = id.split("-");
            String materia   = segment[0];
            int curso        = Integer.parseInt(segment[1]);
           
            Horario horario = HorarioDB.getHorarioMateria(materia, curso);
//            System.out.println(materia);
//            System.out.println(curso);
            ArrayList<Actividad> actividades = horario.getActividades();

            try
            {
                JSONObject responseObj = new JSONObject();

                Iterator itr = actividades.iterator();

                List<JSONObject> act = new LinkedList<JSONObject>();

                while(itr.hasNext())
                {
                    JSONObject actObj = new JSONObject();
                    Actividad a = (Actividad) itr.next();

                    actObj.put("materia", a.getMateria());
                    actObj.put("nombreMateria", a.getNombreMateria());
                    actObj.put("nombreUsuario", a.getNombreUsuario());
                    actObj.put("apellidoUsuario", a.getApellidoUsuario());
                    actObj.put("curso", a.getCurso());
                    actObj.put("fechaInicio", a.getFechaInicio());
                    actObj.put("fechaFin", a.getFechaFin());
                    actObj.put("salon", a.getSalon());
                    act.add(actObj);
                }

                responseObj.put("horario", act);

                PrintWriter writer = response.getWriter();
                writer.write(responseObj.toString());
                writer.flush();

            }
            catch (Exception e)
            {
                throw new ServletException(e);
            }
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
