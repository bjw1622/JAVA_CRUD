package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserSearchServlet
 */
@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   System.out.println("msg_title : " + request.getParameter("msg_title"));
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      String msg_title = request.getParameter("msg_title");
      response.getWriter().write(getJSON(msg_title));
   }
   
   public String getJSON(String msg_title) 
   {
      if(msg_title == null) {
         msg_title = "";
      }
      StringBuffer result = new StringBuffer("");
      result.append("{\"result\":[");
      UserDAO userDAO = new UserDAO();
      ArrayList<User> userList = userDAO.search(msg_title);
      for(int i = 0; i < userList.size(); i++) {
          result.append("[{\"value\": \""+userList.get(i).getMsg_id()+"\"},");
          result.append("{\"value\": \""+userList.get(i).getMsg_title()+"\"},");
          result.append("{\"value\": \""+userList.get(i).getMsg_content()+"\"},");
          result.append("{\"value\": \""+userList.get(i).getMsg_date()+"\"},");
          result.append("{\"value\": \""+userList.get(i).getUser_id()+"\"}],");
      }
     
      result.append("]}");
      
      System.out.println(result);
      return result.toString();
   }

}