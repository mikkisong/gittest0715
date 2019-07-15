<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
if(id==null){
	%><div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div>
	<%
}else{
	%><div id="login"><a href="../member/userUpdate.jsp"><%=id %>님</a> | <a href="../member/logout.jsp">Logout</a></div>
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp"><img src="../upload/reddit.png" width="200" height="50" alt="reddit"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">INTRODUCTION</a></li>
	<li><a href="../center/notice.jsp">NOTICE</a></li>
	<li><a href="../center/fnotice.jsp">BOARD</a></li>
</ul>
</nav>
</header>