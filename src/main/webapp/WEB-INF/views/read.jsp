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
<link rel="stylesheet" href="./resources/css/watchpost.css">

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

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
        <%@include file = "header.jsp" %>

        <section id="section">
            <form name = "readForm" role="form" method = "post">
            	<input type="hidden" name = "bno" value="${boardDto.bno }">
            	
                <div class="article-box">
                    <div class="article-title">
                        <ul>
                            <li>작성일 : <fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${boardDto.regdate }"/></li>
                            <li>작성자 : ${boardDto.writer }</li>
                            <li>제목 : ${boardDto.title }</li>
                            <li>조회수 : ${boardDto.viewcnt }</li>
                            <li>추천 : ${boardDto.goodcnt }</li>
                        </ul>
                    </div>

                    <div class="article-box2">
                        <div class="user-content">
                            <div class="user-text">
                               	
                                	${boardDto.contents}
                            	
                            </div>
                        </div>
                        <div class="article-btns">
                        	<c:if test="${member.userId !=null }">
                        		<c:if test="${member.userId == boardDto.writer }">
		                            <button type="button" id="modifyBtn">수정</button>
		                            <button type="button" id="deleteBtn">삭제</button>
	                            </c:if>
                            </c:if>
                            <button type="button" id="listBtn">글목록</button>
                            <button type="button" class="goodbtn">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                    <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
                                </svg>
                                <span>${boardDto.goodcnt }</span>
                            </button>
                        </div>
                    </div>
                    
                
                
                
                    
                    <div class="ucomment">
                        <ul>
                        	<c:forEach items="${replyList }" var="replyList">
	                            <li class="row">
	                                <div class="cmt-one">
	                                    <strong>
	                                        <span class="nickname">${replyList.writer }</span>
	                                        <span class="date"><fmt:formatDate value="${replyList.regdate }" pattern="(yyyy-MM-dd HH:mm:ss)"/></span>
	                                    </strong>
	                                    <c:if test="${member.userId != null }">
	                                    	<c:if test="${member.userId == replyList.writer }">
			                                    <div class="goodbadbar">
			                                        <span class="goodbad-btn">
			                                            <button type="button" class="replyUpdateBtn" data-rno="${replyList.rno }">
			                                                수정
			                                            </button>
			                                        </span>
			                                        <span class="goodbad-btn">
			                                            <button type="button" class= "replyDeleteBtn" data-rno="${replyList.rno }">
			                                                삭제
			                                            </button>
			                                        </span>
			                                    </div>
		                                    </c:if>
	                                    </c:if>
	                                    <div class="cmt-text">
	                                        <p>${replyList.contents }</p>
	                                    </div>
	                                </div>
	                            </li>
                            </c:forEach>
                            <li class="row-reply">
                                <div class="cmt-one">
                                    <strong>
                                        <span class="nickname">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-90deg-up" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M4.854 1.146a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L4 2.707V12.5A2.5 2.5 0 0 0 6.5 15h8a.5.5 0 0 0 0-1h-8A1.5 1.5 0 0 1 5 12.5V2.707l3.146 3.147a.5.5 0 1 0 .708-.708l-4-4z"/>
                                            </svg>
                                            답글작성자명1
                                        </span>
                                        <span class="date">(2022-12-14 15:11)</span>
                                    </strong>
                                    <div class="goodbadbar">
                                        <span class="goodbad-btn">
                                            <button class="">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
                                                    <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
                                                </svg><span>: 3</span>
                                            </button>
                                        </span>
                                        <span class="goodbad-btn">
                                            <button>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-down" viewBox="0 0 16 16">
                                                    <path d="M8.864 15.674c-.956.24-1.843-.484-1.908-1.42-.072-1.05-.23-2.015-.428-2.59-.125-.36-.479-1.012-1.04-1.638-.557-.624-1.282-1.179-2.131-1.41C2.685 8.432 2 7.85 2 7V3c0-.845.682-1.464 1.448-1.546 1.07-.113 1.564-.415 2.068-.723l.048-.029c.272-.166.578-.349.97-.484C6.931.08 7.395 0 8 0h3.5c.937 0 1.599.478 1.934 1.064.164.287.254.607.254.913 0 .152-.023.312-.077.464.201.262.38.577.488.9.11.33.172.762.004 1.15.069.13.12.268.159.403.077.27.113.567.113.856 0 .289-.036.586-.113.856-.035.12-.08.244-.138.363.394.571.418 1.2.234 1.733-.206.592-.682 1.1-1.2 1.272-.847.283-1.803.276-2.516.211a9.877 9.877 0 0 1-.443-.05 9.364 9.364 0 0 1-.062 4.51c-.138.508-.55.848-1.012.964l-.261.065zM11.5 1H8c-.51 0-.863.068-1.14.163-.281.097-.506.229-.776.393l-.04.025c-.555.338-1.198.73-2.49.868-.333.035-.554.29-.554.55V7c0 .255.226.543.62.65 1.095.3 1.977.997 2.614 1.709.635.71 1.064 1.475 1.238 1.977.243.7.407 1.768.482 2.85.025.362.36.595.667.518l.262-.065c.16-.04.258-.144.288-.255a8.34 8.34 0 0 0-.145-4.726.5.5 0 0 1 .595-.643h.003l.014.004.058.013a8.912 8.912 0 0 0 1.036.157c.663.06 1.457.054 2.11-.163.175-.059.45-.301.57-.651.107-.308.087-.67-.266-1.021L12.793 7l.353-.354c.043-.042.105-.14.154-.315.048-.167.075-.37.075-.581 0-.211-.027-.414-.075-.581-.05-.174-.111-.273-.154-.315l-.353-.354.353-.354c.047-.047.109-.176.005-.488a2.224 2.224 0 0 0-.505-.804l-.353-.354.353-.354c.006-.005.041-.05.041-.17a.866.866 0 0 0-.121-.415C12.4 1.272 12.063 1 11.5 1z"/>
                                                </svg><span>: 1</span>
                                            </button>
                                        </span>
                                    </div>
                                    <div class="cmt-text">
                                        <p>답글내용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
                                    </div>
                                </div>
                            </li>
                           
                        </ul>
                    </div>
                </form>

                
            <c:if test="${member.userId != null }">
	            <div class="comment-box">
	                    <h5>댓글란</h5>
	                    <form name="replyForm" method="post" action="/replyWrite">
		                    <div class="write-comment">
			                    
			                    	<input type="hidden" id="bno" name="bno" value="${boardDto.bno }">
			                    	<input type="hidden" id="page" name="page" value="${scri.page}">
			                    	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum }">
			                    	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }">
			                    	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }">
			                        <table>
			                            <tr>
			                                <td>
			                                	<input type="hidden" id="writer" name="writer" value="${member.userId }">
			                                    <textarea name="contents" id="contents" placeholder="여기에 댓글 입력 (100자 이내)" maxlength="100"></textarea>
			                                </td>
			
			                                <td>
			                                    <button type="submit" class="replyWrtieBtn" id="replyWrtieBtn">등록</button>
			                                </td>
			                            </tr>
			                        </table>
			                    
		                    </div>
	                    </form>
	           	</div>
           	</c:if>
        </section>

        <%@ include file ="footer.jsp" %>

    </div>
    
    
    <script>
      $(function(){
        $('#listBtn').click(function() {
        	alert("글목록으로 돌아갑니다.");
          location.href="/rankList";
        });
      });   
      
      $(function(){
          $('#modifyBtn').click(function() {
          	alert("글을 수정합니다.");
          	location.href="/updatePromo?bno=${boardDto.bno}";
          });
        });
            
 
      $(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 삭제
			$("#deleteBtn").on("click", function(){
				alert("게시글을 삭제하시겠습니까?");
				formObj.attr("action", "/deleteP");
				formObj.attr("method", "post");
				formObj.submit();
			})
			//댓글 수정 View
			 $(".replyUpdateBtn").on("click", function(){
				location.href = "/replyUpdateView?bno=${boardDto.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
		//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/replyDeleteView?bno=${boardDto.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
			
		})  
	
    </script>
</body>
</html>