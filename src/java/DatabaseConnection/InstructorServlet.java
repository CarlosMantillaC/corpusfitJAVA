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
@WebServlet(name = "InstructorServlet", urlPatterns = {"/InstructorServlet"})
public class InstructorServlet extends HttpServlet {

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

        if ("registrar".equalsIgnoreCase(accion)) {
            String id = request.getParameter("id_instructor");
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");

            String mensaje = null;

            if (id == null || id.isEmpty() || nombre == null || nombre.isEmpty()) {
                mensaje = "ID y Nombre son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO instructores (id_instructor, nombre, telefono, email) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id));
                        statement.setString(2, nombre);
                        statement.setString(3, telefono);
                        statement.setString(4, email);

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Registro exitoso.";
                        } else {
                            mensaje = "Error al registrar el miembro.";
                        }
                    }
                    con.cerrar();
                } catch (SQLException e) {
                    mensaje = "Error al conectar con la base de datos: " + e.getMessage();
                } catch (Exception e) {
                    mensaje = "Error inesperado: " + e.getMessage();
                }
            }

            // Asegurarse de que el mensaje no es null antes de guardarlo en la sesión
            if (mensaje != null && !mensaje.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", mensaje); // Guardar mensaje en la sesión
            }

            // Redirigir a gestionarClientes.jsp
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String id_instructor = request.getParameter("id_instructor");
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String mensaje = null;

            if (id_instructor == null || id_instructor.isEmpty() || nombre == null || nombre.isEmpty()) {
                mensaje = "El ID del instructor y el nombre son obligatorios para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    // Primero verificamos si el instructor existe
                    String checkQuery = "SELECT COUNT(*) FROM instructores WHERE id_instructor = ?";
                    try (PreparedStatement checkStmt = con.getConexionBd().prepareStatement(checkQuery)) {
                        checkStmt.setString(1, id_instructor);
                        var rs = checkStmt.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            // El instructor existe, procedemos a actualizar
                            String updateQuery = "UPDATE instructores SET nombre = ?, telefono = ?, email = ? WHERE id_instructor = ?";
                            try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                                updateStmt.setString(1, nombre);
                                updateStmt.setString(2, telefono);
                                updateStmt.setString(3, email);
                                updateStmt.setString(4, id_instructor);
                                int rowsUpdated = updateStmt.executeUpdate();
                                if (rowsUpdated > 0) {
                                    mensaje = "Instructor actualizado exitosamente.";
                                } else {
                                    mensaje = "Error al actualizar el instructor.";
                                }
                            }
                        } else {
                            mensaje = "No se encontró el instructor para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String id = request.getParameter("id_instructor");

            if (id == null || id.isEmpty()) {
                request.setAttribute("mensaje", "El ID es obligatorio para buscar.");
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
                return;
            }

            try {
                // Conectar a la base de datos MySQL
                con.ConexionBdMySQL();

                String query = "SELECT * FROM instructores WHERE id_instructor = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setInt(1, Integer.parseInt(id));

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        // Extraer datos del miembro encontrado
                        String id_instructor = resultSet.getString("id_instructor");
                        String nombre = resultSet.getString("nombre");
                        String telefono = resultSet.getString("telefono");
                        String email = resultSet.getString("email");

                        // Almacenar en la sesión
                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("id_instructor", id_instructor);
                        session_actual.setAttribute("nombre", nombre);
                        session_actual.setAttribute("telefono", telefono);
                        session_actual.setAttribute("email", email);

                        // Redirigir a gestionarClientes.jsp para que los datos se muestren
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
                    } else {
                        request.setAttribute("mensaje", "No se encontró un instructor con la cédula proporcionada.");
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
            } catch (Exception e) {
                request.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            // Limpiar los datos de sesión
            HttpSession session = request.getSession();
            session.removeAttribute("id_instructor");
            session.removeAttribute("nombre");
            session.removeAttribute("telefono");
            session.removeAttribute("email");

            // Redirigir de nuevo a gestionarClientes.jsp
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String id = request.getParameter("id_instructor");

            String mensaje = ""; // Mensaje para mostrar el resultado de la operación

            if (id == null || id.isEmpty()) {
                mensaje = "El ID es obligatorio para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();

                    String query = "DELETE FROM instructores WHERE id_instructor = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setInt(1, Integer.parseInt(id));

                        int rowsDeleted = statement.executeUpdate();
                        if (rowsDeleted > 0) {
                            mensaje = "Instructor eliminado exitosamente.";
                        } else {
                            mensaje = "No se encontró ningún miembro con esa cédula.";
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

            // Guardar el mensaje en la sesión y redirigir
            HttpSession session = request.getSession();
            session.setAttribute("mensaje", mensaje);
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarInstructores.jsp");
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
