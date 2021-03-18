<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li{list-style-type:none;}
</style>
<script type="text/javascript">	
	function view()
	{
		// none, inline, block, inline-block
		document.getElementById("aa").style.display="block";
		//document.getElementById("aa").style.listStyleType="disc";
	}
	function view2()
	{
		// hidden, visible
		document.getElementById("bb").style.visibility="visible"
	}
</script>
</head>
<body>
	<a href="javascript:view()"> 보이기</a> <p>
	<ul>
		<li> 대방어</li>
		<li style="display:none;" id="aa"> 참돔</li>
		<li> 감섬돔</li>
		<li> 갈치</li>
	</ul>
	<hr>
	<a href="javascript:view2()"> 보이기</a> <p>
	<ul>
		<li> 삼겹살</li>
		<li style="visibility:hidden;" id="bb"> 항정살</li>
		<li> 목살</li>
		<li> 갈매기살</li>
	</ul>
</body>
</html>