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
@WebServlet(name = "FLoginServlet", urlPatterns = {"/FLoginServlet"})
public class FLoginServlet extends HttpServlet {

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
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");

            String mensaje = null;

            if (nombre == null || nombre.isEmpty() || username == null || username.isEmpty()
                    || password == null || password.isEmpty() || rol == null || rol.isEmpty()) {
                mensaje = "Todos los campos son obligatorios.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "INSERT INTO login (nombre, username, password, rol) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setString(1, nombre);
                        statement.setString(2, username);
                        statement.setString(3, password);
                        statement.setString(4, rol);

                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            mensaje = "Usuario registrado exitosamente.";
                        } else {
                            mensaje = "Error al registrar el usuario.";
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

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
        }

        if ("modificar".equalsIgnoreCase(accion)) {
            String nombre = request.getParameter("nombre");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");
            String mensaje = null;

            if (nombre == null || nombre.isEmpty() || username == null || username.isEmpty()
                    || password == null || password.isEmpty() || rol == null || rol.isEmpty()) {
                mensaje = "Todos los campos son obligatorios para modificar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    // Primero verificamos si el usuario existe
                    String checkQuery = "SELECT COUNT(*) FROM login WHERE username = ?";
                    try (PreparedStatement checkStmt = con.getConexionBd().prepareStatement(checkQuery)) {
                        checkStmt.setString(1, username);
                        var rs = checkStmt.executeQuery();
                        if (rs.next() && rs.getInt(1) > 0) {
                            // El usuario existe, procedemos a actualizar
                            String updateQuery = "UPDATE login SET nombre = ?, password = ?, rol = ? WHERE username = ?";
                            try (PreparedStatement updateStmt = con.getConexionBd().prepareStatement(updateQuery)) {
                                updateStmt.setString(1, nombre);
                                updateStmt.setString(2, password);
                                updateStmt.setString(3, rol);
                                updateStmt.setString(4, username);

                                int rowsUpdated = updateStmt.executeUpdate();
                                if (rowsUpdated > 0) {
                                    mensaje = "Usuario actualizado exitosamente.";
                                } else {
                                    mensaje = "Error al actualizar el usuario.";
                                }
                            }
                        } else {
                            mensaje = "No se encontró el usuario para modificar.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
        }

        if ("buscar".equalsIgnoreCase(accion)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "El nombre de usuario y la contraseña son obligatorios para buscar.");
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
                return;
            }

            try {
                con.ConexionBdMySQL();
                String query = "SELECT * FROM login WHERE username = ? AND password = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setString(1, username);
                    statement.setString(2, password);

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        String nombre = resultSet.getString("nombre");
                        String rol = resultSet.getString("rol");

                        HttpSession session_actual = request.getSession();
                        session_actual.setAttribute("nombre", nombre);
                        session_actual.setAttribute("username", username);
                        session_actual.setAttribute("password", password);
                        session_actual.setAttribute("rol", rol);

                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("mensaje", "No se encontró el usuario con las credenciales proporcionadas.");
                        response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
                    }
                }

            } catch (SQLException e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error al buscar en la base de datos: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
            } catch (Exception e) {
                HttpSession session = request.getSession();
                session.setAttribute("mensaje", "Error inesperado: " + e.getMessage());
                response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
            }
        }

        if ("nuevo".equals(request.getParameter("accion"))) {
            HttpSession session = request.getSession();
            session.removeAttribute("nombre");
            session.removeAttribute("username");
            session.removeAttribute("password");
            session.removeAttribute("rol");

            response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
            return;
        }

        if ("eliminar".equalsIgnoreCase(accion)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String mensaje = "";

            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                mensaje = "El nombre de usuario y la contraseña son obligatorios para eliminar.";
            } else {
                try {
                    con.ConexionBdMySQL();
                    String query = "DELETE FROM login WHERE username = ? AND password = ?";
                    try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                        statement.setString(1, username);
                        statement.setString(2, password);

                        int rowsDeleted = statement.executeUpdate();
                        if (rowsDeleted > 0) {
                            mensaje = "Usuario eliminado exitosamente.";
                        } else {
                            mensaje = "No se encontró ningún usuario con esas credenciales.";
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
            response.sendRedirect(request.getContextPath() + "/administrador/gestionarLogin.jsp");
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
