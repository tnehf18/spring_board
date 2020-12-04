<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="스프링 프레임워크 실무 - 과제물">
  <meta name="author" content="NOZ(이수원)">
  <link rel="icon" href="<c:url value='/img/favicon.ico' />">

  <title>게시판 | 스프링 프레임워크 실무 - 과제물</title>

  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
  
  <style type="text/css">
  .custom_p {
  	margin-bottom: .5em !important;
  }
  .center {
    text-align: center;
  }
  </style>
 
  <!-- Ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="<c:url value='/js/bootstrap.min.js' />"></script>
  
  <script type="text/javascript">
	$(function() {
		//완료
		$("#btn-complete").on("click", function() {
			if (!confirm("등록하시겠습니까?")) {
				return;
			}
			else {
				$("#registerForm").attr("method", "POST");
				$("#registerForm").attr("action", "<c:url value='/board/register' />");
				$("#registerForm").append($("<input/>", {type: "hidden", name: "writer", value: "<c:out value='${sessionScope.member.id }' />"}));
				$("#registerForm").submit();
			}
		});
		//최소
		$("#btn-cancel").on("click", function() {
			if (!confirm("작성을 취소하고 돌아가시겠습니까?")) {
				return;
			}
			else {
				history.back();
			}
		});
	});
  </script>

</head>
<body>

  <!-- top nav -->
  <%@ include file="../common/top.jspf" %>
  <!-- /top nav -->
  
  <div class="container">
  
    <div class="px-3 py-3 pt-md-5 pb-md-4 mx-auto text-left" style="margin-top: 30px;">
      <h1 class="display-4">스프링 게시판</h1>
      <p class="lead">This was designed by modifying the source file imported from the bootstrap example. If you write something that looks plausible here, it doesn't mean much, but it looks cool.</p>
    </div>
    
    <hr />
    
    <form id="registerForm" name="registerFormn" action="#" method="POST">
      <div class="form-group row">
        <label for="title" class="col-md-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="title" name="title" placeholder="제목" required="required" />
        </div>
      </div>
      <div class="form-group row">
        <label for="content" class="col-sm-2 col-form-label">본문</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="content" name="content" rows="10"></textarea>
        </div>
      </div>
      
      <br />
    
      <div class="form-group row">
        <div class="col-md-12">
          <input type="reset" class="btn btn-success" value="초기화" />
          <div class="float-right">
            <input type="button" class="btn btn-primary" id="btn-complete" value="완료" />
            <input type="button" class="btn btn-secondary" id="btn-cancel" value="취소" />
          </div>
        </div>
      </div>
    </form>

    <hr>

	<!-- footer -->
	<%@ include file="../common/footer.jspf" %>
	<!-- /footer -->
    
  </div> <!-- /container -->

</body>
</html>
