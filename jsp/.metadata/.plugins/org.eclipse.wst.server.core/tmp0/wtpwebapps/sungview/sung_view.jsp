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

	// request는 필요없음
	
	//쿼리생성
	String sql= "select * from score order by id desc";
	//심부름꾼 만들기
	Statement stmt = conn.createStatement();
	// 쿼리실행 후 결과를 ResultSet으로
	ResultSet rs= stmt.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  td {
    border:1px solid #cccccc;
  }
</style>
</head>
<body>
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td>국어</td>
			<td>영어</td>
			<td>수학</td>
			<td>과학</td>	
			<td>작성일</td>	
		</tr>
	<%
	while(rs.next())
	{
	%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("kor") %></td>
			<td><%=rs.getString("eng") %></td>
			<td><%=rs.getString("mat") %></td>
			<td><%=rs.getString("sci") %></td>
			<td><%=rs.getString("writeday") %></td>
	<%
	}
	%>
    	<tr>
    		<td colspan="6" align="center">
    		<a href="input.jsp">성적입력</a>
    		</td>
    	</tr>
	</table>
</body>
</html>