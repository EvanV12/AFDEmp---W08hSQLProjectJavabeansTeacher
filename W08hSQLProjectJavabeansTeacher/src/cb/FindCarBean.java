package cb;

import java.sql.*;
import java.util.ArrayList;

public class FindCarBean {
	private String registration = "";
	private String factory = "";
	private String model = "";
	private String cc = "";
	private String regdate = "";
	
	public FindCarBean(){}
	
	public ArrayList<Car> findCar(){
	    Connection conn = null;
		Statement statement = null;
		String SQLStr = "";
		ResultSet rs = null;
		ArrayList<Car> al = new ArrayList<Car>();
	    
		if (registration == null && factory == null && model == null &&
				cc == null && regdate == null && registration.equals("") &&
				factory.equals("") && model.equals("") && cc.equals("") &&
				regdate.equals("")) {			
			al = null;
		} else {
			SQLStr = "SELECT * FROM `test`.`car` WHERE colour like '%' ";
			if (registration != null && !registration.equals(""))
				SQLStr += "AND registration like '" + registration + "' ";
			if (factory != null && !factory.equals(""))
				SQLStr += "AND factory like '" + factory + "' ";
			if (model != null && !model.equals(""))
				SQLStr += "AND model like '" + model + "' ";
			if (cc != null && !cc.equals(""))
				SQLStr += "AND cc = " + cc + " ";
			if (regdate != null && !regdate.equals(""))
				SQLStr += "AND regdate = " + regdate + ";";	
				
			try {
		    	// get connection
		    	conn = DriverManager.getConnection("jdbc:mysql://" + 
		    				"5.189.135.166:3011/test?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", 
		    				"java", "java");
	    		
	    		System.out.println(SQLStr);
	    		statement = conn.createStatement();
	    		rs = statement.executeQuery(SQLStr);
	    		
	    		while(rs.next()){
	    			Car row = new Car();
	    			row.setRegistration(rs.getString("registration"));
	    			row.setFactory(rs.getString("factory"));
	    			row.setModel(rs.getString("model"));
	    			row.setColour(rs.getString("colour"));
	    			row.setCc(rs.getString("cc"));
	    			row.setRegdate(rs.getString("regdate"));
	    			al.add(row);
	    		}
	    		
		    } catch (SQLException sqlEx) {
		    	System.err.println(sqlEx.getMessage());
		    } catch (Exception ex) {
				System.err.println(ex.getMessage());
		    } finally {
		    	try {
			        if (statement != null) {
		        		statement.close();
			        }
			        conn.close();
		    	} catch(final SQLException sqlEx){
		    		System.err.println(sqlEx.getMessage());
		    	}
	    	}
		}
		return al;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
