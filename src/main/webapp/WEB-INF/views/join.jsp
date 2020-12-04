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

  <title>회원가입 | 스프링 프레임워크 실무 - 과제물</title>

  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/css/bootstrap.min.css' />" rel="stylesheet">
  <link href="<c:url value='/css/signup.css' />" rel="stylesheet">
  
  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  
  <!-- Ajax -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="<c:url value='/js/bootstrap.min.js' />"></script>
  <script src="<c:url value='/js/signup.js' />"></script>
  
  <script type="text/javascript">
	$(function() {
		// 가입
		$("#btn-join").on("click", function() {
		  	$.ajax({
		    	type     : "POST",
		    	url      : "<c:url value='/memberCheck'/>",
		    	dataType : 'json',
		    	async    : false,
		    	data     : $("#joinForm").serialize()
		    })
		    .done(function(json) {
			    if(json.id) {
				    alert("이미 존재하는 id 입니다.");
				    $("#id").focus();
				    return;
				}
			    else if(json.email) {
				    alert("이미 등록된 e메일입니다.");
				    $("#email").focus();
				    return;
				} else {
					$("#joinForm").attr("method", "POST");
					$("#joinForm").attr("action", "<c:url value='/join' />");
					$("#joinForm").append($('<input/>', {type: 'hidden', name: 'referer', value: document.referrer}));
					$("#joinForm").submit();
				}
			})
			.fail(function(xhr) {
				alert("회원가입 도중 문제가 발생했습니다.");
				console.log(xhr);
			});
		});
		
	});
  </script>
  
</head>
<body class="text-center">
<form class="form-signup" id="joinForm" name="joinForm" action="#" method="POST">
  <img class="mb-4" src="<c:url value='/img/bootstrap-solid.svg' />" alt="logo" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">회원가입</h1>
  
  <div class="mb-3">
    <label for="id">사용자 ID</label>
    <input type="text" class="form-control" id="id" name="id" placeholder="user01" required="required" />
    <div class="invalid-feedback">
      ID는 필수 항목입니다.
    </div>
  </div>
  
  <div class="mb-3">
    <label for="id">비밀번호</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" required="required" />
    <div class="invalid-feedback">
      비밀번호는 필수 항목입니다.
    </div>
  </div>

  <div class="mb-3">
    <label for="username">이름</label>
    <div class="input-group">
      <div class="input-group-prepend">
        <span class="input-group-text">@</span>
      </div>
      <input type="text" class="form-control" id="username" name="username" placeholder="이름" required="required" />
      <div class="invalid-feedback" style="width: 100%;">
        이름은 필수 항목입니다.
      </div>
    </div>
  </div>

  <div class="mb-3">
    <label for="email">e메일</label>
    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required="required" />
    <div class="invalid-feedback">
      e메일은 필수 항목입니다.
    </div>
  </div>
  
  <div class="custom-control custom-checkbox">
    <input type="checkbox" class="custom-control-input" id="save-info">
    <label class="custom-control-label" for="save-info">위 정보를 기억합니다.</label>
    <p><small style="color: #aaa;">* 죄송합니다. 뻥입니다. 구현되지 않았습니다.</small><p>
  </div>

  <hr class="mb-4">
  
  <button type="button" class="btn btn-lg btn-primary btn-block" id="btn-join">가입</button>
  <button type="button" class="btn btn-lg btn-secondary btn-block" onclick="history.back()">취소</button>
  <p class="mt-5 mb-3 text-muted">&copy; 2020-2020</p>
</form>
</body>
</html>