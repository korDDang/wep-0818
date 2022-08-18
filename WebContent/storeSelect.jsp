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
<h3>거래처 목록</h3>
<%
int cnt=0;
try{
	String sql="select count(*) from store0818";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div class="div1">총 <%=cnt %>개의 거래처가 있습니다.</div>
<hr>
<table border="1" class="tab2">
<tr>
	<th>no</th>
	<th>거래처 코드</th>
	<th>거래처 이름</th>
	<th>거래처 전화번호</th>
	<th>거래처주소</th>
	<th>구분</th>
</tr>
<%
int no=0;
try{
	String sql="select * from store0818";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String storeNo=rs.getString(1);
		String storeName=rs.getString(2);
		String storeTel=rs.getString(3);
		String storeAddress=rs.getString(4);
		no++;
%>
<tr>
	<td class="td2"><%=no %></td>
	<td class="td3"><a href="update_store.jsp?storeNo=<%=storeNo%>"><%=storeNo %></a></td>
	<td class="td2"><%=storeName %></td>
	<td class="td2"><%=storeTel %></td>
	<td class="td2"><%=storeAddress %></td>
	<td class="td2">
	<a href="storeDelete.jsp?storeNo=<%=storeNo%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
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
<div class="td1"><input type="button" value="작성" onclick="location.href='addStore.jsp'" class="bt1"></div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>