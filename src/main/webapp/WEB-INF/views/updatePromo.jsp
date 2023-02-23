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
<link rel="stylesheet" href="./resources/css/writepost.css">
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

        <%@ include file="header.jsp" %>

        <section id="section">
            <h2>홍보게시판 글 수정하기</h2>
            <form action="/updateP" method="post" role="form">
                <div class="postbody">
                
                    <table>
                        <tr class="write-title">
                        	<td>
                        		<input name="writer" value="${member.userId}" type="hidden">
                        		<input name="bno" value="${update.bno}" type="hidden">
                        	</td>
                            <td>
                                <div class="write-postbox">
                                	
                                    <input type="hidden" readonly="readonly" value="${update.cate}">
                                    
                                </div>
                            </td>
                            <td>
                                <div class="post-title">
                                    <!-- <input type="text" name="post-title" id="post-title" placeholder="제목"> -->
                                    <textarea name="title" id="usertitle" placeholder="제목 (25자이내)" maxlength="25">${update.title}</textarea>
                                </div>
                            </td>
                        </tr>
                        <tr class="write-postbody">
                            <td colspan="2" >
                                <div id="post-write">
                                    <textarea placeholder="내용 입력" name="contents" id="writebox">${update.contents}</textarea>
                                </div>
                            </td>
                        </tr>
                        
                        <div class="join_btn">
                            <!-- <button type="button" onclick="history.back();">이전페이지로</button>
                            (window삭제).history.back 뒤로가기/history.forward 앞으로가기
                            <button type="button" onclick="joinform_check();">등록하기</button> -->
                            <!-- 입력된 경우에 따라서 다르게 액션되면 button으로, 입력 값 상관 없이 무조건 보내기면 submit -->
                            <!-- type을 submit으로 하여 전송하기를 하지말고, script가서 함수를 만들고 전송하기를 함 button onclick으로 함수를 불러옴 함수안에 문제가 있는 경우 return false;-->
                            <input class="btn btn-light" type="reset" value="이전페이지" onclick="history.back();">
                            <input class="btn btn-light" type="submit" value="수정하기" onclick="">
                            
                        </div>
                    </table>
                </div>
            </form>
        </section>

        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>