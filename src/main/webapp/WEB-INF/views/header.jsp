<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
		$(document).ready(function(){
			$("#logoutBtn").on("click", function(){
				alert("로그아웃 하시겠습니까?");
				location.href="member/logout";
			})
			
		})
		$(document).ready(function(){
			$(".logoutBtn").on("click", function(){
				alert("로그아웃 하시겠습니까?");
				location.href="member/logout";
			})
			
		})
</script>

<header class="header">
	<div class="headerIn">
      <h1 class="logo">
          <a href="/"><img src="./resources/img/로고.png" alt="디코와"></a>
      </h1>
  
      <nav class="nav">
          <a class="nav-link" href="<c:url value='/noticeList'/>">공지</a>
          <a class="nav-link" href="<c:url value='/rankList'/>">인기채널</a>
          <a class="nav-link" href="<c:url value='/promoList'/>">채널홍보</a>
          <a class="nav-link" href="<c:url value='/eventList'/>">이벤트</a>
      </nav>
      
      
      <div class="util">
			
	          <ul class>
	          	<c:if test="${member == null }">
	              <li><a href="<c:url value='/login'/>">로그인</a></li>
	              <li><a href="<c:url value='/register'/>">회원가입</a></li>
              	</c:if>
              	
              	<c:if test="${member != null }">
              		<li>${member.userId }님 환영합니다.</li>
              		<li><button type="button" id="logoutBtn">로그아웃</button></li>
              	</c:if>
	          </ul>
          
          
      </div>
	</div><!--.headerIn-->
</header><!--.header-->