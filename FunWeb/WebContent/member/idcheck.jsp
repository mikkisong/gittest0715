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
	
	fid=document.wfr.fid.value;
	if(fid==""){
		alert("아이디를 입력하세요");
		document.wfr.fid.focus();
		return false;
	} 
	for (var i = 0; i < document.wfr.fid.value.length; i++) {
       ffid = document.wfr.fid.value.charAt(i)
        if (!(ffid >= '0' && ffid <= '9') && !(ffid >= 'a' && ffid <= 'z')) {
            alert("아이디는 영문 소문자, 숫자만 입력가능합니다.")
            document.wfr.fid.focus();
            document.wfr.fid.select();
            return false;
        }
	}
    //아이디에 공백 사용하지 않기
    if (document.wfr.fid.value.indexOf(" ") >= 0) {
        alert("아이디에 공백을 사용할 수 없습니다.")
        document.wfr.fid.focus();
        document.wfr.fid.select()
        return false;
    }
    //아이디 길이 체크 (4~12자)
   if (document.wfr.fid.value.length<4 || document.wfr.fid.value.length>12) {
        alert("아이디를 4~12자까지 입력해주세요.")
        document.wfr.fid.focus();
        document.wfr.fid.select();
        return false;
    }
	
	//join.jsp페이지 id.value= idcheck.jsp페이지 fid.value
	// window 내장객체  멤버변수 opener == join.jsp  창을 open() 한 페이지 
	opener.document.fr.id.value=document.wfr.fid.value;
	//창닫기
	window.close();
}


</script>
</head>
<body>
<%
// member/idcheck.jsp
// String id = fid 파라미터 가져와서 변수에 저장
String id=request.getParameter("fid");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// int check= idcheck(id) 메서드 호출
int check=mdao.idcheck(id);
// check==1   "아이디중복" 
// check==0   "아이디사용가능"
if(check==1){
	out.println("아이디중복");
}else{
	out.println("아이디사용가능");
	%>
	<input type="button" value="아이디 사용" onclick="ok()">
	<%
}
%>
<form action="idcheck.jsp" name="wfr" method="get">
아이디:<input type="text" name="fid" value="<%=id%>">
<input type="submit" value="아이디중복확인">
</form>
</body>
</html>

