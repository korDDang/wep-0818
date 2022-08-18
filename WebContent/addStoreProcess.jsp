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
int qty=0;
String storeNo=request.getParameter("storeNo");
String storeName=request.getParameter("storeName");
String storeTel=request.getParameter("storeTel")+"-"+request.getParameter("storeTel1")+"-"+request.getParameter("storeTel2");
String storeAddress=request.getParameter("storeAddress");


try{
	String sql="insert into store0818 values(?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, storeNo);
	pstmt.setString(2, storeName);
	pstmt.setString(3, storeTel);
	pstmt.setString(4, storeAddress);
	
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="storeSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>