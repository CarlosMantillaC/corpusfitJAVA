/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DatabaseConnection;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
@WebServlet(name = "ActividadDeportivaServlet", urlPatterns = {"/ActividadDeportivaServlet"})
public class ActividadDeportivaServlet extends HttpServlet {

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
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String tipo = request.getParameter("tipo");
            String nivel_dificultad = request.getParameter("nivel_dificultad");
            String id_instructor = request.getParameter("id_instructor");

            String mensaje = null;

            if ( nombre == null || nombre.isEmpty() || nivel_dificultad == null || nivel_dificultad.isEmpty()) {
                mensaje = "Nivel de dificultad son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO actividades_deportivas (nombre, descripcion, tipo, nivel_dificultad, id_instructor) VALUES ( ?, ?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setString(1, nombre);
                        statement.setString(2, descripcion);
                        statement.setString(3, tipo);
                        statement.setString(4, nivel_dificultad);
                        statement.setString(5, id_instructor);

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Registro exitoso.";
                        } else {
                            mensaje = "Error al registrar la actividad deportiva.";
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

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String tipo = request.getParameter("tipo");
            String nivel_dificultad = request.getParameter("nivel_dificultad");
            String id_instructor = request.getParameter("id_instructor");
            String mensaje = null;

            if ( nombre == null || nombre.isEmpty() || nivel_dificultad == null || nivel_dificultad.isEmpty()) {
                mensaje = "Nombre y Nivel de dificultad son obligatorios para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String checkQuery = "SELECT COUNT(*) FROM actividades_deportivas WHERE nombre = ?";
                    try (PreparedStatement checkStmt = con.getConexionBd().prepareStatement(checkQuery)) {
                        checkStmt.setString(1, nombre);
                        var rs = checkStmt.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            String updateQuery = "UPDATE actividades_deportivas SET descripcion = ?, tipo = ?, nivel_dificultad = ?, id_instructor = ? WHERE nombre = ?";
                            try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                                updateStmt.setString(1, descripcion);
                                updateStmt.setString(2, tipo);
                                updateStmt.setString(3, nivel_dificultad);
                                updateStmt.setString(4, id_instructor);
                                updateStmt.setString(5, nombre);
                                int rowsUpdated = updateStmt.executeUpdate();
                                if (rowsUpdated > 0) {
                                    mensaje = "Actividad deportiva actualizada exitosamente.";
                                } else {
                                    mensaje = "Error al actualizar la actividad deportiva.";
                                }
                            }
                        } else {
                            mensaje = "No se encontró la actividad deportiva para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String nombre = request.getParameter("nombre");

            if (nombre == null || nombre.isEmpty()) {
                request.setAttribute("mensaje", "El nombre es obligatorio para buscar.");
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
                return;
            }

            try {
                con.ConexionBdMySQL();
                String query = "SELECT * FROM actividades_deportivas WHERE nombre = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setString(1, nombre);

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("nombre", resultSet.getString("nombre"));
                        session_actual.setAttribute("descripcion", resultSet.getString("descripcion"));
                        session_actual.setAttribute("tipo", resultSet.getString("tipo"));
                        session_actual.setAttribute("nivel_dificultad", resultSet.getString("nivel_dificultad"));
                        session_actual.setAttribute("id_instructor", resultSet.getString("id_instructor"));

                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
                    } else {
                        request.setAttribute("mensaje", "No se encontró la actividad deportiva con el Nombre proporcionado.");
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
            } catch (Exception e) {
                request.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("nombre");
            session.removeAttribute("descripcion");
            session.removeAttribute("tipo");
            session.removeAttribute("nivel_dificultad");
            session.removeAttribute("id_instructor");

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String nombre= request.getParameter("nombre");
            String mensaje = "";

            if (nombre == null || nombre.isEmpty()) {
                mensaje = "El Nombre es obligatorio para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "DELETE FROM actividades_deportivas WHERE nombre = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setString(1, nombre);

                        int rowsDeleted = statement.executeUpdate();
                        if (rowsDeleted > 0) {
                            mensaje = "Actividad deportiva eliminada exitosamente.";
                        } else {
                            mensaje = "No se encontró ninguna actividad deportiva con ese Nombre.";
                        }
                    }
                    con.cerrar();
                } catch (SQLException e) {
                    e.printStackTrace();
                    mensaje = "Error al conectar con la base de datos: " + e.getMessage();
                } catch (Exception e) {
                    mensaje = "Error inesperado: " + e.getMessage();
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("mensaje", mensaje);
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarActividadesDeportivas.jsp");
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
