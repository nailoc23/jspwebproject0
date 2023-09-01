package human.dao;
import java.sql.*;
import human.vo.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

public class BoardDao {
	
	public static String user = "jsp";
	public static String passwd = "123456";
	public static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	public static Connection conn = null;
	public static Statement stmt = null;
	public static PreparedStatement pstmt = null;
	public static PreparedStatement pstmt2 = null;
	public static ResultSet rs = null;
	
	public void getConnect() {		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, passwd);			
		}catch(Exception e) {
			System.out.println("오라클접속에러: " + e.getMessage());
		}
	}
	
	public void closeConn() {
		try {
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(pstmt2!=null) pstmt2.close();
		}catch(SQLException se) {
			System.out.println("오라클닫기에게: " + se.getMessage());
		}
	}
	
	// 게시판 전체 목록 가져오기
	public ArrayList<BoardVo> getBoardListAll() {		
		
		System.out.println("게시판 전체 목록 가져오기");
		ArrayList<BoardVo> boardList = new ArrayList<BoardVo>();
		
		getConnect();
		
		try {
			stmt = conn.createStatement();
			String sql = "SELECT no, subject, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice ORDER BY no DESC";
			rs = stmt.executeQuery(sql);
			while(rs.next() ) {
				BoardVo tempvo = new BoardVo();
				tempvo.setNo(rs.getInt("no"));
				tempvo.setSubject(rs.getString("subject"));
				tempvo.setRegdate(rs.getString("regdate"));
				tempvo.setHit(rs.getInt("hit"));
				
				boardList.add(tempvo);
			}
		}catch(SQLException se) {
			System.out.println("getBoardListAll 쿼리에러: " + se.getMessage());
		}
		
		closeConn(); // 항상 반환 처리 빼먹지 않도록 기억
		
		return boardList;
	}
	
	// 게시판 글을 등록하기
	public int regBoard(BoardVo tempvo) {
		
		System.out.println("게시판 전체 목록 가져오기");
		int rst = 0; // 0 실패 1성공
		int rst2 = 0; // 동일
		
		getConnect();
		
		try {
			String sql = "INSERT INTO BO_NOTICE (no, groupno, id, writer, subject, content) VALUES (BO_NOTICE_SEQ.NEXTVAL, BO_NOTICE_SEQ.CURRVAL, 'admin', ?, ?, ?)";
			conn.setAutoCommit(false); // 쿼리를 실행하고 나서 아직 컴밋은 하지 말라 
			
			pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, tempvo.getWriter());
			pstmt.setString(2, tempvo.getSubject());
			pstmt.setString(3, tempvo.getContent());
			rst = pstmt.executeUpdate();
			
			// 다른 작업이 있음
			String sql2 = "INSERT INTO BO_NOTICE_FILE (no, filename, bno)  VALUES (BO_NOTICE_FILE_SEQ.NEXTVAL, ?, BO_NOTICE_SEQ.CURRVAL)";
			pstmt2  = conn.prepareStatement(sql2);
			pstmt2.setString(1, tempvo.getFilename());
			rst2 = pstmt2.executeUpdate();
			
			conn.commit();
			
			
		}catch(SQLException se) {
			System.out.println("regBoard 쿼리에러: " + se.getMessage());			
			// 만약 쿼리가 에러가 나면 롤백
			try {
				if(conn!=null) {
					conn.rollback();
				}
			}catch(Exception e) {
				System.out.println("regBoard 롤백에러: " + e.getMessage());	
			}
		}finally {
			// 에러가 나든 안 나든 정리할 건 마무리 하시오
			closeConn();
		}
		
		
		return (rst+rst2);
	}

}
