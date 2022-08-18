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
<h3>주문 목록(주문일자/상품별)</h3>
<table border="1" class="tab2">
<tr>
	<th class="th1">no</th>
	<th class="th1">상품번호</th>
	<th class="th1">상품명</th>
	<th class="th1">주문일자</th>
	<th class="th1">주문수량</th>
	<th class="th1">주문금액</th>
</tr>
<%
int no=0;
int qtytotal=0;
int pricetotal=0;
try{
	String sql="select p.productId,p.name,to_char(o.orderDate,'YYYY-MM-DD'),sum(o.orderQty),sum(o.unitprice*o.orderQty) from order0818 o,product0818 p where o.productId=p.productId  group by to_char(o.orderDate,'YYYY-MM-DD'),p.productId,p.name" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productId=rs.getString(1);
		String name=rs.getString(2);
		String orderDate=rs.getString(3);
		int orderQty=rs.getInt(4);
		int unitprice=rs.getInt(5);
		qtytotal+=orderQty;
		pricetotal+=unitprice;
		no++;
	
%>
<tr>
	<td class="td1"><%=no%></td>
	<td class="td1"><%=productId %></td>
	<td class="td1"><%=name %></td>
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
	<td colspan="4" class="td1"> 합 계</td>
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