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
			if (!confirm("수정하시겠습니까?")) {
				return;
			}
			else {
				$("#modifyForm").attr("method", "POST");
				$("#modifyForm").attr("action", "<c:url value='/board/modify' />");
				$("#modifyForm").submit();
			}
		});
		//취소
		$("#btn-cancel").on("click", function() {
			if (!confirm("작성을 취소하고 돌아가시겠습니까?")) {
				return;
			}
			else {
				location.href="<c:url value='/board/${board.bno }' />";
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
    
    <form id="modifyForm" name="modifyForm" action="#" method="POST">
      <div class="form-group row">
        <label for="bno" class="col-md-2 col-form-label">글번호</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="bno" name="bno" placeholder="글번호" value="${board.bno }" readonly="readonly" />
        </div>
        <label for="readcnt" class="col-md-2 col-form-label">조회수</label>
        <div class="col-sm-4">
          <input type="text" class="form-control" id="readcnt" name="readcnt" placeholder="글번호" value="${board.readcnt }" readonly="readonly" />
        </div>
      </div>
      <div class="form-group row">
        <label for="title" class="col-md-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="title" name="title" placeholder="제목" value="${board.title }" />
        </div>
      </div>
      <div class="form-group row">
        <label for="content" class="col-sm-2 col-form-label">본문</label>
        <div class="col-sm-10">
          <textarea class="form-control" id="content" name="content" rows="10">${board.content }</textarea>
        </div>
      </div>
      <div class="form-group row">
        <label for="writer" class="col-md-2 col-form-label">작성자</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" id="writer" name="writer" placeholder="제목" value="${board.writer }" readonly="readonly" />
        </div>
      </div>
      <div class="form-group row">
        <label for="content" class="col-sm-2 col-form-label">등록일</label>
        <div class="col-sm-10">
          <input type="date" class="form-control" id="regdate" name="regdate" placeholder="등록일" value='<fmt:formatDate value="${board.regdate }" type="date" pattern="yyyy-MM-dd"/>' disabled="disabled" />
        </div>
      </div>
      
      <br />
    
      <div class="form-group row">
        <div class="col-md-12">
          <input type="button" class="btn btn-outline-secondary" value="목록" onclick="location.href='/board/list'" />
          <c:if test="${sessionScope.member.id eq board.writer }">
            <div class="float-right">
              <input type="reset" class="btn btn-success" value="초기화" />
              <input type="button" class="btn btn-primary" id="btn-complete" value="완료" />
              <input type="button" class="btn btn-secondary" id="btn-cancel" value="취소" />
            </div>
          </c:if>
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
