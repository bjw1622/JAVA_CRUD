package kr.ac.sunmoon.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.ac.common.ConnectionUtils;

public class UserService {
	public int login(String user_id, String user_pw) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();// stmt라는 객체를 호출함으로써 얻어진다.

			String sql = "select user_pw from user where user_id='" + user_id + "'"; // 아이디 점검하기 (내 아이디랑 동일 userid의
																						// 비밀번호를 select해라)
			rs = stmt.executeQuery(sql); // sql에 실어서 보내기 (아이디는 pk인데 내 아이디랑 같은거는 값이 1개 or 0개인데?? rs는 왜 여러개가
													// 나온는가?)
			if (rs.next()) {
				String check_pw = rs.getString(1); // 패스워드가 1번째 인덱스 why?테이블에서는 2번쨰 아닌가??
				if (check_pw.equals(user_pw)) // 패스워드 점검하기
					return 2; // 로그인 성공
				else
					return 3; // 비밀번호 오류
			}
			return 4; // 아이디 오류
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

		return 1; // 데이터베이스 연결 오류
	}

	public int join(String user_id, String user_pw, String user_name, String user_gender, String user_email) {
		Connection con = null;
		Statement stmt = null;
		try // 새로운 사용자 추가하기
		{
			con = ConnectionUtils.getConnection();
			stmt = con.createStatement();

			String sql = "insert into user values("; // insert문 사용(삽입)
			sql += "'" + user_id + "','" + user_pw + "','" + user_name + "','" + user_gender + "','" + user_email
					+ "');"; // 새로운 사용자 추가하기

			stmt.execute(sql);

			return 0; // 가입 성공
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

		return 1; // 데이터베이스 오류 or 이미 존재하는 아이디
	}
	
	public String getMessageCnt(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ConnectionUtils.getConnection();
			String sql = "select count(*) as msgCnt from message where user_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				return rs.getString("msgCnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
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

		return "0";
	}
	
	public String getReplyCnt(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ConnectionUtils.getConnection();
			String sql = "select count(*) as replyCnt from reply where user_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				return rs.getString("replyCnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
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

		return "0";
	}
}