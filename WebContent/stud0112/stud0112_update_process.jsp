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
		String studno = request.getParameter("studno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		String position = request.getParameter("position");
		String[] hobby = request.getParameterValues("hobby");
		String hobbys = "";
		for(int i=0; i<hobby.length; i++){
			if(i==0){
				hobbys = hobbys + hobby[i];
			}else{
				hobbys = hobbys + "," + hobby[i];
			}
		}
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		try{
			String sql = "update stud0112 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, dept);
			pstmt.setString(3, position);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.setString(6, hobbys);
			pstmt.setString(7, studno);
			
			pstmt.executeUpdate();
			%><script>
				alert("변경이 완료되었습니다.");
				location.href="/HRD_0112/stud0112/stud0112_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>