package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO2 {
	public Connection getConnection() throws Exception {

		// context.xml 불러오기 위한 자바파일 객체생성
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB"); // 위치/이름
		Connection con = ds.getConnection();
		return con;
	}

	// insertBoard(bb) 메서드
	public void insertComment(CommentBean2 cb) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = getConnection();
			String sql = "insert into comment2(idx,content,parent_num,id,date) values(null,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cb.getContent());
			pstmt.setInt(2, cb.getParent_num());
			pstmt.setString(3, cb.getId());
			pstmt.setTimestamp(4, cb.getDate());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 마무리작업 // 기억장소 con pstmt rs 정리
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
	}

	public void deleteComment(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "delete from comment2 where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}

	}

	public ResultSet selectComment() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con = getConnection();
			String sql = "select max(num) from board2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt("max(num)") + 1;
			}
			sql = "select*from comment2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return rs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 마무리작업 // 기억장소 con pstmt rs 정리
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return rs;
	}

	public List<CommentBean2> getCommentList(int parent_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommentBean2> commentList = new ArrayList<CommentBean2>();
		try {
			// 1단계 드라이버 로더 //2단계 디비연결
			con = getConnection();
			// 3단계 sql(select) 만들고 실행할 객체 생성
//			 String sql="select * from board order by num desc";
			String sql = "select * from comment2 where parent_num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parent_num);
			// 4단계 : 결과저장 <= sql 구문 실행 select
			rs = pstmt.executeQuery();
			// 5단계 rs -> 첫행이동 => 한개의 글 정보를 저장할 공간
			// BoardBean mb 객체생성 id변수 에 rs에서 가져온 id열 데이터저장
			// boardList 한칸에 한사람의 정보를 저장
			while (rs.next()) {
				CommentBean2 cb = new CommentBean2();
				// 한개의 글 정보를 저장할 객체생성
				cb.setParent_num(rs.getInt("parent_num"));
				cb.setContent(rs.getString("content"));
				cb.setDate(rs.getTimestamp("date"));
				cb.setId(rs.getString("id"));
				cb.setIdx(rs.getInt("idx"));
				
				System.out.println(rs.getInt("idx"));
				// 한개의 글 정보를 배열 한칸에 저장
				commentList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 마무리
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return commentList;
	}
}
