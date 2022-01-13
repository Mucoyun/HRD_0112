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
			history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String credit = request.getParameter("credit");
		String lecturer = request.getParameter("lecturer");
		String week = request.getParameter("week");
		String start_hour = request.getParameter("start_hour");
		String end_hour = request.getParameter("end_hour");
		
		try{
			String sql = "select * from course0112 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				name = rs.getString(2);
				credit = rs.getString(3);
				lecturer = rs.getString(4);
				week = rs.getString(5);
				start_hour = rs.getString(6);
				end_hour = rs.getString(7);
			}else{
				%><script>
					alert("아이디가 없습니다.");
					history.back(-1);
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>교과목 변경</h2>
		<form name="c_form"  method="post" action="course0112_update_process.jsp">
			<table id="ci_table">
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id" value="<%=id %>" readonly></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input type="text" name="name" value="<%=name %>"></td>
				</tr>
				<tr>
					<th>학 점</th>
					<td><input type="text" name="credit" value="<%=credit %>"></td>
				</tr>
				<tr>
					<th>담 당 강 사</th>
					<td>
						<select name="lecturer">
							<option value=""  <%if(lecturer.equals("")){%> selected <%} %>>담당강사 선택</option>
							<option value="1" <%if(lecturer.equals("1")){%> selected <%} %>>김교수</option>
							<option value="2" <%if(lecturer.equals("2")){%> selected <%} %>>이교수</option>
							<option value="3" <%if(lecturer.equals("3")){%> selected <%} %>>박교수</option>
							<option value="4" <%if(lecturer.equals("4")){%> selected <%} %>>우교수</option>
							<option value="5" <%if(lecturer.equals("5")){%> selected <%} %>>최교수</option>
							<option value="6" <%if(lecturer.equals("6")){%> selected <%} %>>강교수</option>
							<option value="7" <%if(lecturer.equals("7")){%> selected <%} %>>황교수</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일 </th>
					<td>
						<input type="radio" name="week" value="1" <%if(week.equals("1")){%> checked <%} %>> 월
						<input type="radio" name="week" value="2" <%if(week.equals("2")){%> checked <%} %>> 화
						<input type="radio" name="week" value="3" <%if(week.equals("3")){%> checked <%} %>> 수
						<input type="radio" name="week" value="4" <%if(week.equals("4")){%> checked <%} %>> 목
						<input type="radio" name="week" value="5" <%if(week.equals("5")){%> checked <%} %>> 금
						<input type="radio" name="week" value="6" <%if(week.equals("6")){%> checked <%} %>> 토
					</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input type="text" name="start_hour" maxlength="4" value="<%=start_hour %>"></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input type="text" name="end_hour" maxlength="4" value="<%=end_hour %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="check()">변경</button>
						<button type="button" onclick="retry()">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>