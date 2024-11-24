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
@WebServlet(name = "HorarioServlet", urlPatterns = {"/HorarioServlet"})
public class HorarioServlet extends HttpServlet {

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
            String id_sesion = request.getParameter("id_sesion");
            String id_actividad = request.getParameter("id_actividad");
            String fecha = request.getParameter("fecha");
            String hora_inicio = request.getParameter("hora_inicio");
            String hora_fin = request.getParameter("hora_fin");

            String mensaje = null;

            if (id_sesion == null || id_sesion.isEmpty() || id_actividad == null || id_actividad.isEmpty()
                    || fecha == null || fecha.isEmpty() || hora_inicio == null || hora_inicio.isEmpty()
                    || hora_fin == null || hora_fin.isEmpty()) {
                mensaje = "Todos los campos son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO horarios_actividad (id_sesion, id_actividad, fecha, hora_inicio, hora_fin) VALUES (?, ?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_sesion));
                        statement.setInt(2, Integer.parseInt(id_actividad));
                        statement.setDate(3, java.sql.Date.valueOf(fecha));
                        statement.setString(4, hora_inicio);
                        statement.setString(5, hora_fin);

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Horario registrado exitosamente.";
                        } else {
                            mensaje = "Error al registrar el horario.";
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

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String id_sesion = request.getParameter("id_sesion");
            String id_actividad = request.getParameter("id_actividad");
            String fecha = request.getParameter("fecha");
            String hora_inicio = request.getParameter("hora_inicio");
            String hora_fin = request.getParameter("hora_fin");
            String mensaje = null;

            if (id_sesion == null || id_sesion.isEmpty()) {
                mensaje = "El ID de sesión es obligatorio para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String checkQuery = "SELECT COUNT(*) FROM horarios_actividad WHERE id_sesion = ?";
                    try (PreparedStatement checkStmt = con.getConexionBd().prepareStatement(checkQuery)) {
                        checkStmt.setInt(1, Integer.parseInt(id_sesion));
                        var rs = checkStmt.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            String updateQuery = "UPDATE horarios_actividad SET id_actividad = ?, fecha = ?, hora_inicio = ?, hora_fin = ? WHERE id_sesion = ?";
                            try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                                updateStmt.setInt(1, Integer.parseInt(id_actividad));
                                updateStmt.setDate(2, java.sql.Date.valueOf(fecha));
                                updateStmt.setString(3, hora_inicio);
                                updateStmt.setString(4, hora_fin);
                                updateStmt.setInt(5, Integer.parseInt(id_sesion));

                                int rowsUpdated = updateStmt.executeUpdate();
                                if (rowsUpdated > 0) {
                                    mensaje = "Horario actualizado exitosamente.";
                                } else {
                                    mensaje = "Error al actualizar el horario.";
                                }
                            }
                        } else {
                            mensaje = "No se encontró el horario para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String id_sesion = request.getParameter("id_sesion");

            if (id_sesion == null || id_sesion.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "El ID de sesión es obligatorio para buscar.");
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
                return;
            }

            try {
                con.ConexionBdMySQL();
                String query = "SELECT * FROM horarios_actividad WHERE id_sesion = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setInt(1, Integer.parseInt(id_sesion));

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("id_sesion", resultSet.getString("id_sesion"));
                        session_actual.setAttribute("id_actividad", resultSet.getString("id_actividad"));
                        session_actual.setAttribute("fecha", resultSet.getString("fecha"));
                        session_actual.setAttribute("hora_inicio", resultSet.getString("hora_inicio"));
                        session_actual.setAttribute("hora_fin", resultSet.getString("hora_fin"));

                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("mensaje", "No se encontró el horario con el ID proporcionado.");
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
                    }
                }

            } catch (SQLException e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("id_sesion");
            session.removeAttribute("id_actividad");
            session.removeAttribute("fecha");
            session.removeAttribute("hora_inicio");
            session.removeAttribute("hora_fin");

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String id_sesion = request.getParameter("id_sesion");
            String mensaje = "";

            if (id_sesion == null || id_sesion.isEmpty()) {
                mensaje = "El ID de sesión es obligatorio para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "DELETE FROM horarios_actividad WHERE id_sesion = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id_sesion));

                        int rowsDeleted = statement.executeUpdate();
                        if (rowsDeleted > 0) {
                            mensaje = "Horario eliminado exitosamente.";
                        } else {
                            mensaje = "No se encontró ningún horario con ese ID.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarHorario.jsp");
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
