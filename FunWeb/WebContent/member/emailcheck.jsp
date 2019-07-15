<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	

	function ok() {
		
		
		var femail = document.wfr.femail.value;
		if (femail == "") {
			alert("이메일주소를 입력하세요");
			document.wfr.femail.focus();
			return false;
		}

		// 이메일형식 체크

		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(femail) == false) {

			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			

			alert("이메일형식이 올바르지 않습니다.");

			document.wfr.femail.focus();
			document.wfr.femail.select();

			return false;

		}
		
		//join.jsp페이지 id.value= idcheck.jsp페이지 fid.value
		// window 내장객체  멤버변수 opener == join.jsp  창을 open() 한 페이지 
		opener.document.fr.email.value = document.wfr.femail.value;
		//창닫기
		window.close();
	
	}
</script>
</head>
<body>
	<%
		// member/emailcheck.jsp
		String email = request.getParameter("femail");
		// MemberDAO mdao 객체생성
		MemberDAO mdao = new MemberDAO();
		// int check= idcheck(id) 메서드 호출
		int check = mdao.emailcheck(email);
		// check==1   "아이디중복" 
		// check==0   "아이디사용가능"
		if (check == 1) {
			out.println("이미 등록된 이메일입니다.");
		} else {
			out.println("사용가능한 이메일");
	%>
	<input type="button" value="이메일 사용" onclick="ok()">
	<%
		}
	%>
	<form action="emailcheck.jsp" name="wfr" method="get">
		이메일:<input type="text" name="femail" value="<%=email%>"> <input
			type="submit" value="이메일중복확인">
	</form>
</body>
</html>

