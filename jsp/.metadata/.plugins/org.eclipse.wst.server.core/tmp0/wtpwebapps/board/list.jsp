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
	
	// 쿼리생성
	String sql= "select * from board order by id desc";
	// 심부름꾼 만들기
	Statement stmt = conn.createStatement();
	// 쿼리실행 후 결과를 ResultSet으로
	ResultSet rs=stmt.executeQuery(sql);
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
	<!-- 제목, 내용, 작성자, 비밀번호, 조회수, 날짜 중에 -->
	<!-- 제목, 작성자, 조회수, 날짜 출력 -->
	<table width="600" align="center">
		<tr>
			<td> 작성자 </td>
			<td> 제목 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
	<%
	while(rs.next())
	{
	%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td> <a href="readnum.jsp?id=<%= rs.getString("id")%>"> <%=rs.getString("title") %> </a></td>
			<td><%=rs.getString("readnum") %></td> <%--readnum은 어디서 나온거지? --%>
			<td><%=rs.getString("writeday") %></td>
		</tr>
	<%
    }
    %>
    	<tr>
    		<td colspan="4" align="center">
    		<a href="write.jsp">글쓰기</a>
    		</td>
    	</tr>
	</table>
</body>
</html>