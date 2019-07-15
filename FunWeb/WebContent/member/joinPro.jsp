<%@page import="mail.MailSend"%>
<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 회원가입
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name=request.getParameter("name");
String email = request.getParameter("email");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
int post =Integer.parseInt(request.getParameter("post"));
String phone=request.getParameter("phone");
String mobile= request.getParameter("mobile");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address1 + ", " + address2);
mb.setMobile(mobile);
mb.setPhone(phone);
mb.setReg_date(reg_date);
mb.setPost(post);

%>
<jsp:useBean id="mbb" class="member.MemberBean"/>
<jsp:setProperty property="*" name="mbb"/>
<%
MemberDAO mdao = new MemberDAO();
MailSend mailSend = new MailSend();
mdao.insertMember(mb);
MailSend.mailSend(mb.getEmail());
	
// response.sendRedirect("login.jsp");



// 이메일주소 중복확인


%>
<script type="text/javascript">
alert("가입완료!");
location.href="login.jsp";
</script>

</body>
</html>