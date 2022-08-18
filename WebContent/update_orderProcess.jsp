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
String orderDate=request.getParameter("orderDate");
String orderName=request.getParameter("orderName");
String productId=request.getParameter("productId");
String unitprice=request.getParameter("unitprice");
String orderQty=request.getParameter("orderQty");
String orderAddress=request.getParameter("orderAddress");

try{

	String sql="update order0818 set productId=?,unitprice=?,orderQty=?,orderAddress=? where orderDate=? and orderName=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(5, orderDate);
	pstmt.setString(6, orderName);
	pstmt.setString(1, productId);
	pstmt.setString(2, unitprice);
	pstmt.setString(3, orderQty);
	pstmt.setString(4, orderAddress);
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정이 완료되었습니다!");
	location.href="orderSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정 실패");
}
%>
</body>
</html>