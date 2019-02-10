package cb;

import java.sql.*;

public class DeleteCarBean {
	private String registration = "";
	
	public DeleteCarBean(){}
	
	public String deleteCar(){
		String retString = null;
	    Connection conn = null;
		Statement statement = null;
		String SQLStr = "";
	    
		if (registration != null && registration != " ") {						
				
			try {
		    	// get connection
		    	conn = DriverManager.getConnection("jdbc:mysql://" + 
		    				"5.189.135.166:3011/test?useUnicode=yes&characterEncoding=UTF-8&useSSL=false", 
		    				"java", "java");
	    		
		    	SQLStr = "DELETE FROM `test`.`car` WHERE registration='" + registration + "'";
	    		System.out.println(SQLStr);
	    		statement = conn.createStatement();
	    		int i = statement.executeUpdate(SQLStr);
	    		System.out.println(i);
	    		if (i > 0) 
	    			retString = "Το αυτοκίνητο διαγράφηκε επιτυχώς";
	    		else
	    			retString = "Δεν υπάρχει αυτοκίνητο με αυτόν τον Α.Κ.";
	    		
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
		return retString;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}
}
