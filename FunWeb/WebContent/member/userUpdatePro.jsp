<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
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
// 회원정보수정 
request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");

String pass = request.getParameter("pass");
String email = request.getParameter("email");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
int post =Integer.parseInt(request.getParameter("post"));
String phone=request.getParameter("phone");
String mobile= request.getParameter("mobile");

MemberBean mb = new MemberBean();
mb.setId(id);
mb.setEmail(email);
mb.setAddress(address1 + ", " + address2);
mb.setMobile(mobile);
mb.setPhone(phone);
mb.setPost(post);
if(pass != ""){
mb.setPass(pass);
}else{
	pass="";
}


MemberDAO dao = new MemberDAO();
dao.userUpdate(mb);

%>


<script type="text/javascript">
alert("회원정보 수정완료!");
location.href="userUpdate.jsp";
</script>


</body>
</html>