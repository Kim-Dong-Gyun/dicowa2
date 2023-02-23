<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<link rel="stylesheet" href="./resources/css/style.css">

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
            <div class="autoplay">
                <div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="./resources/img/Notice_asset_LoL.jpg" class="img-fluid rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <a href="https://discord.gg/2rjDvXHS" target='_blank'> <!-- 인기채널 게시판으로 링크 -->
                                <div class="card-body">
                                <h5 class="card-title">인기채널1</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </a>
                          </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            <img src="./resources/img/음악.jpg" class="img-fluid rounded-start" alt="...">
                          </div>
                          <div class="col-md-8">
                            <a href="https://discord.gg/xVBCqjCa" target='_blank'> <!-- 인기채널 게시판으로 링크 -->
                                <div class="card-body">
                                <h5 class="card-title">인기채널2</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </a>
                          </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="card mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                          <div class="col-md-4">
                            
                            <img src="./resources/img/그림.jpg" class="img-fluid rounded-start" alt="...">
                            
                          </div>
                          <div class="col-md-8">
                            <a href="https://discord.gg/4bqbHpCE" target='_blank'> <!-- 인기채널 게시판으로 링크 -->
                                <div class="card-body">
                                <h5 class="card-title">인기채널3</h5>
                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                                </div>
                            </a>
                          </div>
                        </div>
                    </div>
                </div>
                
            </div>
            
            

            <div class="main1">
                <h3>디코와 메뉴</h3>
                <ul>
                    <a href="#">
                        <li>
                            <img src="./resources/img/Gray.png"><span>개인홍보 게시판</span>
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <img src="./resources/img/Yellow.png"><span>채널 후기</span>
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <img src="./resources/img/Green.png"><span>디스코드 봇 만들기</span>
                        </li>
                    </a>
                    <a href="#">
                        <li>
                            <img src="./resources/img/Weird.png"><span>디스코드 채널 관리</span>
                        </li>
                    </a>
                </ul>
            </div>
            
            <div class="main2">
                <h3>채널소개</h3>
                <ul>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명1</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary" target='_blank'>바로가기</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명2</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary">바로가기</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명3</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary">바로가기</a>
                            </div>
                        </div>
                    </li>
                </ul>
                <ul>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명4</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary">바로가기</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명5</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary">바로가기</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="card" style="width: 18rem;">
                            <img src="./resources/img/download.png" class="card-img-top" alt="...">
                            <div class="card-body">
                              <h5 class="card-title">채널명6</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                              <a href="<c:url value='https://discord.gg/2c6HZ74x'/>" class="btn btn-primary">바로가기</a>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>

            <div class="main3">
                
                <div class="card text-bg-light">
                    <a href="#"><img src="./resources/img/음악.jpg" class="card-img" alt="..."></a>
                    <div class="card-img-overlay">
                    
                        <a href="<c:url value='https://discord.gg/BykV72WT'/>" target='_blank'><h4 class="card-title">이벤트 하는 채널명</h4></a> <!-- 이벤트채널 -->

                        <a href="<c:url value='https://discord.gg/BykV72WT'/>"><p class="card-text">이벤트 내용~</p></a>
                    </div>
                </div>
                
            </div>
        </div><!--.container-->

        <%@ include file="footer.jsp" %>
        
        <script src="./resources/js/index.js"></script>
    </div> <!--#wrap-->
</body>
</html>