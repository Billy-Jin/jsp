<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% System.out.println("/board/writeForm.jsp"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<!-- 라리브러리 등록 - jQuery, Bootstrap : CDN방식 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>
</head>
<body>
<div class="container">
<h1>게시판글쓰기</h1>
<form action="write.jsp" method="post" >
<div class="form-group">
  <label for="title">제목:</label>
  <input type="text" class="form-control" id="title" name="title" title="제목을 입력하셔야 합니다" required="required" placeholder="제목을 5글자 이상으로 입력하세요.">
</div>
<div class="form-group">
  <label for="content">내용:</label>
  <textarea class="form-control" rows="5" id="content" name="content"></textarea>
</div>  
<div class="form-group">
  <label for="writer">작성자:</label>
  <input type="text" class="form-control" id="writer" name="writer">
</div>
<button class="btn btn-default">등록</button> <!-- 버튼의 기본은 submit -->
</form>
</div>
</body>
</html>