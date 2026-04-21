package com.hd.Common;

public interface database 
{
	public static final String Database_Driver      =  "oracle.jdbc.driver.OracleDriver";

	public static final String Local_DB             =  "XE"; 
	public static final String Local_DB_User        =  "system";
	public static final String Local_DB_Password    =  "Nickfury@1.";
	public static final String Local_Connection_URL =  "jdbc:oracle:thin:@localhost:1521:"+Local_DB;  
	
	public static final String UAT_DB              =  "Prod1";
	public static final String UAT_DB_User         =  "Proj1";  
	public static final String UAT_DB_Password     =  "login123";
	public static final String UAT_Connection_URL  =  "jdbc:oracle:thin:@192.168.5.31:1521:"+UAT_DB;    
	
	public static final String Live_DB              =  "XE";
	public static final String Live_DB_User         =  "patcher1";
	public static final String Live_DB_Password     =  "login123";
	public static final String Live_Connection_URL  =  "jdbc:oracle:thin:@162.214.73.83:1521:"+Live_DB;  
	
	public static final String Active_Mode          =  "local";
	
	public static final String DB_Name              =  Active_Mode.contains("local") ? Local_DB : Active_Mode.contains("UAT") ? UAT_DB : Live_DB;
	public static final String DB_User              =  Active_Mode.contains("local") ? Local_DB_User : Active_Mode.contains("UAT") ? UAT_DB_User : Live_DB_User;
	public static final String DB_Pass              =  Active_Mode.contains("local") ? Local_DB_Password : Active_Mode.contains("UAT") ? UAT_DB_Password : Live_DB_Password;
	public static final String Connection_URL       =  Active_Mode.contains("local") ? Local_Connection_URL : Active_Mode.contains("UAT") ?  UAT_Connection_URL : Live_Connection_URL; 
}