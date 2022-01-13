<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실기 18 - 0112</title>
	<style>
		table{
			border: 2px solid black;
			margin: 0 auto;
		}tr,th,td{
			border: 1px solid black;
		}
		
		#si_table tr{
			height: 30px;
		}#si_table th{
			width: 200px;
		}#si_table td{
			width: 600px;
		}
		
		#si_table input[type="text"]{
			height: 28px;
			width: 600px;
		}#si_table input[type="radio"]{
			height: 10px;
			width: 50px;
		}#si_table input[type="checkbox"]{
			height: 10px;
			width: 20px;
		}#si_table select{
			height: 28px;
			width: 200px;
		}
		
		#si_table #btntd{
			text-align: center;
		}#si_table button{
			height: 30px;
			width: 100px;
		}
	</style>
	<script>
		function check() {
			if(document.s_form.studno.value==""){
				alert("학번이 입력되지 않았습니다.");
				document.s_form.studno.focus();
			}else{
				document.s_form.submit();
			}
		}
		function retry() {
			location.href="/HRD_0112/index.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>학사 정보 추가</h2>
		<form name="s_form"  method="post" action="stud0112_insert_process.jsp">
			<table id="si_table">
				<tr>
					<th>학번</th>
					<td><input type="text" name="studno"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td>
						<select name="dept">
							<option value="1" selected>컴퓨터공학과</option>
							<option value="2">기계공학과</option>
							<option value="3">전자과</option>
							<option value="4">영문학과</option>
							<option value="5">일어과</option>
							<option value="6">경영학과</option>
							<option value="7">무역학과</option>
							<option value="8">교육학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>학년</th>
					<td>
						<input type="radio" name="position" value="1" checked> 1학년
						<input type="radio" name="position" value="2"> 2학년
						<input type="radio" name="position" value="3"> 3학년
						<input type="radio" name="position" value="4"> 4학년
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td>
						<input type="checkbox" name="hobby" value="프로그램">프로그램
						<input type="checkbox" name="hobby" value="독서">독서
						<input type="checkbox" name="hobby" value="등산">등산
						<input type="checkbox" name="hobby" value="여행">여행
						<input type="checkbox" name="hobby" value="낚시">낚시
						<input type="checkbox" name="hobby" value="영화보기">영화보기
						<input type="checkbox" name="hobby" value="잠자기">잠자기
						<input type="checkbox" name="hobby" value="멍때리기">멍때리기
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="check()">등록</button>
						<button type="button" onclick="retry()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>