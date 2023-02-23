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

<!-- jquery연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- jquery ui 연결 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
	* { box-sizing:border-box; }
	body{
		background-color: #949cf5;
	}
	form {
	    width:600px;
	    /* height:600px; */
	    display : flex;
	    flex-direction: column;
	    align-items:center;
	    position : absolute;
	    top:50%;
	    left:50%;
	    transform: translate(-50%, -50%) ;
	    border: 1px solid rgb(89,117,196);
	    border-radius: 10px;
	}
	p{
		display: flex;
		margin: 5px;
	}
	
	.textBox {
	    width: 300px;
	    height: 40px;
	    border : 1px solid rgb(89,117,196);
	    /* border-radius:5px; */
	    padding: 10px;
	    margin-bottom: 10px;
	}
	
	label {
	    width:100px;
	    height:30px;
	    margin :8px 0;
	   
	}
	
	button {
	    background-color: rgb(89,117,196);
	    color : white;
	    width:300px;
	    height:50px;
	    font-size: 17px;
	    border : none;
	    border-radius: 5px;
	    margin : 20px 0 30px 0;
	}
	
	button:hover{
		cursor: pointer;
	}
	.title {
	    font-size : 50px;
	    margin: 40px 0 30px 0;
	}
	
	.msg {
	    height: 30px;
	    text-align:center;
	    font-size:16px;
	    color:red;
	    margin-bottom: 20px;
	}
	.gender-chk {
	    margin-top : 5px; 
	}
	.gender-chk label{
		margin-left : 10px;
		margin-right : 10px;
	}
</style>

</head>
<body>
	<form action="/member/memberEdit" method="post" onsubmit="return formCheck(this)">
   	 <div class="title">회원정보 수정</div>
    <div id="msg" class="msg"> ${URLDecoder.decode(pram.msg, "utf-8")} </div> 
    <p>
	    <label for="userId">아이디</label>
	    <input class="textBox" id="userId" type="text" name="userId" value = "${member.userId}" readonly="readonly">
    </p>
    <p>
	    <label for="userPwd">비밀번호</label>
	    <input class="textBox" id="userPwd" type="text" name="userPwd" placeholder="8~25자리의 특수문자,영소문자와 숫자 조합">
    </p>
    <p>
	    <label for="userName">이름</label>
	    <input class="textBox" id="userName" type="text" name="userName" placeholder="김한국">
    </p>
    <p>
	    <label for="userPhone">전화번호</label>
	    <input class="textBox" id="userPhone" type="text" name="userPhone" placeholder="ex) 01011112222">
    </p>
    <p>
	    <label for="userEmail">이메일</label>
	    <input class="textBox" id="userEmail" type="text" name="userEmail" placeholder="example@naver.com"> 
    </p>
    
    <button type="submit">수정하기</button>
    <button type="button" onclick="history.back();">이전 페이지로</button>
   </form> 
   <script>
       function formCheck(frm) {
   

          //변수에 담아주기
            var uid = document.getElementById("userId");
            var pwd = document.getElementById("userPwd");
            var uname = document.getElementById("userName");
            var female = document.getElementById("female");
            var male = document.getElementById("male");
            var mobile = document.getElementById("userPhone");
            var email_id = document.getElementById("userEmail");
            

            if (uid.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
              alert("아이디를 입력하세요.");
              uid.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
              return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
            };

            var regType1 = /^[A-Za-z0-9]{8,15}$/;

            if(!regType1.test(uid.value)){
                alert("8~15자리 영문 숫자조합으로 입력하세요.");
                uid.focus();
                uid.value="";
                return false;
            }

            if(isNaN(uid.value)==false){
                alert("영문은 1글자 이상 넣어야 합니다.");
                uid.focus();
                uid.value = "";
                return false;
            }

            if (pwd.value == "") {
              alert("비밀번호를 입력하세요.");
              pwd.focus();
              return false;
            };

            //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
            var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

            if (!pwdCheck.test(pwd.value)) {
              alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
              pwd.focus();
              pwd.value = "";
              return false;
            };

            if (repwd.value !== pwd.value) {
              alert("비밀번호가 일치하지 않습니다..");
              repwd.focus();
              
              return false;
            };

            if (uname.value == "") {
              alert("이름을 입력하세요.");
              uname.focus();
              return false;
            };

            if (!female.checked && !male.checked) { //둘다 미체크시
              alert("성별을 선택해 주세요.");
              female.focus();
              return false;
            }

            var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

            if(mobile.value == ""){
                alert("전화번호를 입력해주세요.")
                mobile.focus();
                mobile.value= "";
                return false;
            }

            if(mobile.value.length < 10 || mobile.value.length > 11){
                alert("번호를 제대로 입력해주세요.");
                mobile.focus();
                mobile.value ="";
                return false;
            }

            if (!reg.test(mobile.value)) {
              alert("전화번호는 숫자만 입력할 수 있습니다.");
              mobile.focus();
              return false;
            }

             if (email_id.value == "") {
               alert("이메일 주소를 입력하세요.");
               email_id.focus();
           	   return false;
             }
		alert("회원정보가 수정되었습니다.");
           return true;
       }

   </script>
</body>
</html>