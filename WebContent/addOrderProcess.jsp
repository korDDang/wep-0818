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
String orderDate=request.getParameter("orderDate");
String orderName=request.getParameter("orderName");
String name=request.getParameter("name");
String productId=request.getParameter("productId");
String unitprice=request.getParameter("unitprice");
String orderQty=request.getParameter("orderQty");
qty=Integer.parseInt(orderQty);
String orderAddress=request.getParameter("orderAddress");

try{
	String sql="select unitsInstock from product0818 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();rs.next();
	int unitsInstock=rs.getInt(1);
	sql="insert into order0818 values(?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, orderDate);
	pstmt.setString(2, orderName);
	pstmt.setString(3, productId);
	pstmt.setString(4, unitprice);
	pstmt.setString(5, orderQty);
	pstmt.setString(6, orderAddress);
	pstmt.executeUpdate();
	sql="update product0818 set unitsInstock=? where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1, unitsInstock-qty);
	pstmt.setString(2, productId);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록이 완료되었습니다!");
	location.href="orderSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록 실패");
}
%>
</body>
</html>