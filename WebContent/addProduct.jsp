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
	if(doc.productId.value==""){
		alert("상품코드를 입력하세요");
		doc.productId.focus();
		return false;
	}if(doc.name.value==""){
			alert("상품명 입력하세요");
			doc.name.focus();
			return false;
	}if(doc.name.value.length<4||doc.name.value.length>50){
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		doc.name.focus();
		return false;
	}if(doc.unitprice.value==""){
		alert("가격 입력하세요");
		doc.unitprice.focus();
		return false;
	}if(doc.unitprice.value==0||isNaN(doc.unitprice.value)){
		alert("[가격]\n 숫자만 입력하세요");
		doc.unitprice.focus();
		return false;
	}if(doc.unitprice.value<0){
		alert("[가격]\n 음수를 입력할 수 없습니다");
		doc.unitprice.focus();
		return false;
	}if(doc.unitsInstock.value==0||isNaN(doc.unitsInstock.value)){
		alert("[재고]\n 숫자만 입력하세요");
		doc.unitsInstock.focus();	
		
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
<h2>상품 등록 화면</h2>
<hr>
<form name="form" method="post" action="addProductProcess.jsp">
<table border="1" class="tab1">
<tr>
	<th class="th1">상품코드</th>
		<td>
			<input type="text" name="productId" >
		</td>
</tr>

<tr>
	<th class="th1">상품명</th>
		<td>
			<input type="text" name="name">
		</td>
</tr>

<tr>
	<th class="th1">가 격</th>
		<td>
			<input type="text" name="unitprice">
		</td>
</tr>

<tr>
	<th class="th1">상세정보</th>
		<td>
			<input type="text" name="description">
		</td>
</tr>

<tr>
	<th class="th1">제조사</th>
		<td>
			<input type="text" name="manufacturer">
		</td>
</tr>

<tr>
	<th class="th1">분류</th>
		<td>
			<select name="category">
				<option value="10">it 제품</option>
				<option value="20">주방제품</option>
				<option value="30">전자제품</option>
				<option value="40">일반 잡화</option>
			</select>
		</td>
</tr>

<tr>
	<th class="th1">제고수</th>
		<td>
			<input type="text" name="unitsInstock">
		</td>
</tr>

<tr>
	<th class="th1">상 태</th>
		<td>
			<input type="radio" name="condition" value="신규제품" checked>신규 제품
			<input type="radio" name="condition" value="중고제품">중고 제품
			<input type="radio" name="condition" value="재생제품">재생 제품
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