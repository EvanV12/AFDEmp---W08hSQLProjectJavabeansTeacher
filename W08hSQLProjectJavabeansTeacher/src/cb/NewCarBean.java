package cb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class NewCarBean {
	private String registration;
	private String factory;
	private String model;
	private String cc;
	private String colour;
	private String regdate;

	public NewCarBean() {
	}

	public String insert() {
		Connection conn = null;
		Statement statement = null;
		String SQLStr;
		String retString = "";

		if (registration == null || factory == null || model == null || cc == null || regdate == null
				|| registration.equals("") || factory.equals("") || model.equals("") || cc.equals("")
				|| colour.equals("") || regdate.equals("")) {
			retString = "Γεμίστε σωστά όλα τα πεδία";
		} else {
			try {
				// get connection
				conn = DriverManager.getConnection(
						"jdbc:mysql://" + "5.189.135.166:3011/test?useUnicode=yes&characterEncoding=UTF-8&useSSL=false",
						"java", "java");

				SQLStr = "INSERT INTO `test`.`car` " + "VALUES ('" + getRegistration() + "', '" + getFactory() + "', '"
						+ getModel() + "', '" + getColour() + "', " + getCc() + ", " + getRegdate() + ");";

				statement = conn.createStatement();
				statement.executeUpdate(SQLStr);

				retString = "To αυτοκίνητο καταχωρήθηκε επιτυχώς";

			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				try {
					if (statement != null) {
						statement.close();
					}
					conn.close();
				} catch (final SQLException sqlEx) {
					sqlEx.printStackTrace();
				}
			}
		}
		return retString;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCc() {
		return cc;
	}

	public void setCc(String cc) {
		this.cc = cc;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
