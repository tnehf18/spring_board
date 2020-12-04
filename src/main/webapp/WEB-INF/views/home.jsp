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

  <title>스프링 프레임워크 실무 - 과제물</title>

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
  
</head>
<body>

  <!-- top nav -->
  <%@ include file="./common/top.jspf" %>
  <!-- /top nav -->

  <div class="jumbotron" style="margin-top: 2em;">
    <div class="container">
      <h1>스프링 게시판 만들기</h1><small>To. <a href="mailto:miya_2009@naver.com">miya_2009@naver.com</a></small>
      <p class="custom_p">1. Mybatis 사용</p>
      <p class="custom_p">2. 객체 활용</p>
      <p class="custom_p">3. CRUD 기능 구현</p>
      <p class="custom_p">4. 조회수 기능 구현</p>
      <hr />
      <p class="custom_p">+ 로그인 기능 구현</p>
      <p class="custom_p">+ 세션 활용</p>
      <p class="custom_p">+ Ajax 활용</p>
      <p class="custom_p">+ 부트스트랩 사용</p>
      <p class="custom_p">+ 페이징 처리</p>
      <p><a class="btn btn-primary btn-lg" href="<c:url value='/board/list' />" role="button">확인하러 가기 &raquo;</a></p>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <h3>가장 최근 게시물</h3>
      <table class="table table-bordered table-hover table-striped">
        <caption>총 게시물 수: ${boardCount }</caption>
        <thead>
          <tr>
            <th scope="col" width="10%">글번호</th>
            <th scope="col" width="40%">제목</th>
            <th scope="col" width="15%">작성자</th>
            <th scope="col" width="15%">등록일</th>
            <th scope="col" width="10%">조회수</th>
          </tr>
        </thead>
        <tbody>
          <c:choose>
            <c:when test="${!empty boardList }">
              <c:forEach var="board" items="${boardList }">
                <tr>
                  <td scope="row">${board.bno }</td>
                  <td><a href="<c:url value='/board/${board.bno }' />" >${board.title }</a></td>
                  <td>${board.writer }</td>
                  <td><fmt:formatDate value="${board.regdate }" type="date" pattern="yy-MM-dd HH:mm:ss"/></td>
                  <td>${board.readcnt }</td>
                </tr>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <tr>
                <td colspan="5" class="center">조회된 목록이 없습니다.</td>
              </tr>
            </c:otherwise>
          </c:choose>
        </tbody>
      </table>
    </div>

    <hr>
    
	<!-- footer -->
	<%@ include file="./common/footer.jspf" %>
	<!-- /footer -->
    
  </div> <!-- /container -->

</body>
</html>
