/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DatabaseConnection;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DatabaseConnection.ConexionBd;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author carlo
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        
        // Obtener los datos del formulario
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Conexión a la base de datos
            ConexionBd con = new ConexionBd("localhost", "3306", "corpusfit", "root", "");
            con.ConexionBdMySQL();
            
            // Consulta SQL para verificar las credenciales
            String sql = "SELECT COUNT(username), username, rol FROM login WHERE username = '" 
                          + username + "' AND password = '" + password + "' GROUP BY username, rol";
            ResultSet rs = con.consultar(sql);
            
            if (rs.next() && rs.getInt(1) == 1) {  // Solo una coincidencia es permitida
                // Crear sesión para el usuario
                HttpSession session = request.getSession(true);
                session.setAttribute("USER", username);
                session.setAttribute("ROLE", rs.getString("rol"));
                
                // Redirigir a la página principal
                response.sendRedirect("adminDashboard.jsp");
            } else {
                // Redirigir a la página de login si las credenciales no son válidas
                response.sendRedirect("login.jsp");
            }
            
            rs.close();
            con.cerrar();

        } catch (SQLException e) {
            out.print("Error SQL: " + e.getMessage());
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        } finally {
            out.close();
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
