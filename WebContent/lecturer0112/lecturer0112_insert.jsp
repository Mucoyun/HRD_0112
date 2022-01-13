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
		
		#li_table tr{
			height: 30px;
		}#li_table th{
			width: 200px;
		}#li_table td{
			width: 600px;
		}
		
		#li_table input[type="text"]{
			height: 28px;
			width: 600px;
		}#li_table input[type="radio"]{
			height: 10px;
			width: 50px;
		}#li_table input[type="checkbox"]{
			height: 10px;
			width: 20px;
		}#li_table select{
			height: 28px;
			width: 200px;
		}
		
		#li_table #btntd{
			text-align: center;
		}#li_table button{
			height: 30px;
			width: 100px;
		}
	</style>
	<script>
		function check() {
			if(document.l_form.idx.value==""){
				alert("강사번호가 입력되지 않았습니다.");
				document.l_form.idx.focus();
			}else if(document.l_form.name.value==""){
				alert("강사명이 입력되지 않았습니다.");
				document.l_form.name.focus();
			}else if(document.l_form.major.value==""){
				alert("전공이 입력되지 않았습니다.");
				document.l_form.major.focus();
			}else if(document.l_form.field.value==""){
				alert("세부전공이 입력되지 않았습니다.");
				document.l_form.field.focus();
			}else{
				document.l_form.submit();
			}
		}
		function retry() {
			location.href="/HRD_0112/lecturer0112/lecturer0112_select.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int idx = 0; 
		try{
			String sql = "select max(idx) from lecturer0112";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				idx = rs.getInt(1);
				idx++;
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
		<h2>강사 추가</h2>
		<form name="l_form"  method="post" action="lecturer0112_insert_process.jsp">
			<table id="li_table">
				<tr>
					<th>강사 번호</th>
					<td><input type="text" name="idx" value="<%=idx %>" readonly></td>
				</tr>
				<tr>
					<th>강 사 명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전 공</th>
					<td><input type="text" name="major"></td>
				</tr>
				<tr>
					<th>세 부 전 공</th>
					<td><input type="text" name="field"></td>
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