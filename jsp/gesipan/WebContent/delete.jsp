<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
 
    // request값 가져오기
    String pwd=request.getParameter("pwd"); // 사용자가 입력한 비밀번호
    String id=request.getParameter("id");
    
    // Db에 있는 비밀번호 가져오기
       // 쿼리 생성
    String sql="select pwd from gesipan where id="+id;
       // 심부름꾼 
    Statement stmt=conn.createStatement();
       // 실행후 ResultSet
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    
    if(pwd.equals(rs.getString("pwd")))
    {	
      sql="delete from gesipan where id="+id;
      stmt=conn.createStatement();
      stmt.executeUpdate(sql);
      response.sendRedirect("list.jsp");
    }
    else
    {
      // 이동
      response.sendRedirect("content.jsp?id="+id+"&chk=1");
    }
%>
<%
   stmt.close();
   conn.close();
%>
