<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
	var doc=document.form;
	if(doc.storeName.value==""){
		alert("거래처 이름을 입력하세요");
		doc.storeName.focus();
		return false;
	}else{
		doc.submit();
		
	}
}
</script>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<%@include file="DBConn.jsp" %>
<section class="sec1">
<%
int sq=0;
try{
	String sql="select sss2.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		sq=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<h2>거래처 등록 화면</h2>
<hr>
<form name="form" method="post" action="addStoreProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">거래처코드</th>
		<td>
			<input type="text" name="storeNo" value="<%=sq %>" >
		</td>
</tr>

<tr>
	<th class="th1">거래처 이름</th>
		<td>
			<input type="text" name="storeName">
		</td>
</tr>

<tr>
	<th class="th1">거래처전화번호</th>
		<td>
			<select name="storeTel">
			<option value="02">서울(02)</option>
			<option value="031">경기(031)</option>
			<option value="032">인천(032)</option>
			<option value="033">강원(033)</option>
			<option value="041">충남(041)</option>
			<option value="042">대전(042)</option>
			<option value="043">충북(043)</option>
			<option value="044">세종(044)</option>
			<option value="051">부산(051)</option>
			<option value="052">울산(052)</option>
			<option value="053">대구(053)</option>
			<option value="054">경북(054)</option>
			<option value="055">경남(055)</option>
			<option value="061">전남(061)</option>
			<option value="062">광주(062)</option>
			<option value="063">전북(063)</option>
			<option value="064">제주(064)</option>
			</select>-
			<input type="text" name="storeTel1">-
			<input type="text" name="storeTel2">
		</td>
</tr>
<tr>
	<th class="th1">거래처주소</th>
		<td>
			<input type="text" name="storeAddress">
		</td>
</tr>


<tr>
	<td colspan="2" class="td1">
		<input type="button" value="등록" onclick="check()" class="bt1">
		<input type="button" value="취소" onclick="location.href='index.jsp'" class="bt1">
	</td>
</tr>
</table>
</form>
<hr>
</section>
<%@include file="footer.jsp" %>
</body>
</html>