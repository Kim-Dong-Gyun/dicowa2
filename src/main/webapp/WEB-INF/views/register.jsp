<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <!-- jquery연결 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- jquery ui 연결 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
        
        .textBoxId {
            width: 240px;
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
		
		.idChk{
			background-color: rgb(89,117,196);
			color : white;
			border : none;
			width : 60px;
			height : 40px;
			border-ridus : 5px;
			font-size : 10px;
		}
		
		.idChk:hover{
			cursor: pointer;
		}
		
        .signBtn {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
		
		.signBtn:hover{
			cursor: pointer;
		}
		
		.backBtn {
            background-color: rgb(89,117,196);
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
		
		.backBtn:hover{
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
    <title>Register</title>
</head>
<body>
   <form action="/member/register" method="post" onsubmit="return formCheck(this)">
   	 <div class="title">회원가입</div>
    <div id="msg" class="msg"> ${URLDecoder.decode(pram.msg, "utf-8")} </div> 
    <p>
	    <label for="userId">아이디</label>
	    <input class="textBoxId" id="userId" type="text" name="userId" placeholder="8~15자리의 영문자와 숫자 조합">
	    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
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
    <p>
    <div class="gender-chk">
    	<label>성별</label>
        <label for="userGender">남<input type="radio" value="M" name="userGender" id="male"></label>
        <label for="userGender">여<input type="radio" value="F" name="userGender" id="female"></label>
    </div>
    </p>
    <button type="submit" class = "signBtn">가입하기</button>
    <button type="button" class= "backBtn" onclick="history.back();">이전 페이지로</button>
   </form> 
   <script>
       function formCheck(frm) {
   

          //변수에 담아주기
            var uid = document.getElementById("userId");
          	var idChk = document.getElementById("idChk");
            var pwd = document.getElementById("userPwd");
            var uname = document.getElementById("userName");
            var female = document.getElementById("female");
            var male = document.getElementById("male");
            var mobile = document.getElementById("userPhone");
            var email_id = document.getElementById("userEmail");
            console.log(idChk);

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
            
            if(idChk.value == "N"){
            	alert("중복확인 버튼을 눌러주세요.");
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

           return true;
       }
       
       
       function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
   </script>
   
</body>
</html>
