package controller.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.GalaxyRetailersModel;
import util.StringUtils;

public class DatabaseController {
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/galaxy retailers"; // Corrected URL
        String user = "root";
        String pass = "";
        return DriverManager.getConnection(url, user, pass);
    }

    public int addUser(GalaxyRetailersModel user) {
        try {
            PreparedStatement st = getConnection().prepareStatement(StringUtils.INSERT_USER);

            st.setString(1, user.getUserName()); // Corrected method calls
            st.setString(2, user.getFirstName());
            st.setString(3, user.getLastName());
            st.setString(4, user.getAddress());
            st.setString(5, user.getEmail());
            st.setString(6, user.getPhoneNumber());
            st.setString(7, user.getPassword());

            int result = st.executeUpdate();

            if (result > 0) {
                return 1;
            } else {
                return 0;
            }

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    public int getUserInfo(String userName, String password) {
        try (Connection con = getConnection()) {
            PreparedStatement st = con.prepareStatement(StringUtils.GET_LOGIN_USER);
            st.setString(1, userName); 
            ResultSet result = st.executeQuery();

            if (result.next()) {
                // User name and password match in the database
                String userDb = result.getString("UserName"); // Change column name
                String passwordDb = result.getString("UserPassword"); // Change column name

                if (userDb.equals(userName) && passwordDb.equals(password))
                    return 1;
                else
                    return 0;
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace(); // Log the exception for debugging
            return -1;
        }
    }
}
