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
		String send_studno = request.getParameter("send_studno");
		
		try{
			String sql = "delete from stud0112 where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_studno);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다.");
				location.href="/HRD_0112/stud0112/stud0112_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>