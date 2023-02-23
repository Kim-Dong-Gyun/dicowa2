<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/memUpdate.css">
</head>
<body>
	<div id="wrap">
        <%@ include file="adHeader.jsp" %>

        <div id="container">
            <h2>회원정보수정 페이지</h2>
            <form action="#">
                <table class="signup_table">
                    
                    <tr>
                        <th>회원번호</th>
                        <td><input type="text" name="custno" id="custno"></td>
                    </tr>
                    
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" name="id" id="userid"></td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td><input type="text" name="pw" id="userpw"></td>
                    </tr>

                    <tr>
                        <th>이름</th>
                        <td><input type="text" name="name" id="username"></td>
                    </tr>

                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="phone" id="userphone"></td>
                    </tr>

                    <tr>
                        <th>이메일</th>
                        <td><input type="text" name="email" id="useremail"></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <button type="reset">취소</button>
                            <button type="submit">수정하기</button>
                        </td>
                    </tr>
                </table>
                
            </form>
        </div> <!--#container-->
    </div>
</body>
</html>