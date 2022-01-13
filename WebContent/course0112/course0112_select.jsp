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
		
		#cs_table tr{
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
			location.href="/HRD_0112/course0112/course0112_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>교과목 조회</h2>
		<table id="cs_table">
			<tr>
				<th width="100">과목코드</th>
				<th width="300">과목명</th>
				<th width="100">학점</th>
				<th width="100">담당강사</th>
				<th width="100">요일</th>
				<th width="100">시작시간</th>
				<th width="100">종료시간</th>
				<th width="100">관리</th>
			</tr>
			<% 
				try{
					String sql = "select a.id,a.name,a.credit,b.name,a.week,a.start_hour,a.end_hour from course0112 a, lecturer0112 b where a.lecturer=b.idx order by a.id asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String name = rs.getString(2);
						String credit = rs.getString(3);
						String lecturer = rs.getString(4);
						String week = rs.getString(5);
						String start_hour = rs.getString(6);
						String end_hour = rs.getString(7);
						
						if(week.equals("1")){week = "월요일";}
						else if(week.equals("2")){week = "화요일";}
						else if(week.equals("3")){week = "수요일";}
						else if(week.equals("4")){week = "목요일";}
						else if(week.equals("5")){week = "금요일";}
						else if(week.equals("6")){week = "토요일";}
						else{week = "";}
						
						String s1 = start_hour.substring(0,start_hour.length()-2);
						String s2 = start_hour.substring(start_hour.length()-2);
						if(s1.length()<2){s1 = "0"+s1;}
						start_hour = s1+" : "+s2;

						String e1 = end_hour.substring(0,end_hour.length()-2);
						String e2 = end_hour.substring(end_hour.length()-2);
						if(e1.length()<2){e1 = "0"+e1;}
						end_hour = e1+" : "+e2;
						
						%>
							<tr>
								<td><%=id %></td>
								<td><%=name %></td>
								<td><%=credit %> 학점</td>
								<td><%=lecturer %></td>
								<td><%=week %></td>
								<td><%=start_hour %></td>
								<td><%=end_hour %></td>
								<td>
								<a href="/HRD_0112/course0112/course0112_update.jsp?send_id=<%=id%>">수정</a>
								<span>/</span>
								<a href="/HRD_0112/course0112/course0112_delete.jsp?send_id=<%=id%>"
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