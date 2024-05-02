package model;

public class GalaxyRetailersModel {
	private String userName;
    private String firstName;
    private String lastName; 
    private String address;
    private String email;
    private String phoneNumber;
    private String password;

    public GalaxyRetailersModel(String userName, String firstName, String lastName, String address, String email, String phoneNumber, String password) {
    	this.userName = userName;
    	this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
    }

    // Getter methods for the fields
    public String getUserName() {
        return userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

   
    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getPassword() {
        return password;
    }
}

