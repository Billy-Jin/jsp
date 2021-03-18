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
	//request 호출
	String id=request.getParameter("id");
	//쿼리생성
	String sql = "select * from gesipan where id="+id;
	//심부름꾼 호출
	Statement stmt =conn.createStatement();
	//쿼리실행
	ResultSet rs=stmt.executeQuery(sql);
	rs.next();
	
	// 성별 문자로 변환
	String sung=null;
	switch(rs.getInt("sung"))
	{
	case 0: sung="남자"; break;
	case 1: sung="여자"; break;
	case 2: sung="선택안함"; break;
	}
	
	//취미 구하기 0: 낚시, 1:독서, 2:여행, 3:음주, 4:잠자기, 5:게임
	// 1. ,로 구분된 필드의 값을 나눠야 한다.. split()
	String[] hobby=rs.getString("hobby").split(","); 
	String hob="";
	for(int i=0; i<hobby.length;i++)
	{

		switch(hobby[i])
		{
			case "0": hob=hob+" 낚시"; break;
			case "1": hob=hob+" 독서"; break;
			case "2": hob=hob+" 여행"; break;
			case "3": hob=hob+" 음주"; break;
			case "4": hob=hob+" 잠자기"; break;
			case "5": hob=hob+" 게임"; break;
		}
	}
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
  #del{
  	position:absolute;
  	visibility:hidden;
  }
</style>
<script type="text/javascript">
	function view_del()
	{	
		//alert(event.clientX+" "+event.clientY)
		var x=event.clientX;
		var y=event.clientY;
		document.getElementById("del").style.visibility="visible";
		document.getElementById("del").style.left=(x-30)+"px";
		document.getElementById("del").style.top=(y+30)+"px"
	}
	   $(window).bind('keydown', function(e) {
		      if (e.keyCode === 116)
		         e.preventDefault();
		   });
	
</script>
</head>
<body>
	<!-- 하나의 레코드 내용 출력 -->
	<table width="600" align="center">
		<tr>
			<td> 이름 </td>
			<td> <%=rs.getString("name") %></td>
			<td> 성별 </td>
			<td> <%=sung %></td>
			<td> 취미 </td>
			<td> <%=hob %></td>
		</tr>
		<tr>
			<td> 태어난 해 </td>
			<td> <%=rs.getString("birth") %></td>
			<td> 작성일</td>
			<td> <%=rs.getString("writeday") %></td>
			<td> 조회수 </td>
			<td> <%=rs.getString("readnum") %></td>
		</tr>
		<tr>
			<td> 제목 </td>
			<td colspan="5"> <%=rs.getString("title") %> </td>
		</tr>
		<tr>
			<td> 내용 </td>
			<td colspan="5"> <%=rs.getString("content") %> </td>
		</tr>
		    <tr>
      <td colspan="6" align="center"> 
		<a href="update.jsp?id=<%=rs.getInt("id")%>"> 수정 </a>
      	<a href="#" onclick="view_del()"> 삭제 </a>
      	<a href="list.jsp"> 목록 </a>
      </td>
     </tr>
	</table>
	   <form method="post" action="delete.jsp" id="del">
      <input type="hidden" name="id" value="<%=id%>">
      	비번 <input type="password" name="pwd" size="4"> 
      <input type="submit" value="삭제">
</body>
</html>