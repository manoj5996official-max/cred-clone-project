package com.hd.model;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Component;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.zaxxer.hikari.HikariDataSource;

@Component
public class Mymodel
{

public JdbcTemplate Jdbctemplate;
	
	@Autowired
	public void setJdbctemplate(HikariDataSource Datasource) 
	{	
		Jdbctemplate = new JdbcTemplate(Datasource);
	}

	public JsonObject a(String message)
	{
		JsonObject a = new JsonObject();
		
		try {
			
			System.out.println(message);
			JsonObject js = new JsonObject();
            JsonParser parser = new JsonParser();
			js = parser.parse(message).getAsJsonObject();
			
	        String name     = js.get("name").getAsString();
            String aadhar = js.get("aadhar_number").getAsString();
	        String entryDate = js.get("entry_date").getAsString();
		    String entryTime = js.get("entry_time").getAsString();
			String date     = js.get("date").getAsString();
			String phone    = js.get("phone").getAsString();
			String address  = js.get("address").getAsString();
			String gender   = js.get("gender").getAsString();
			
			

			System.out.println(name);

	        System.out.println(aadhar);
	        
	        System.out.println(entryDate);
	        
			System.out.println(entryTime);

			System.out.println(date);
			
			System.out.println(phone);

			System.out.println(address);

			System.out.println(gender);
			
		   


			
			
			String sql = "INSERT INTO Identity_Table (name, aadhar_number, date_of_entry, time_of_entry, dob , phone , address, gender) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
	        System.out.println("Running SQL: " + sql);
 																						
	        int rows = Jdbctemplate.update(sql, name, aadhar, entryDate, entryTime, date, phone, address, gender );
	        System.out.println("Rows inserted: " + rows);

			a.addProperty("name", name);
			a.addProperty("status", "success");
		}
		
		catch (Exception e) {
			// TODO: handle exception
			
			System.err.println("Error while processing the request: " + e.getMessage());
            e.printStackTrace();
            
		}
		return a;
	}
	
	
    
	
	
	
	
	
	public JsonObject view() {
        JsonObject detail = new JsonObject();
        JsonArray userList = new JsonArray();
 
        try {
            String sql = "SELECT * FROM Identity_Table "; //change table name alone
            List<Map<String, Object>> rows = Jdbctemplate.queryForList(sql);
 
            for (Map<String, Object> row : rows) 
            {
                JsonObject user = new JsonObject();
                for (Map.Entry<String, Object> entry : row.entrySet()) 
                {
                    user.addProperty(entry.getKey(), entry.getValue() != null ? entry.getValue().toString() : null);
                }
                userList.add(user);
            }
 
            detail.add("users", userList);
 
        } catch (Exception e) {
            e.printStackTrace();
            detail.addProperty("error", "Failed to fetch user data");
        }
 
        return detail;
    }
}
	






	