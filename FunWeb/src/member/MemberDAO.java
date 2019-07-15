package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	String id;
	String pass;
	String name;
	Timestamp reg_date;
	ResultSet rs;
	PreparedStatement pstmt;

	public void insertMember(MemberBean mb) {
		Connection con = null;
		try {
			con = getConnection();
			// 3단계 sql(insert) 만들고 실행할 객체 생성
			String sql = "insert into member(id,pass,name,email,reg_date,address,phone,mobile,post) values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId()); // 첫번째 물음표,값
			pstmt.setString(2, mb.getPass());// 두번째물음표,값
			pstmt.setString(3, mb.getName());// 세번째물음표,값
			pstmt.setString(4, mb.getEmail());
			pstmt.setTimestamp(5, mb.getReg_date());
			pstmt.setString(6, mb.getAddress());
			pstmt.setString(7, mb.getPhone());
			pstmt.setString(8, mb.getMobile());
			pstmt.setInt(9, mb.getPost());
			// 4단계 sql 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();
		} finally {
			// 예외상관없이 처리되는 문장
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

	}

	public int userCheck(String id, String pass) {
		int check = -1;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3. sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. 결과저장 <= sql 구문실행 select
			rs = pstmt.executeQuery();
			// 5. select 결과를 비교해서 일치여부 확인

			// 같은 말 if(id.equals(rs.getString("id")))
			if (rs.next()) {
				// id있으면
				if (pass.equals(rs.getString("pass"))) {
					check = 1;
				} else {
					check = 0;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

		return check;

	}

	public int idcheck(String id) {
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3. sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. 결과저장 <= sql 구문실행 select
			rs = pstmt.executeQuery();
			// 5. select 결과를 비교해서 일치여부 확인

			// 같은 말 if(id.equals(rs.getString("id")))
			if (rs.next()) {
				// id있으면
				check = 1;
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

		return check;

	}
	
	public int emailcheck(String email) {
		int check = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3. sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql = "select * from member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			// 4. 결과저장 <= sql 구문실행 select
			rs = pstmt.executeQuery();
			// 5. select 결과를 비교해서 일치여부 확인

			// 같은 말 if(id.equals(rs.getString("id")))
			if (rs.next()) {
				// id있으면
				check = 1;
				
			} 

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

		return check;

	}

	public MemberBean getMember(String id) {

		MemberBean mdto = new MemberBean();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3. sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. 결과저장 <= sql 구문실행 select
			rs = pstmt.executeQuery();
			// 5. select 결과를 비교해서 일치여부 확인

			// 같은 말 if(id.equals(rs.getString("id")))
			if (rs.next()) {
				mdto.setId(rs.getString("id"));
				mdto.setPass(rs.getString("pass"));
				mdto.setName(rs.getString("name"));
				mdto.setEmail(rs.getString("email"));
				mdto.setMobile(rs.getString("mobile"));
				mdto.setPhone(rs.getString("phone"));
				mdto.setPost(rs.getInt("post"));
				mdto.setAddress(rs.getString("address"));
				mdto.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {

		} finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

		return mdto;

	}

	public List getList() {
		List memberList = new ArrayList();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			// 3. sql(select 조건 id=?) 만들고 실행할 객체 생성
			String sql = "select * from member order by id";
			pstmt = con.prepareStatement(sql);
			// 4. 결과저장 <= sql 구문실행 select
			rs = pstmt.executeQuery();

			// 같은 말 if(id.equals(rs.getString("id")))
			while (rs.next()) {
				MemberBean md = new MemberBean();
				md.setId(rs.getString("id"));
				md.setPass(rs.getString("pass"));
				md.setName(rs.getString("name"));
				md.setReg_date(rs.getTimestamp("reg_date"));

				memberList.add(md);

			}
		} catch (Exception e) {

		} finally {
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}
		return memberList;

	}

	public void userUpdate(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt2 = null;
		System.out.println(mb.getAddress());
		try {
			con = getConnection();
			// 3. sql구문
			String sql2 = "update member set pass=?,email=?,address=?,mobile=?,phone=?,post=? where id=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, mb.getPass());
			pstmt2.setString(2, mb.getEmail());
			pstmt2.setString(3, mb.getAddress());
			pstmt2.setString(4, mb.getMobile());
			pstmt2.setString(5, mb.getPhone());
			pstmt2.setInt(6, mb.getPost());
			pstmt2.setString(7, mb.getId());
			pstmt2.executeUpdate();

		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();
		} finally {
			// 예외상관없이 처리되는 문장
			if(rs!=null) try { rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();} catch(SQLException ex) {}
			if(con!=null) try{con.close();} catch(SQLException ex) {}
		}

	}

	public void userDel(MemberBean mb) {
		Connection con = null;
		PreparedStatement pstmt2 = null;
		try {
			con = getConnection();
			// 3. sql구문
			String sql2 = "delete from member where id=? && pass=?";
			pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, mb.getId());
			pstmt2.setString(2, mb.getPass());
			pstmt2.executeUpdate();

		} catch (Exception e) {
			// 예외가 발생하면 처리하는 곳
			e.printStackTrace();
		} finally {
			// 예외상관없이 처리되는 문장

		}
	}

	public Connection getConnection() throws Exception {

//		Class.forName("com.mysql.jdbc.Driver");
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
//		String dbUser = "jspid";
//		String dbPass = "jsppass";
//		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

		// context.xml 불러오기 위한 자바파일 객체생성
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();

		return con;

	}

}
