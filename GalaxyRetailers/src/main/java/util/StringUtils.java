package util;

public class StringUtils {
	public static final String INSERT_USER = "INSERT INTO user"
			+"(UserFirstName,UserLastName,UserName,UserAddress,UserEmail,UserPhoneNumber,UserPassword)"
			+ "VALUES (?,?,?,?,?,?,?)";
	public static final String GET_LOGIN_USER = "SELECT UserName, UserPassword from user ";
	public static final String GET_All_USER = "SELECT * from user ";
}
