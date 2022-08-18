<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section class="sec1">
<h3>주문 목록(주문자별 수량 및 금액 합계)</h3>
<table border="1" class="tab2">
<tr>
	<th class="th1">no</th>
	<th class="th1">주문일자</th>
	<th class="th1">주문자 수량</th>
	<th class="th1">주문금액</th>
</tr>
<%
int no=0;
int qtytotal=0;
int pricetotal=0;
try{
	String sql="select to_char(orderDate,'YYYY-MM-DD'),sum(orderQty),sum(unitprice*orderQty) from order0818 group by to_char(orderDate,'YYYY-MM-DD')" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String orderDate=rs.getString(1);
		int orderQty=rs.getInt(2);
		int unitprice=rs.getInt(3);
		qtytotal+=orderQty;
		pricetotal+=unitprice;
		no++;
	
%>
<tr>
	<td class="td1"><%=no%></td>
	<td class="td1"><%=orderDate %></td>
	<td class="td1"><%=orderQty %></td>
	<td class="td1"><%=unitprice %></td>
</tr>

<%
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
<tr>
	<td colspan="2" class="td1"> 합 계</td>
	<td class="td1"><%=qtytotal %></td>
	<td class="td1"><%=pricetotal %></td>
</tr>

</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='addOrder.jsp'" class="bt1"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>