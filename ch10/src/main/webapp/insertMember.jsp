<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<%
	MemberDao md = MemberDao.getInstance();
	for (int i = 10; i < 220; i++) {
		Member member = new Member();
		member.setId("k"+i);
		member.setPassword("1");
		member.setName("길동"+i);
		member.setAddress("마포 대흥동"+i+"번지");
		member.setTel("010-1111-"+(1000+i));
		md.insert(member);
	}
%>
입력 성공
</body>
</html>