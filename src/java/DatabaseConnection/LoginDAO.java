package DatabaseConnection;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author carlo
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    public String validateUser(String email, String password) {
        String role = null;
        
        try (Connection connection = DatabaseConnection.getConnection()) {
            String sql = "SELECT password, rol FROM login WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                
                // Aquí debes verificar la contraseña encriptada
                if (storedPassword.equals(password)) {
                    role = resultSet.getString("rol"); // Obtener el rol del usuario
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }
}