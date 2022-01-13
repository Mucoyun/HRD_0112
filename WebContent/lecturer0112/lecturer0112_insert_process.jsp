<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실기 18 - 0112</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String idx = request.getParameter("idx");
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String field = request.getParameter("field");
		
		try{
			String sql = "insert into lecturer0112 values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.setString(2, name);
			pstmt.setString(3, major);
			pstmt.setString(4, field);
			
			pstmt.executeUpdate();
			%><script>
				alert("등록이 완료되었습니다.");
				location.href="/HRD_0112/lecturer0112/lecturer0112_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>