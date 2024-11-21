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

/**
 *
 * @author Pc
 */
@WebServlet(name = "ClienteServlet", urlPatterns = {"/ClienteServlet"})
public class ClienteServlet extends HttpServlet {

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

        // Acción de registrar un nuevo miembro
        if ("registrar".equalsIgnoreCase(accion)) {
            String cedula = request.getParameter("cedula");
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");

            if (nombre == null || nombre.isEmpty()) {
                out.println("<h3>El nombre es obligatorio.</h3>");
                return;
            }

            // Realizar la conexión a la base de datos y registrar el nuevo miembro
            try {
                // Conectar a la base de datos MySQL
                con.ConexionBdMySQL();

                String query = "INSERT INTO miembros (cedula, nombre, telefono, email) VALUES (?, ?, ?, ?)";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setString(1, cedula);
                    statement.setString(2, nombre);
                    statement.setString(3, telefono);
                    statement.setString(4, email);

                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        out.println("<h3>Registro exitoso.</h3>");
                    } else {
                        out.println("<h3>Error al registrar el miembro.</h3>");
                    }
                }
                con.cerrar();  // Cerrar la conexión

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error al conectar con la base de datos: " + e.getMessage() + "</h3>");
            } catch (Exception e) {
                out.println("<h3>Error inesperado: " + e.getMessage() + "</h3>");
            }
        }

        // Acción de buscar un miembro
        if ("buscar".equalsIgnoreCase(accion)) {
            String cedula = request.getParameter("cedula");

            if (cedula == null || cedula.isEmpty()) {
                out.println("<h3>La cédula es obligatoria para buscar.</h3>");
                return;
            }

            try {
                // Conectar a la base de datos MySQL
                con.ConexionBdMySQL();

                String query = "SELECT * FROM miembros WHERE cedula = ?";
                try (PreparedStatement statement = con.getConexionBd().prepareStatement(query)) {
                    statement.setString(1, cedula);

                    var resultSet = statement.executeQuery();
                    if (resultSet.next()) {
                        // Extraer datos del miembro encontrado
                        String nombre = resultSet.getString("nombre");
                        String telefono = resultSet.getString("telefono");
                        String email = resultSet.getString("email");

                        // Mostrar los datos al cliente
                        out.println("<h3>Información del miembro:</h3>");
                        out.println("<p>Cédula: " + cedula + "</p>");
                        out.println("<p>Nombre: " + nombre + "</p>");
                        out.println("<p>Teléfono: " + telefono + "</p>");
                        out.println("<p>Email: " + email + "</p>");
                    } else {
                        out.println("<h3>No se encontró un miembro con la cédula proporcionada.</h3>");
                    }
                }
                con.cerrar(); // Cerrar la conexión

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error al buscar en la base de datos: " + e.getMessage() + "</h3>");
            } catch (Exception e) {
                out.println("<h3>Error inesperado: " + e.getMessage() + "</h3>");
            }
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
