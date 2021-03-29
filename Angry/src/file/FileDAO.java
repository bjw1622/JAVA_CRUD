
package file;

import java.sql.Connection;
import java.sql.PreparedStatement;

import kr.ac.common.ConnectionUtils;

public class FileDAO {
	
	public int upload(String fileName, String fileRealName) 
	{
		Connection conn = ConnectionUtils.getConnection();
		PreparedStatement pstmt = null;
		String SQL = "INSERT INTO FILE VALUES (? , ?)";//여기 확인
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,fileName);
			pstmt.setString(2,fileRealName);
			return pstmt.executeUpdate(); //정상적인 경우 반환값 1
		}
		catch(Exception e){
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}
