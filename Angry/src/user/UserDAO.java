package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   public UserDAO() {
      try
      {
         String dburl = "jdbc:mysql://localhost:3306/angry1?useSSL=false";
            String dbuser = "root";
            String dbpassword = "0361";
            Class.forName("com.mysql.jdbc.Driver");
            
            conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   public ArrayList<User> search(String msg_title)
   {
      String SQL = "SELECT * FROM message WHERE msg_title LIKE ?";
      ArrayList<User> userList = new ArrayList<User>();
      try 
      {
         pstmt = conn.prepareStatement(SQL);
         pstmt.setString(1,"%" + msg_title + "%");
         rs = pstmt.executeQuery();
         while(rs.next()) 
         {
				User user = new User();
				user.setMsg_id(rs.getString(1));
				user.setMsg_title(rs.getString(2));
				user.setMsg_content(rs.getString(3));
				user.setMsg_date(rs.getString(4));
				user.setUser_id(rs.getString(5));
				userList.add(user);
			
         }
      }
      catch (Exception e) 
      {
         e.printStackTrace();
      }
      return userList;
   }
}