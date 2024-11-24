/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DatabaseConnection.ModeloAsistenciaGeneral;

/**
 *
 * @author Pc
 */
@WebServlet(name = "ConsultarAsistenciaGeneralServlet", urlPatterns = {"/ConsultarAsistenciaGeneralServlet"})
public class ConsultarAsistenciaGeneralServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_IP = "localhost";
    private static final String DB_PORT = "3306";
    private static final String DB_NAME = "corpusfit";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");

        // Crear una instancia de ConexionBd
        ConexionBd con = new ConexionBd(DB_IP, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD);

        if ("consultarAsistencias".equalsIgnoreCase(accion)) {
            String id_miembro = request.getParameter("id_miembro");
            String mensaje = null;

            if (id_miembro == null || id_miembro.isEmpty()) {
                mensaje = "El ID del miembro es obligatorio para consultar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "SELECT * FROM asistencia_general WHERE id_miembro = ?";
                    List<ModeloAsistenciaGeneral> asistencias = new ArrayList<>();

                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setString(1, id_miembro);
                        ResultSet rs = statement.executeQuery();

                        while (rs.next()) {
                            ModeloAsistenciaGeneral asistencia = new ModeloAsistenciaGeneral();
                            asistencia.setId_asistencia(rs.getInt("id_asistencia"));
                            asistencia.setId_miembro(rs.getInt("id_miembro"));
                            asistencia.setFecha_asistencia(rs.getDate("fecha_asistencia"));
                            asistencia.setHora_entrada(rs.getTime("hora_entrada"));
                            asistencia.setHora_salida(rs.getTime("hora_salida"));
                            asistencias.add(asistencia);
                        }

                        if (asistencias.isEmpty()) {
                            mensaje = "No se encontraron asistencias para el miembro especificado.";
                        } else {
                            HttpSession session = request.getSession();
                            session.setAttribute("asistencias", asistencias);
                            mensaje = "Consulta realizada con éxito.";
                        }
                    }
                    con.cerrar();
                } catch (SQLException e) {
                    mensaje = "Error al conectar con la base de datos: " + e.getMessage();
                } catch (Exception e) {
                    mensaje = "Error inesperado: " + e.getMessage();
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("mensaje", mensaje);
            session.setAttribute("id_miembro", id_miembro);
            response.sendRedirect(request.getContextPath() + "/cliente/consultarAsistenciaGeneral.jsp");
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("asistencias");
            session.removeAttribute("id_miembro");
            session.removeAttribute("mensaje");

            response.sendRedirect(request.getContextPath() + "/cliente/consultarAsistenciaGeneral.jsp");
            return;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
