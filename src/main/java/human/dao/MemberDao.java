package human.dao;
import java.sql.*;
import human.vo.*;

// 회원테이블에 접속하는 기능
public class MemberDao {
		
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
	
	public void listMemberAll() {
		
		System.out.println("회원목록을 가져옴");
		
		getConnect();
		// 쿼리작업
		
		closeConn();
	}
	
	public int getMemberCount() {
		
		System.out.println("회원 목록 수를 가져옴");
		int rst = 0;
		
		getConnect();
		// 쿼리작업
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM MEMBER";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("getMemberCount 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		
		return rst;
	}
	
	// 회원정보를 저장하는 함수
	public int regMember(String id, String pw, String name, String email, String tel) {
		
		System.out.println("회원 정보를 저장함");
		int rst = 0;
		
		getConnect();
		
		// 작업
		try {
			String sql = "INSERT INTO MEMBER (id, pwd, name, email, phone) VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, tel);
			rst = pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println("regMember 쿼리에러: " + se.getMessage());
		}
				
		closeConn();
		
		return rst;
		
	}
	
	// 로그인 인증 함수 
	public int loginCheck(String id, String pw) {
		
		System.out.println("회원 정보 인증함");
		int rst = 0; // 1이면 로그인성공, 0이면 로그인실패
		
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM MEMBER WHERE id=? AND pwd =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("loginCheck 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		
		return rst;
	}
	
	// loginCheck 오버로딩 함수
	public int loginCheck(MemberVo tempvo) {
		
		System.out.println("회원 정보 인증함");
		int rst = 0; // 1이면 로그인성공, 0이면 로그인실패
		
		getConnect();
		
		try {
			String sql = "SELECT COUNT(*) AS CNT FROM MEMBER WHERE id=? AND pwd =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempvo.getId());
			pstmt.setString(2, tempvo.getPwd());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("loginCheck 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		
		return rst;
	}
	
	// 아이디 중복체크
	public int isExistId(String id) {
		System.out.println("아이디 중복체크");
		int rst = 0;
		getConnect();
		
		try {
			String sql="SELECT COUNT(*) AS CNT FROM MEMBER WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				rst = rs.getInt("CNT");
			}
		}catch(SQLException se) {
			System.out.println("isExistId 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}
	
	// 아이디로 사용자 정보 검색
	public MemberVo getMemberById(String id) {
		System.out.println("아이디로 사용자 정보 검색");
		MemberVo rstvo = new MemberVo();
		
		getConnect();
		
		try {
			String sql = "SELECT name, email, phone FROM MEMBER WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rstvo.setName(rs.getString("name"));
				rstvo.setEmail(rs.getString("email"));
				rstvo.setPhone(rs.getString("phone"));
			}
		}catch(SQLException se) {
			System.out.println("getMemberById 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rstvo;
		
	}
	
	// 사용자 정보를 수정
	public int modifyMember(MemberVo tempvo) {
		System.out.println("사용자 정보를 수정");
		int rst = 0;
		
		getConnect();
		
		try {
			String sql = "UPDATE MEMBER SET name=?, email=?, phone=? WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tempvo.getName());
			pstmt.setString(2, tempvo.getEmail());
			pstmt.setString(3, tempvo.getPhone());
			pstmt.setString(4, tempvo.getId());			
			pstmt.setString(5, tempvo.getPwd());
			rst = pstmt.executeUpdate();
		}catch(SQLException se) {
			System.out.println("modifyMember 쿼리에러: " + se.getMessage());
		}
		
		closeConn();
		return rst;
	}

}

