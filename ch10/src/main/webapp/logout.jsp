<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%  // session정보 삭제
	session.invalidate();
 	// 1800 = 30*60 30분 30분 지나면 session 삭제
	// session.setMaxInactiveInterval(1800);
%>
<script type="text/javascript">
	alert("로그 아웃 되었습니다");
	location.href="loginForm.jsp";
</script>
</body>
</html>