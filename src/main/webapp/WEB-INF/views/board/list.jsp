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
		//찾기
		$("#btn-search").on("click", function() {
			$("#searchForm").attr("action", "<c:url value='/board/list' />");
			$("#searchForm").submit();
		});
		//새 글쓰기
		$("#btn-register").on("click", function() {
			if("<c:out value='${sessionScope.member.id}' />" == "") {
				alert("로그인 후 이용해주세요.");
				$("#id").focus();
				return;
			}
			else {
				location.href="<c:url value='/board/register' />";
			}
		});
	});

	//페이징 처리
	function goPage(idx) {
		$("#searchForm").attr("action", "<c:url value='/board/list' />");
		$("#searchForm").append($("<input/>", {type: "hidden", name: "currentIdx", value: idx}));
		$("#searchForm").submit();
	}
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
    
    <div class="form-group row">
      <div class="col-md-6">
        <form id="searchForm" name="searchForm" action="#" method="GET">
          <div class="input-group">
            <div class="input-group-prepend">
              <span class="input-group-text">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"></path>
                  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"></path>
                </svg>
              </span>
            </div>
            <input type="search" class="form-control" name="keyword" placeholder="찾을 단어" value="${param.keyword }" list="keywordList" />
            <datalist id="keywordList">
              <option value="인기 검색어1">
              <option value="인기 검색어2">
              <option value="인기 검색어3">
            </datalist>
            <div class="input-group-append">
              <input type="button" class="btn btn-outline-secondary" id="btn-search" value="찾기" />
            </div>
          </div>
        </form>
      </div>
      <div class="col-md-6">
        <input type="button" class="btn btn-primary float-right" id="btn-register" value="새 글쓰기" />
      </div>
    </div>
    
    <br />
    
    <table class="table table-bordered table-hover table-striped">
      <caption>검색된 게시물 수: ${boardCount }</caption>
      <thead>
        <tr>
          <th class="center" scope="col" width="10%">글번호</th>
          <th class="center" scope="col" width="40%">제목</th>
          <th class="center" scope="col" width="15%">작성자</th>
          <th class="center" scope="col" width="15%">등록일</th>
          <th class="center" scope="col" width="10%">조회수</th>
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
    
    <!-- pagination -->
    <div class="form-group row pagination" style="text-align: center;">
      <div class="col-md-12">
        <c:if test="${!empty pageUtil }">
          <c:if test="${pageUtil.firstIdx ne pageUtil.startIdx }">
          <a class="btn btn-sm btn-outline-secondary" href="javascript:goPage(${pageUtil.firstIdx })" role="button">&laquo;</a>
          </c:if>
          <c:if test="${pageUtil.prevIdx ne pageUtil.startIdx }">
          <a class="btn btn-sm btn-outline-secondary" href="javascript:goPage(${pageUtil.prevIdx })" role="button">&lt;</a>
          </c:if>
          <c:forEach var="i" begin="${pageUtil.startIdx }" end="${pageUtil.endIdx }" varStatus="status">
            <c:choose>
              <c:when test="${pageUtil.currentIdx eq i }">
                <a class="btn btn-sm btn-primary">${i }</a>
              </c:when>
              <c:otherwise>
                <a class="btn btn-sm btn-outline-secondary" href="javascript:goPage(${i })" role="button">${i }</a>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:if test="${pageUtil.nextIdx gt pageUtil.endIdx }">
          <a class="btn btn-sm btn-outline-secondary" href="javascript:goPage(${pageUtil.nextIdx })" role="button">&gt;</a>
          </c:if>
          <c:if test="${pageUtil.finalIdx gt pageUtil.endIdx }">
          <a class="btn btn-sm btn-outline-secondary" href="javascript:goPage(${pageUtil.finalIdx })" role="button">&raquo;</a>
          </c:if>
        </c:if>
      </div>
    </div>
    <!-- /pagination -->

	<br />
    <hr />

	<!-- footer -->
	<%@ include file="../common/footer.jspf" %>
	<!-- /footer -->
    
  </div> <!-- /container -->

</body>
</html>
