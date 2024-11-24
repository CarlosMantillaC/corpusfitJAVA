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

/**
 *
 * @author Pc
 */
@WebServlet(name = "AsistenciaActividadServlet", urlPatterns = {"/AsistenciaActividadServlet"})
public class AsistenciaActividadServlet extends HttpServlet {

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
            String id_asistencia = request.getParameter("id_asistencia");
            String id_miembro = request.getParameter("id_miembro");
            String id_sesion = request.getParameter("id_sesion");
            String fecha_asistencia = request.getParameter("fecha_asistencia");
            String presente = request.getParameter("presente");

            String mensaje = null;

            if (id_asistencia == null || id_asistencia.isEmpty() || id_miembro == null || id_miembro.isEmpty()
                    || id_sesion == null || id_sesion.isEmpty() || fecha_asistencia == null || fecha_asistencia.isEmpty()) {
                mensaje = "Todos los campos son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO asistencia_actividad (id_asistencia, id_miembro, id_sesion, fecha_asistencia, presente) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_asistencia));
                        statement.setInt(2, Integer.parseInt(id_miembro));
                        statement.setInt(3, Integer.parseInt(id_sesion));
                        statement.setDate(4, java.sql.Date.valueOf(fecha_asistencia));
                        statement.setInt(5, Integer.parseInt(presente));

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Asistencia registrada exitosamente.";
                        } else {
                            mensaje = "Error al registrar la asistencia.";
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

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String id_asistencia = request.getParameter("id_asistencia");
            String id_miembro = request.getParameter("id_miembro");
            String id_sesion = request.getParameter("id_sesion");
            String fecha_asistencia = request.getParameter("fecha_asistencia");
            String presente = request.getParameter("presente");
            String mensaje = null;

            if (id_asistencia == null || id_asistencia.isEmpty()) {
                mensaje = "El ID de asistencia es obligatorio para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String checkQuery = "SELECT COUNT(*) FROM asistencia_actividad WHERE id_asistencia = ?";
                    try (PreparedStatement checkStmt = con.getConexionBd().prepareStatement(checkQuery)) {
                        checkStmt.setInt(1, Integer.parseInt(id_asistencia));
                        var rs = checkStmt.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            String updateQuery = "UPDATE asistencia_actividad SET id_miembro = ?, id_sesion = ?, fecha_asistencia = ?, presente = ? WHERE id_asistencia = ?";
                            try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                                updateStmt.setInt(1, Integer.parseInt(id_miembro));
                                updateStmt.setInt(2, Integer.parseInt(id_sesion));
                                updateStmt.setDate(3, java.sql.Date.valueOf(fecha_asistencia));
                                updateStmt.setInt(4, Integer.parseInt(presente));
                                updateStmt.setInt(5, Integer.parseInt(id_asistencia));

                                int rowsUpdated = updateStmt.executeUpdate();
                                if (rowsUpdated > 0) {
                                    mensaje = "Asistencia actualizada exitosamente.";
                                } else {
                                    mensaje = "Error al actualizar la asistencia.";
                                }
                            }
                        } else {
                            mensaje = "No se encontró el registro de asistencia para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String id_asistencia = request.getParameter("id_asistencia");

            if (id_asistencia == null || id_asistencia.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "El ID de asistencia es obligatorio para buscar.");
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
                return;
            }

            try {
                con.ConexionBdMySQL();
                String query = "SELECT * FROM asistencia_actividad WHERE id_asistencia = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setInt(1, Integer.parseInt(id_asistencia));

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("id_asistencia", resultSet.getString("id_asistencia"));
                        session_actual.setAttribute("id_miembro", resultSet.getString("id_miembro"));
                        session_actual.setAttribute("id_sesion", resultSet.getString("id_sesion"));
                        session_actual.setAttribute("fecha_asistencia", resultSet.getString("fecha_asistencia"));
                        session_actual.setAttribute("presente", resultSet.getString("presente"));

                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("mensaje", "No se encontró el registro de asistencia con el ID proporcionado.");
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
                    }
                }

            } catch (SQLException e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("id_asistencia");
            session.removeAttribute("id_miembro");
            session.removeAttribute("id_sesion");
            session.removeAttribute("fecha_asistencia");
            session.removeAttribute("presente");

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String id_asistencia = request.getParameter("id_asistencia");
            String mensaje = "";

            if (id_asistencia == null || id_asistencia.isEmpty()) {
                mensaje = "El ID de asistencia es obligatorio para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "DELETE FROM asistencia WHERE id_asistencia = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_asistencia));
                        int rowsDeleted = statement.executeUpdate();

                        if (rowsDeleted > 0) {
                            mensaje = "Registro de asistencia eliminado exitosamente.";
                        } else {
                            mensaje = "No se encontró ningún registro de asistencia con ese ID.";
                        }
                    }
                    con.cerrar();
                } catch (NumberFormatException e) {
                    mensaje = "El ID de asistencia debe ser un número válido.";
                } catch (SQLException e) {
                    mensaje = "Error al conectar con la base de datos: " + e.getMessage();
                } catch (Exception e) {
                    mensaje = "Error inesperado: " + e.getMessage();
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("mensaje", mensaje);
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarAsistenciaActividad.jsp");
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
