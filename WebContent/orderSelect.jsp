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
<h3>주문 목록</h3>
<%
int cnt=0;
try{
	String sql="select count(*) from order0818";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>개의 주문정보가 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th class="th1">no</th>
	<th class="th1">주문일자</th>
	<th class="th1">주문자 성명</th>
	<th class="th1">상품번호</th>
	<th class="th1">상품명</th>
	<th class="th1">단가</th>
	<th class="th1">주문수량</th>
	<th class="th1">주문자주소</th>
	<th class="th1">구분</th>
</tr>
<%
int no=0;
try{
	String sql="select to_char(o.orderDate,'YYYY-MM-DD'),o.orderName,o.productId,p.name,o.unitprice,o.orderQty,o.orderAddress from order0818 o,product0818 p where o.productId=p.productId order by orderQty desc,orderAddress asc" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String orderDate=rs.getString(1);
		String orderName=rs.getString(2);
		String productId=rs.getString(3);
		String name=rs.getString(4);
		String unitprice=rs.getString(5);
		String orderQty=rs.getString(6);
		String orderAddress=rs.getString(7);
		no++;
	
%>
<tr>
	<td class="td1"><%=no%></td>
	<td class="td1"><%=orderDate %></td>
	<td class="td1"><%=orderName %></td>
	<td class="td1"><%=productId %></td>
	<td class="td1"><%=name %></td>
	<td class="td1"><%=unitprice %></td>
	<td class="td1"><%=orderQty %></td>
	<td class="td1"><%=orderAddress %></td>
	<td class="td1">
	<a href="update_order.jsp?orderDate=<%=orderDate %>&&orderName=<%=orderName%>&&productId=<%=productId%>">수정</a>/
	<a href="orderDelete.jsp?orderDate=<%=orderDate %>&&orderName=<%=orderName%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
	</td>
</tr>
<%
	}
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<br>
<div class="td1"><input type="button" value="작성" onclick="location.href='addOrder.jsp'" class="bt1"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>