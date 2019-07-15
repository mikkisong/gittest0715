<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDAO2"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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


</head>

<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>


<!-- 메인이미지 들어가는곳 -->


<div class="w3-content w3-display-container">
  <img class="mySlides" src="../upload/tulip.jpg" style="width:100%; height:500px; ">
  <img class="mySlides" src="../upload/kitty.jpg" style="width:100%;  height:500px; ">
  <img class="mySlides" src="../upload/town.jpg" style="width:100%;  height:500px; ">
  <img class="mySlides" src="../upload/tech.jpg" style="width:100%;  height:500px;">

  <button class="w3-button-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<script type="text/javascript">
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>



<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">

<%
// 전체 글 개수 
BoardDAO2 bdao2 = new BoardDAO2();
int count2= bdao2.getBoardCount();

// 현페이지 글 가져오기

int pageSize = 5;
//현페이지 번호
String pageNum = request.getParameter("pageNum");
//페이지 번호가 없으면 "1" 로 설정, 있으면 그 번호 넘어오게
if(pageNum == null){
	pageNum = "1";
}

int currentPage = Integer.parseInt(pageNum);
//시작하는 행번호 구하기
int startRow = (currentPage-1)*pageSize+1;	
//끝나는 행번호 구하기 => 1페이지 10, 2페이지 20
int endRow = (currentPage-1)*pageSize;

List boardList2=null;
if(count2!=0){boardList2=bdao2.getBoardList(startRow, pageSize);}
SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");


%>
<div id="news_notice">
<a href="../center/notice.jsp"><h3 class="brown">Notice</h3></a>
<table id="board">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th></tr>
       <%
    for(int i=0;i<boardList2.size();i++){
    	BoardBean2 bb=(BoardBean2)boardList2.get(i);
    	%>
 <tr><td><%=bb.getNum() %></td>
     <td><a href="../center/content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
     <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate()) %></td></tr>   	
    	<%
    }
    %>
</table>
</div>
<%
// 전체 글 개수 
BoardDAO bdao = new BoardDAO();
int count= bdao.getBoardCount();

// 현페이지 글 가져오기

pageSize = 5;
//현페이지 번호
pageNum = request.getParameter("pageNum");
//페이지 번호가 없으면 "1" 로 설정, 있으면 그 번호 넘어오게
if(pageNum == null){
	pageNum = "1";
}

currentPage = Integer.parseInt(pageNum);
//시작하는 행번호 구하기
startRow = (currentPage-1)*pageSize+1;	
//끝나는 행번호 구하기 => 1페이지 10, 2페이지 20
endRow = (currentPage-1)*pageSize;

List boardList=null;
if(count!=0){boardList=bdao.getBoardList(startRow, pageSize);}
sdf = new SimpleDateFormat("yyyy.MM.dd");


%>
<div id="news_notice">
<a href="../center/fnotice.jsp"><h3 class="brown">Board</h3></a>
<table id="board">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th></tr>
       <%
    for(int i=0;i<boardList.size();i++){
    	BoardBean bb2=(BoardBean)boardList.get(i);
    	%>
 <tr><td><%=bb2.getNum() %></td>
     <td><a href="../center/fcontent.jsp?num=<%=bb2.getNum()%>&pageNum=<%=pageNum%>"><%=bb2.getSubject() %></a></td>
     <td><%=bb2.getName() %></td><td><%=sdf.format(bb2.getDate()) %></td></tr>   	
    	<%
    }
    %>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>