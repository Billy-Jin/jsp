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
	<table width="400" align="center" >
		<tr>
			<td>이름</td>
			<td>나이</td>
			<td>주소</td>
		</tr>
<%
	while(rs.next())
	{ 
%>

		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("age") %></td>
			<td><%=rs.getString("juso") %></td>
			<td> <a href="delete.jsp?id=<%=rs.getInt("id")%>">클릭</a></td>
			<td> <a href="update.jsp?id=<%=rs.getInt("id")%>">클릭</a></td>
		</tr>

<%	
	}
%>
	<tr>
		<td colspan="3" align="center"> <a href="write.jsp"> 글쓰기 </a></td>
	</tr>
	</table>	
</body>
</html>