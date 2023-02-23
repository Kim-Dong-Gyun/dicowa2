<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="./resources/css/notice.css">

<!-- jquery연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- jquery ui 연결 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
	 <div id="wrap">
        <%@ include file="header.jsp" %>
        
        <div id="container">
            <div class="left-board">
                <div class="user-box">
                    <c:if test="${member != null }">
	                    <h6>${member.userId }님</h6>
	                    <ul>
	                        <li><a href="<c:url value='/memberEdit'/>">개인정보 수정</a></li>
	                        <li><button type="button" class="logoutBtn">로그아웃</button></li>
	                    </ul>
                    </c:if>
                    <c:if test = "${member == null }">
                    	<h6>로그인을 해주세요.</h6>
                    	<ul>
                    		<li><a href="<c:url value='/login'/>">로그인</a></li>
                    		<li><a href="<c:url value='/register'/>">회원가입</a>
                    	</ul>
                    </c:if>
                </div>
                <div class="left-index">
                    <h6>게시판 모음</h6>
                    <ul>
                        <li><a href="<c:url value='/noticeList'/>">공지 게시판</a></li>
                        <li><a href="<c:url value='/eventList'/>">이벤트 게시판</a></li>
                        <li><a href="<c:url value='/promoList'/>">채널홍보 게시판</a></li>
                        <li><a href="<c:url value='/rankList'/>">인기채널 게시판</a></li>
                    </ul>
                </div>
            </div>
            <div class="notice">
                <h2>공지 게시판</h2>
                <form action="#" role="form" method="get">
                    <table class="notice-board">
                        <thead class="tblhead">
                            <tr>
                                <th>글번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>추천수</th>
                            </tr>
                        </thead>
                       <c:set var = "num" value="${pageMaker.totalCount - (pageMaker.cri.page-1) * pageMaker.cri.perPageNum }"/>
                        	<c:forEach var="boardDto" items="${boardDto}">
	                        <tbody class="tblbody">
	                            <tr>
	                                <td>${num}</td>
	                                <td><a href="/noticeRead?bno=${boardDto.bno}">${boardDto.title }</a></td>
	                                <!-- <span class="category">[말머리]</span>&nbsp;&nbsp; -->
	                                <td>${boardDto.writer }</td>
	                                <td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${boardDto.regdate }"/></td>
	                                <td>${boardDto.viewcnt }</td>
	                                <td>${boardDto.goodcnt }</td>
	                            </tr>

	                        </tbody>
	                        <c:set var = "num" value="${num - 1 }"/>
                        </c:forEach>
                    </table>
                    <c:if test="${member.userId != null }">
	                    <div class="write-btn">
	                        <button type="button" id="writeBtn" class="btn btn-light" onclick="location.href='<c:url value="/writePost"/>'">글쓰기</button>
	                    </div>
                    </c:if>
                    <div class="searchbar">
                        <select name="searchType">
                            <option value="n"<c:out value="${scri.searchType == null ? 'selected' : '' }"/>>선택</option>
                            <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : '' }"/>>제목</option>
                            <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : '' }"/>>내용</option>
                            <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : '' }"/>>작성자</option>
                        </select>
                        <input type="text" id="keywordInput" name="keyword" value="${scri.keyword }"/>
                        <button type="submit" class="user-search" id="searchBtn">검색</button>
                    </div>
                    <div class="bottom">
                        <s_paging>
                            <div id="pagingM">
                            <br>
                            <c:if test="${pageMaker.prev }">
                            	<a href="noticeList${pageMaker.makeSearch(pageMaker.startPage - 1)}" class="prev" title="이전페이지">◀ 이전 </a>
                            </c:if>
                            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                            	<s_paging_rep><a href="noticeList${pageMaker.makeSearch(idx)}" class="num">${idx}</a></s_paging_rep>
                            </c:forEach>
                            <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
                            	<a href="noticeList${pageMaker.makeSearch(pageMaker.endPage +1)}" class="prev" title="다음페이지">다음 ▶</a>
                            </c:if>
                            <br />&nbsp;
                            </div>
                        </s_paging>
                    </div>
                </form>
                
            </div>
        </div> <!--#container-->

        <%@ include file = "footer.jsp" %>
    </div> <!--#wrap-->
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "boardDto" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
</body>
</html>