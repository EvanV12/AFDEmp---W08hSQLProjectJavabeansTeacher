<%@ page language="java" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<jsp:useBean id="deletecar" scope="request" class="cb.beans.DeleteCarBean" />
<jsp:setProperty name="deletecar" property="registration" param="registration" />
<html>
<head>
<meta charset="UTF-8" />
<title>Αυτοκίνητα - Νέο Αυτοκίνητο</title>
</head>
<body>
	<br />
	<br />
	<br />
	<div style="width: 400px; text-align: center; margin: auto">
	<%
		if (request.getParameter("registration") != null && request.getParameter("registration") != " ") {
			String str = deletecar.deleteCar();
	%>
	<table style="width: 400px">
		<tr>
			<td align="center"><%=str%></td>
		</tr>
		<tr>
			<td height="30"></td>
		</tr>
	</table>
	<%
		} else {
	%>
	<form name="mainform" action="deletecar.jsp" method="post">
		<table style="width: 400px" border="1">
			<tr>
				<td colspan="2" style="border: none;"><b>Διαγραφή
						αυτοκινήτου</b></td>
			</tr>
			<tr>
				<td colspan="2" style="border: none;" height="10"></td>
			</tr>
			<tr>
				<td width="200">Αριθμός κυκλοφορίας:</td>
				<td width="200" align="center"><input type="text"
					name="registration" value="" maxlength="8" /></td>
			</tr>
			<tr>
				<td width="200" style="border: none;" align="center"><input
					type="reset" value="Καθαρισμός"
					title="Κλικ για καθαρισμό της φόρμας" /></td>
				<td width="200" style="border: none;" align="center"><input
					type="submit" value="Διαγραφή" title="Κλικ για αναζήτηση" /></td>
			</tr>
		</table>
	</form>
	<%
		}
	%>
	<br />
	<table style="width: 400px">
		<tr>
			<td align="right"><input type="button"
				onclick="window.location = 'index.jsp'" value="Επιστροφή"
				title="Επιστροφή στην αρχική σελίδα" /></td>
		</tr>
	</table>
	</div>
</body>
</html>