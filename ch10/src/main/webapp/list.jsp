<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head><body>
<%	final int ROW_PER_PAGE = 10;     // 한페이지에 10개씩
	final int PAGE_PER_BLOCK = 10;   // 한블럭에 10페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum.equals("")) pageNum = "1";
	int currentPage = Integer.parseInt(pageNum);
	MemberDao md = MemberDao.getInstance();	 
	int total = md.getTotal();  
	// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1				
	int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
	// 끝번호 	시작번호 + 페이지당개수 - 1			
	int endRow = startRow + ROW_PER_PAGE - 1;
	List<Member> list = md.list(startRow, endRow); 
	int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);   // 총 페이지 수
	// 시작페이지	현재페이지 - (현재페이지 - 1)%10			
	int startPage = currentPage - (currentPage - 1)%PAGE_PER_BLOCK;
	// 끝페이지	시작페이지 + 블록당페이지 수 - 1
	int endPage = startPage + PAGE_PER_BLOCK - 1;
	// 총 페이지보다 큰 endPage나올 수 없다
	if (endPage > totalPage) endPage = totalPage;
	pageContext.setAttribute("list", list);
%>
<table><caption>회원정보</caption>
	<tr><th>아이디</th><th>이름</th><th>주소</th><th>전화</th><th>가입일</th><th>삭제</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="6">데이터가 없습니다</th></tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="member" items="${list }">
		<tr><td>${member.id }</td><td>${member.name }</td>
			<td>${member.address }</td><td>${member.tel}</td>
			<td>${member.reg_date}</td><td>${member.del}</td></tr>
	</c:forEach>
</c:if>
</table>
<div align="center">
	<% if (startPage > PAGE_PER_BLOCK) { %>
		<button onclick="location.href='list.jsp?pageNum=<%=startPage - 1%>'">이전</button>
	<% } %>
	<c:forEach var="i" begin="<%=startPage %>" end="<%=endPage %>">
		<button onclick="location.href='list.jsp?pageNum=${i}'">${i }</button>
	</c:forEach>
<!-- 	보여줄 것이 아직 남아있다 -->
	<% if (endPage < totalPage) { %>
		<button onclick="location.href='list.jsp?pageNum=<%=endPage + 1%>'">다음</button>
	<% } %>
	<br><button onclick="location.href='main.jsp'">메인</button>
</div>
</body>
</html>