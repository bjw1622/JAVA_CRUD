package kr.ac.sunmoon.board;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import kr.ac.common.ConnectionUtils;

public class BoardService {
	public int write(Message msg) {
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();
			String sql = "insert into message (msg_title,msg_content,msg_date,user_id,file_name ) values('" + msg.getMsg_title() + "','" + msg.getMsg_content() + "','"
					+ getDate() + "','" + msg.getUser_id() + "', '"+msg.getImage_file()+"')";
			stmt.execute(sql);

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}

				if (con != null && !con.isClosed()) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	private String getDate() {
		String date = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();
			String sql = "select now();";
			rs = stmt.executeQuery(sql);
			rs.next();
			date = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return date;
	}

	public ArrayList<Message> getMessages() {
		ArrayList<Message> msgs = new ArrayList<Message>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();
			String sql = "select msg_id, msg_title, msg_content, msg_date, user_id, file_name from message;";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Message msg = new Message();

				msg.setMsg_id(rs.getInt(1));
				msg.setMsg_title(rs.getString(2));
				msg.setMsg_content(rs.getString(3));
				msg.setMsg_date(rs.getString(4));
				msg.setUser_id(rs.getNString(5));
				msg.setImage_file(rs.getString("file_name"));

				msgs.add(msg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return msgs;
	}

	public Message getMessage(int msg_id) {
		Message msg = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();
			String sql = "select msg_id, msg_title, msg_content, msg_date, user_id, file_name from message where msg_id=" + msg_id + ";";
			rs = stmt.executeQuery(sql);
			rs.next();

			msg = new Message();
			msg.setMsg_id(rs.getInt(1));
			msg.setMsg_title(rs.getString(2));
			msg.setMsg_content(rs.getString(3));
			msg.setMsg_date(rs.getString(4));
			msg.setUser_id(rs.getString(5));
			msg.setImage_file(rs.getString("file_name"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
				if (con != null && !con.isClosed()) {
					con.close();
				}
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return msg;
	}

	public void deleteMessage(String msg_id) {
		Connection con = null;
		Statement stmt = null;
		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from message where msg_id=" + msg_id + ";";
			stmt.execute(sql);
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		} 
		
		finally {
			try {
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
				if (con != null && !con.isClosed()) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void updateMessage(String msg_title, String msg_content, String msg_id, String imageFileName) {
		Connection con = null;
		Statement stmt = null;
		
		try {
			con = ConnectionUtils.getConnection();
			
			stmt = con.createStatement();
			String imageUpdate = (imageFileName != null && !imageFileName.isEmpty())? " ,file_name = '"+ imageFileName +"'":"";
			
			String sql = "update message set msg_title='" + msg_title + "'," + "msg_content='" + msg_content
					+ "'"+ imageUpdate+ " where msg_id=" + msg_id + ";";
			
			stmt.execute(sql);
		} 
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			
			try {
				
				if (stmt != null && !stmt.isClosed()) {
					stmt.close();
				}
				
				if (con != null && !con.isClosed()) {
					
					con.close();
				}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) 
	{
		
		System.out.println(new BoardService().getDate());
	}

}
