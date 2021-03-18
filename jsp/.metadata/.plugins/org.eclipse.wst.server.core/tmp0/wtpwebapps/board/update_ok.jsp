<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%
	// DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	// request 값 가져오기
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	
	String sql="select pwd from board where id="+id; // 비밀번호 확인을 위한 id 호출
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    PreparedStatement pstmt=null;
    
	if(pwd.equals(rs.getString("pwd")))
	{// 쿼리 생성
		sql="update board set name=?,title=?,content=? where id=?";
		// 심부름꾼
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, id);
		// 쿼리 실행
		pstmt.executeUpdate();
		// 이동
		response.sendRedirect("content.jsp?id="+id);
	}
	else
	{
		response.sendRedirect("update.jsp?id="+id+"&chk=1");
	}
	if(pstmt!=null){
	   	pstmt.close();
	}
	   	stmt.close();
		conn.close();	

%>	