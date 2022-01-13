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
		
		#ls_table tr{
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
			location.href="/HRD_0112/lecturer0112/lecturer0112_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>강사 조회</h2>
		<table id="ls_table">
			<tr>
				<th width="100">강사 번호</th>
				<th width="100">강사 명</th>
				<th width="200">전공</th>
				<th width="200">세부전공</th>
				<th width="100">관리</th>
			</tr>
			<% 
				try{
					String sql = "select * from lecturer0112 order by idx asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String idx = rs.getString(1);
						String name = rs.getString(2);
						String major = rs.getString(3);
						String field = rs.getString(4);
						%>
							<tr>
								<td><%=idx %></td>
								<td><%=name %></td>
								<td><%=major %></td>
								<td><%=field %></td>
								<td>
								<a href="/HRD_0112/lecturer0112/lecturer0112_update.jsp?send_idx=<%=idx%>">수정</a>
								<span>/</span>
								<a href="/HRD_0112/lecturer0112/lecturer0112_delete.jsp?send_idx=<%=idx%>"
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
		<button id="add" type="button" onclick="add()">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>