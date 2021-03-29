//12월14일까지 꼭 완성! ,..16일까지 꼭!
package kr.ac.sunmoon.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.common.ConnectionUtils;

public class ReplyDAO {
	
	public void insertReply(ReplyVO reply) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionUtils.getConnection();
			//sql문 작성(계속 수정 해보기)
			String sql ="INSERT INTO reply (msg_id, reply, reply_id, reply_date, user_id) VALUES (?, ?, ?, now(), ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,reply.getMsgId());
			pstmt.setString(2, reply.getReply());
			pstmt.setInt(3, reply.getReplyId());
			pstmt.setString(4, reply.getUserId());
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
				if(pstmt != null && !pstmt.isClosed()){
				     pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	public void deleteReply(String replyId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionUtils.getConnection();
			String sql ="DELETE FROM reply WHERE reply_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,replyId);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
				if(pstmt != null && !pstmt.isClosed()){
				     pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
	
	public List<ReplyVO> selectReply(String messageId) {
		List<ReplyVO> replys = new ArrayList<ReplyVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ConnectionUtils.getConnection();
			String sql = "select msg_id,reply,reply_id,reply_date,user_id from reply where msg_id = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(messageId));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReplyVO reply = new ReplyVO();

				reply.setMsgId(rs.getInt("msg_id"));
				reply.setReply(rs.getString("reply"));
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setReplyDate(rs.getString("reply_date"));
				reply.setUserId(rs.getString("user_id"));
				
				replys.add(reply);
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

		return replys;
	}

}
