<%@page import="com.sun.glass.ui.CommonDialogs.Type"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
<script type="text/javascript">

function idcheck(){
	
	fid=document.fr.id.value;
	if(fid==""){
		alert("아이디를 입력하세요");
		document.fr.id.focus();
		return false;
	} 
	for (var i = 0; i < document.fr.id.value.length; i++) {
       ffid = document.fr.id.value.charAt(i)
        if (!(ffid >= '0' && ffid <= '9') && !(ffid >= 'a' && ffid <= 'z')) {
            alert("아이디는 영문 소문자, 숫자만 입력가능합니다.")
            document.fr.id.focus();
            document.fr.id.select();
            return false;
        }
    
    //아이디에 공백 사용하지 않기
    if (document.fr.id.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.fr.id.focus();
        document.fr.id.select()
        return false;
    }
    //아이디 길이 체크 (4~12자)
   if (document.fr.id.value.length<4 || document.fr.id.value.length>12) {
        alert("아이디를 4~12자까지 입력해주세요.")
        document.fr.id.focus();
        document.fr.id.select();
        return false;
    }
	}
	window.open("idcheck.jsp?fid="+fid, "", "width=400,height=200");
	
}

function emailcheck(){
	
	var femail=document.fr.email.value;
	if(femail==""){
		alert("이메일주소를 입력하세요");
		document.fr.email.focus();
		return false;
	} 
	
	
	// 이메일형식 체크

	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(femail)==false){

		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

		alert("이메일형식이 올바르지 않습니다.");

		document.fr.email.focus();
		document.fr.email.select();

		return false;

	}
	window.open("emailcheck.jsp?femail="+femail, "", "width=400,height=200");

}

function fincheck(){
	if(document.fr.id.value==""){
		alert("아이디를 입력하세요!")
		document.fr.id.focus();
		return false;
	}
	
	if(document.fr.pass.value =="" || document.fr.pass2.value=="") {
		alert("비밀번호를 입력하세요!")
		document.fr.pass.focus();
		return false;
	}
	
	if(document.fr.pass.value != document.fr.pass2.value){
		alert("비밀번호가 일치하지 않습니다.")
		document.fr.pass.focus();
		return false;
	}
	
	if(document.fr.name.value =="") {
		alert("이름을 입력하세요!")
		document.fr.name.focus();
		return false;
	}
	
	if(document.fr.email.value =="" || document.fr.email2.value =="") {
		alert("이메일을 입력하세요!")
		document.fr.email.focus();
		return false;
	}
	
	if(document.fr.email.value != document.fr.email2.value) {
		alert("이메일주소가 일치하지 않습니다.")
		document.fr.email.focus();
		return false;
	}
	
	
		
}

</script>
</head>
<body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraRoadAddr !== ''){
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById('post').value = data.zonecode;
                 document.getElementById("address1").value = roadAddr;

                 var guideTextBox = document.getElementById("guide");

            }
        }).open();
    }
</script>

<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<h1>Join Us</h1>
<form action="joinPro.jsp" id="join" method="post" name="fr" onsubmit="return fincheck()" >
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id">
<input type="button" value="dup. check" class="dup" onclick="idcheck()"><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Retype Password</label>
<input type="password" name="pass2"><br>
<label>Name</label>
<input type="text" name="name"><br>
<label>E-Mail</label>
<input type="email" name="email" placeholder="mmk2@naver.com">
<input type="button" value="dup. check" class="dup" onclick="emailcheck()"><br>
<label>Retype E-Mail</label>
<input type="email" name="email2"><br>
</fieldset>



<fieldset>
<legend>Optional</legend>
<label>우편번호</label>
<input type="text" id="post" name="post" placeholder="우편번호">
<input type="button" value="우편번호검색" class="dup" onclick="sample4_execDaumPostcode()"><br>
<label>도로명주소</label><input type="text" name="address1" id="address1">
<br>
<label>상세주소</label>
<input type="text" id="sample4_detailAddress" name="address2" placeholder="건물명, 동, 호수"><br>

<label>Phone Number</label>
<input type="text" name="phone"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile"><br>
</fieldset>


<div class="clear"></div>
<div id="buttons">
<input type="submit" value="가입" class="submit">
<input type="reset" value="초기화" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>