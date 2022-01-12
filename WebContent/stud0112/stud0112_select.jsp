<%@page import="java.sql.SQLException"%>
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
			text-align: center;
		}tr,th,td{
			border: 1px solid black;
		}
		
		#ss_table tr{
			height: 30px;
		}
		#add{
			display: block;
			margin: 0 auto;
			background: black;
			color: white;
			height: 30px;
			width: 100px;
			margin-top: 20px;
		}
		a{
			text-decoration: none;
			color: blue;
			font-weight: bold;
		}
		
	</style>
	<script>
		function add() {
			location.href="/HRD_0112/stud0112/stud0112_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>학사 정보 목록</h2>
		<table id="ss_table">
			<tr>
				<th width="100">학번</th>
				<th width="100">성명</th>
				<th width="50">학과</th>
				<th width="50">학년</th>
				<th width="200">주소</th>
				<th width="200">연락처</th>
				<th width="300">취미</th>
				<th width="100">관리</th>
			</tr>
			<% 
				try{
					String sql = "select * from stud0112 order by studno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String studno = rs.getString(1);
						String name = rs.getString(2);
						String dept = rs.getString(3);
						String position = rs.getString(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						String hobby = rs.getString(7);
						%>
							<tr>
								<td><%=studno %></td>
								<td><%=name %></td>
								<td><%=dept %></td>
								<td><%=position %></td>
								<td><%=address %></td>
								<td><%=phone %></td>
								<td><%=hobby %></td>
								<td>
								<a href="/HRD_0112/stud0112/stud0112_update.jsp?send_studno=<%=studno%>">수정</a>
								<span>/</span>
								<a href="/HRD_0112/stud0112/stud0112_delete.jsp?send_studno=<%=studno%>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){
									return false;
								}"
								>삭제</a>
								</td>
							</tr>
						<%
						
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="add" type="button" onclick="add()">학사정보 추가</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>