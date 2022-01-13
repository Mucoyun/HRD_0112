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
		
		#ci_table tr{
			height: 30px;
		}#ci_table th{
			width: 200px;
		}#ci_table td{
			width: 600px;
		}
		
		#ci_table input[type="text"]{
			height: 28px;
			width: 600px;
		}#ci_table input[type="radio"]{
			height: 10px;
			width: 50px;
		}#ci_table input[type="checkbox"]{
			height: 10px;
			width: 20px;
		}#ci_table select{
			height: 28px;
			width: 200px;
		}
		
		#ci_table #btntd{
			text-align: center;
		}#ci_table button{
			height: 30px;
			width: 100px;
		}
	</style>
	<script>
		function check() {
			if(document.c_form.id.value==""){
				alert("교과목 코드가 입력되지 않았습니다.");
				document.c_form.id.focus();
			}else if(document.c_form.name.value==""){
				alert("교과목명이 입력되지 않았습니다.");
				document.c_form.name.focus();
			}else if(document.c_form.credit.value==""){
				alert("학점이 입력되지 않았습니다.");
				document.c_form.credit.focus();
			}else if(document.c_form.lecturer.value==""){
				alert("담당강사가 선택되지 않았습니다.");
				document.c_form.lecturer.focus();
			}else if(document.c_form.week.value==""){
				alert("요일이 선택되지 않았습니다.");
				document.c_form.week.focus();
			}else if(document.c_form.start_hour.value==""){
				alert("시작시간이 입력되지 않았습니다.");
				document.c_form.start_hour.focus();
			}else if(document.c_form.end_hour.value==""){
				alert("종료시간이 입력되지 않았습니다.");
				document.c_form.end_hour.focus();
			}else{
				document.c_form.submit();
			}
		}
		function retry() {
			location.href="/HRD_0112/course0112/course0112_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>교과목 추가</h2>
		<form name="c_form"  method="post" action="course0112_insert_process.jsp">
			<table id="ci_table">
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id" maxlength="5"></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>학 점</th>
					<td><input type="text" name="credit"></td>
				</tr>
				<tr>
					<th>담 당 강 사</th>
					<td>
						<select name="lecturer">
							<option value="" selected>담당강사 선택</option>
							<option value="1">김교수</option>
							<option value="2">이교수</option>
							<option value="3">박교수</option>
							<option value="4">우교수</option>
							<option value="5">최교수</option>
							<option value="6">강교수</option>
							<option value="7">황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일 </th>
					<td>
						<input type="radio" name="week" value="1"> 월
						<input type="radio" name="week" value="2"> 화
						<input type="radio" name="week" value="3"> 수
						<input type="radio" name="week" value="4"> 목
						<input type="radio" name="week" value="5"> 금
						<input type="radio" name="week" value="6"> 토
					</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input type="text" name="start_hour" maxlength="4"></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input type="text" name="end_hour" maxlength="4"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="retry()">목록</button>
						<button type="button" onclick="check()">등록</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>