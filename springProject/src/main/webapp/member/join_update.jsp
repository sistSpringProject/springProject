<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">
function postfind()
{
	new daum.Postcode({
		oncomplete:function(data){
			$('#post').val(data.zonecode);
			$('#addr1').val(data.address)
		}
	}).open();
}
</script>

</head>

<body>

	<div class="bgded overlay">
		<div id="breadcrumb" class="hoc clear"> 
		</div>
	</div>
		
	<div style="height:112px"></div>
	
	<div class="wrapper row3">
		<main class="hoc container clear"> 
			<h1 class="text-center">회원 수정</h1>
			<div style="height:50px"></div>
			<form method=post action="join_update_ok.do" id="joinFrm">
			<table class="table">
				<tr>
					<th align="right" width=20%>아이디</th>
					<td width=80% class="inline">
						<input type=text name=id size=15 class="input-sm" readonly value="${vo.id}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>비밀번호</th>
					<td width=80% class="inline">
						<input type=password name=pwd size=15 class="input-sm">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>이름</th>
					<td width=80% class="inline">
						<input type=text name=name size=15 class="input-sm" value="${vo.name}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>성별</th>
					<td width=80% class="inline">
						<input type="radio" name=sex value="남자" ${vo.sex=='남자'?"checked":""}>남자
						<input type="radio" name=sex value="여자" ${vo.sex=='여자'?"checked":""}>여자
					</td> 
				</tr>
				<tr>
					<th align="right" width=20%>생년월일</th>
					<td width=80% class="inline">
						<input type="date" size=20 name=birthday value="${vo.birthday}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>이메일</th>
					<td width=80% class="inline">
						<input type=text name=email size=50 class="input-sm" value="${vo.email}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>우편번호</th>
					<td width=80% class="inline">
						<input type="text" name=post size=10 readonly id=post class="input-sm" value="${vo.post}">
						<input type=button class="btn" value="우편번호검색" onclick="postfind()">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>주소</th>
					<td width=80% class="inline">
						<input type=text name=addr1 size=50 class="input-sm" readonly id=addr1 value="${vo.addr1}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>상세주소</th>
					<td width=80% class="inline">
						<input type=text name=addr2 size=50 class="input-sm" value="${vo.addr2}">
					</td>
				</tr>
				<tr>
					<th align="right" width=20%>전화번호</th>
					<td width=80% class="inline">
						<input type=text name=tel_v id=tel_v size=5 class="input-sm" disabled value="${vo.tel1}">
						<select name="tel1" id="tel1">
							<option value="" selected>선택하세요</option>
							<option value="010">010</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="direct">직접입력</option>
						</select>
						- <input type=text name=tel2 size=15 class="input-sm" id=tel2 value="${vo.tel2}">
						- <input type=text name=tel3 size=15 class="input-sm" id=tel3 value="${vo.tel3}">
					</td>
				</tr>
				<!-- <tr>
					<th align="right" width=20%>소개</th>
					<td width=80% class="inline">
						<textarea rows="10" cols="55" name=content>${vo.content }</textarea>
					</td>
				</tr>  -->
				<tr>
					<td colspan="2" align="center">
						<input type=submit class="btn" value="수정" id="joinBtn">
						<input type=button class="btn" value="취소" 
						 onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
			</form>
		</main>
	</div>
	
</body>
</html>