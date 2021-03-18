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
	//한글처리(request값)
	request.setCharacterEncoding("utf-8");//한글 때문에 넣어줘야함
	String name = request.getParameter("name"); //받을때는 request기억!
	String age = request.getParameter("age");
	String juso = request.getParameter("juso");
	
	//String sql="create table imsi(id int)";
	String sql="insert into member(name,age,juso) values('"+name+"',"+age+",'"+juso+"')";
	
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	// list로 이동
	response.sendRedirect("list.jsp"); //다이렉트로 list로 이동 
%>

