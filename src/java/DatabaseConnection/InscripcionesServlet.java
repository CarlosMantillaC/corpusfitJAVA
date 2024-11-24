/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Date;

/**
 *
 * @author Pc
 */
@WebServlet(name = "InscripcionesServlet", urlPatterns = {"/InscripcionesServlet"})
public class InscripcionesServlet extends HttpServlet {

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

        ConexionBd con = new ConexionBd(DB_IP, DB_PORT, DB_NAME, DB_USER, DB_PASSWORD);

        if ("registrar".equalsIgnoreCase(accion)) {
            String id_inscripcion = request.getParameter("id_inscripcion");
            String id_miembro = request.getParameter("id_miembro");
            String id_actividad = request.getParameter("id_actividad");
            String fecha_inscripcion = request.getParameter("fecha_inscripcion");

            String mensaje = null;

            if (id_inscripcion == null || id_inscripcion.isEmpty() || id_miembro == null || id_miembro.isEmpty()
                    || id_actividad == null || id_actividad.isEmpty() || fecha_inscripcion == null || fecha_inscripcion.isEmpty()) {
                mensaje = "Todos los campos son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO inscripciones (id_inscripcion, id_miembro, id_actividad, fecha_inscripcion) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_inscripcion));
                        statement.setInt(2, Integer.parseInt(id_miembro));
                        statement.setInt(3, Integer.parseInt(id_actividad));
                        statement.setDate(4, Date.valueOf(fecha_inscripcion));

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Inscripción registrada exitosamente.";
                        } else {
                            mensaje = "Error al registrar la inscripción.";
                        }
                    }
                    con.cerrar();
                } catch (SQLException e) {
                    mensaje = "Error al conectar con la base de datos: " + e.getMessage();
                } catch (Exception e) {
                    mensaje = "Error inesperado: " + e.getMessage();
                }
            }

            if (mensaje != null && !mensaje.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", mensaje);
            }

            response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String id_inscripcion = request.getParameter("id_inscripcion");
            String id_miembro = request.getParameter("id_miembro");
            String id_actividad = request.getParameter("id_actividad");
            String fecha_inscripcion = request.getParameter("fecha_inscripcion");
            String mensaje = null;

            if (id_inscripcion == null || id_inscripcion.isEmpty()) {
                mensaje = "El ID de inscripción es obligatorio para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String updateQuery = "UPDATE inscripciones SET id_miembro = ?, id_actividad = ?, fecha_inscripcion = ? WHERE id_inscripcion = ?";
                    try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                        updateStmt.setInt(1, Integer.parseInt(id_miembro));
                        updateStmt.setInt(2, Integer.parseInt(id_actividad));
                        updateStmt.setDate(3, Date.valueOf(fecha_inscripcion));
                        updateStmt.setInt(4, Integer.parseInt(id_inscripcion));

                        int rowsUpdated = updateStmt.executeUpdate();
                        if (rowsUpdated > 0) {
                            mensaje = "Inscripción actualizada exitosamente.";
                        } else {
                            mensaje = "No se encontró la inscripción para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String id_inscripcion = request.getParameter("id_inscripcion");

            if (id_inscripcion == null || id_inscripcion.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "El ID de inscripción es obligatorio para buscar.");
                response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
                return;
            }

            try {
                con.ConexionBdMySQL();
                String query = "SELECT * FROM inscripciones WHERE id_inscripcion = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setInt(1, Integer.parseInt(id_inscripcion));

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("id_inscripcion", resultSet.getString("id_inscripcion"));
                        session_actual.setAttribute("id_miembro", resultSet.getString("id_miembro"));
                        session_actual.setAttribute("id_actividad", resultSet.getString("id_actividad"));
                        session_actual.setAttribute("fecha_inscripcion", resultSet.getString("fecha_inscripcion"));

                        response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("mensaje", "No se encontró la inscripción.");
                        response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
                    }
                }

            } catch (SQLException e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("id_inscripcion");
            session.removeAttribute("id_miembro");
            session.removeAttribute("id_actividad");
            session.removeAttribute("fecha_inscripcion");

            response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String id_inscripcion = request.getParameter("id_inscripcion");
            String mensaje = "";

            if (id_inscripcion == null || id_inscripcion.isEmpty()) {
                mensaje = "El ID de inscripción es obligatorio para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "DELETE FROM inscripciones WHERE id_inscripcion = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_inscripcion));

                        int rowsDeleted = statement.executeUpdate();
                        if (rowsDeleted > 0) {
                            mensaje = "Inscripción eliminada exitosamente.";
                        } else {
                            mensaje = "No se encontró la inscripción.";
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
            response.sendRedirect(request.getContextPath() + "/cliente/gestionarInscripciones.jsp");
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
