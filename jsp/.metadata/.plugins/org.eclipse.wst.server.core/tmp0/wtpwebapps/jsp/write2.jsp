<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <!--write.jsp -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
//     $('#age').focusout(function(){
// 		if(!$.isNumeric($('#age').val())){
// 		alert("나이는 숫자로 입력해주세요");
// 		return false;
// 		}
//     })
	
    $('#frm').submit(function(){
        var nameLength = $('#name').val().length;
        var jusoLength = $('#juso').val().length;
        if(nameLength < 3||nameLength > 5){
            alert("이름은 3~5자리 사이로 만들어 주세요");
            return false;
        }

		if(!$.isNumeric($('#age').val())){
			alert("나이는 숫자로 입력해주세요");
			return false;
		}
		
        if(jusoLength < 2){
            alert("주소는 2글자 이상 입력해주세요");
            return false;
        }
    })
})
</script>
</head>
<body>
	<!-- 이름은 3자이상 5자이하, 나이는 숫자인가, 주소는 2자이상 되면 전송하기 -->
	<form method="post" action="write_ok.jsp" id="frm">
	이름 	<input type="text" name="name" id="name"> <p>
	나이 	<input type="text" name="age" id="age"> <p>
	주소 	<input type="text" name="juso" id="juso"> <p>
	   	<input type="submit" value="저장">
	</form>
</body>
</html>