package model.bean;

public class User {
	private int id_user;
	private int id_role;
	private String username;
	private String password;
	private String token;
	private String fullname;
	private String address;
	private String city;
	private int gender;
	private String email;;
	private String phone;
	private String birthhday;
	private String date_join;
	private String avatar;
	private int rate;
	private int enabled;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id_user, int id_role, String username, String password, String token, String fullname,
			String address, String city, int gender, String email, String phone, String birthhday, String date_join,
			String avatar, int rate, int enabled) {
		super();
		this.id_user = id_user;
		this.id_role = id_role;
		this.username = username;
		this.password = password;
		this.token = token;
		this.fullname = fullname;
		this.address = address;
		this.city = city;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.birthhday = birthhday;
		this.date_join = date_join;
		this.avatar = avatar;
		this.rate = rate;
		this.enabled = enabled;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getId_role() {
		return id_role;
	}
	public void setId_role(int id_role) {
		this.id_role = id_role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthhday() {
		return birthhday;
	}
	public void setBirthhday(String birthhday) {
		this.birthhday = birthhday;
	}
	public String getDate_join() {
		return date_join;
	}
	public void setDate_join(String date_join) {
		this.date_join = date_join;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	
}
