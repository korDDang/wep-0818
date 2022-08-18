<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
String storeNo=request.getParameter("storeNo");

try{
	String sql="delete from store0818 where storeNo=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, storeNo);
	pstmt.executeUpdate();
	%>
	<script>
	alert("거래처 삭제 성공");
	location.href="storeSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("삭제 실패");
}
%>
</body>
</html>