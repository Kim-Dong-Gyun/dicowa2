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
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="./resources/css/login.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0" user-scaleble="yes">

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
      <header id="header">
            <div class="headerIn">
                <h1 class="logo">
                    <a href="/"><img src="./resources/img/로고.png" alt="디코와"></a>
                </h1>
            </div> <!-- //.headerIn -->
        </header><!-- .header -->
        <section id="section">
           <form action="/member/login" name="homeForm" method="post">
                <div class="loginbox">
                    <div class="idtext">
                        <input type="text" placeholder="id" name="userId" id="userId">
                    </div>
                    <div class="pwtext">
                        <input type="password" placeholder="pw" name="userPwd" id="userPwd">
                    </div>
                    <div class="submitbtn">
                        <button type="submit" value="로그인" id="loginbtn">로그인</button>
                    </div>
                </div>
                <div class="userUtil">
                    <ul>
                        <li><a href="#">아이디 찾기</a></li>
                        <li><a href="#">비밀번호 찾기</a></li>
                        <li><a href="<c:url value='/register'/>">회원가입</a></li>
                    </ul>
                </div> 
            </form>

            <div class="adImg">
                <a href="#"><img src="./resources/img/Weird.png"></a>
            </div>
        </section>
        
        <%@ include file="footer.jsp" %>
        
        <!-- <script src="./resources/js/login.js"></script> -->
    </div><!--#wrap-->
</body>
</html>