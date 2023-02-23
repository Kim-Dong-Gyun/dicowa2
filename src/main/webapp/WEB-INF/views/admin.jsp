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
<link rel="stylesheet" href="./resources/css/admin.css">
</head>
<body>
	<div id="wrap">
        <%@ include file="adHeader.jsp" %>

        <div id="container">
            <h2>회원관리 페이지</h2>
            <form action="#">
                <table class="admin_table">
                    <thead class="admin_thead">
                        <tr>
                            <th>회원코드</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>가입일</th>
                            <th>게시글수</th>
                            <th>댓글수</th>
                            <th>추방여부</th>
                        </tr>
                    </thead>
                    <tbody class="admin_tbody">
                        <tr>
                            <td><a href="#">100001</a></td>
                            <td>김그린</td>
                            <td>rkskekfk</td>
                            <td>2022-12-10</td>
                            <td>12</td>
                            <td>5</td>
                            <td><button type="button">추방</button></td>
                        </tr>
                        <tr>
                            <td><a href="#">100002</a></td>
                            <td>김그린</td>
                            <td>rkskekfk</td>
                            <td>2022-12-10</td>
                            <td>12</td>
                            <td>5</td>
                            <td><button type="button">추방</button></td>
                        </tr>
                    </tbody>
                </table>
                <s_paging>
                    <div id="pagingM">
                    <br>
                    <a href="#" class="prev" title="이전페이지">◀ 이전 </a>
                    <s_paging_rep><a href="#" class="num">1</a></s_paging_rep>

                    <a href="#" class="prev" title="다음페이지">다음 ▶</a>
                    <br />&nbsp;
                    </div>
                </s_paging>
            </form>
        </div>

        <%@ include file = "adFooter.jsp" %>
    </div><!--#wrap-->
</body>
</html>