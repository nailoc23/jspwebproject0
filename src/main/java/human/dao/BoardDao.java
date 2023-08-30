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
			String sql = "SELECT no, subject, TO_CHAR(regdate, 'yyyy-MM-DD') as regdate, hit FROM bo_notice";
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

}
