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
	
	//업데이트에 필요한 입력값들 가져오기
	request.setCharacterEncoding("utf-8");//한글 때문에 넣어줘야함
	String name = request.getParameter("name"); //받을때는 request기억!
	String age = request.getParameter("age");
	String juso = request.getParameter("juso");
	String id = request.getParameter("id");
	//쿼리생성
	String sql="update member set name='"+name+"', age='"+age+"', juso='"+juso+"' where id="+id;
	//sql="update member set name='홍길동', age='22', juso='서울' where id=1 ";	
	
	Statement stmt=conn.createStatement();
	
	stmt.executeUpdate(sql);
	// list로 이동
	response.sendRedirect("list.jsp"); //다이렉트로 list로 이동 
%>

