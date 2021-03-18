<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%
	//DB연결	
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db, userid, pw);

	// 쿼리 생성
	String sql="select * from member";
	
	//심부름꾼
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head> <!-- list.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	while(rs.next())
	{ // 첫번째 레코드로 이동
	out.print(rs.getString("name"));
	out.print(rs.getString("age"));
	out.print(rs.getString("juso"));
	out.print("<p>");
	}
%>
<a href="write.jsp">글작성</a> 
</body>
</html>