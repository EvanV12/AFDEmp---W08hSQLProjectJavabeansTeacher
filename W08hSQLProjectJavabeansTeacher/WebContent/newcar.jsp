<%@ page language="java" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="newcar" scope="request" class="cb.beans.NewCarBean" />
<jsp:setProperty name="newcar" property="registration" param="registration" />
<jsp:setProperty name="newcar" property="factory" param="factory" />
<jsp:setProperty name="newcar" property="model" param="model" />
<jsp:setProperty name="newcar" property="colour" param="colour" />
<jsp:setProperty name="newcar" property="cc" param="cc" />
<jsp:setProperty name="newcar" property="regdate" param="regdate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Αυτοκίνητα - Νέο Αυτοκίνητο</title>
</head>
<body>
	<br />
	<br />
	<br />

	<%
		request.setCharacterEncoding("utf-8");
		if (request.getParameter("registration") != null && request.getParameter("factory") != null
				&& request.getParameter("model") != null && request.getParameter("colour") != null
				&& request.getParameter("cc") != null && request.getParameter("regdate") != null) {
			String str = newcar.insert();
			if (!str.equals("")) {
	%>
	<div style="width: 400px; margin: auto">
		<%=str%>
	</div>
	<%
		}
		} else {
	%>
	<div style="width: 400px; margin: auto">
		<form name="mainform" action="newcar.jsp" method="post">
			<table style="width: 400px" border="1">
				<tr>
					<td colspan="2" style="border: none;"><b>Καταχώρηση νέου
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
					<td width="200">Εργοστάσιο κατασκευής:</td>
					<td width="200" align="center"><input type="text"
						name="factory" value="" /></td>
				</tr>
				<tr>
					<td width="200">Μοντέλο:</td>
					<td width="200" align="center"><input type="text" name="model"
						value="" /></td>
				</tr>
				<tr>
					<td width="200">Χρώμα:</td>
					<td width="200" align="center"><input type="text"
						name="colour" value="" /></td>
				</tr>
				<tr>
					<td width="200">Κυβικά:</td>
					<td width="200" align="center"><input type="text" name="cc"
						value="" /></td>
				</tr>
				<tr>
					<td width="200">Έτος κατασκευής:</td>
					<td width="200" align="center"><input type="text"
						name="regdate" value="" /></td>
				</tr>
				<tr>
					<td colspan="2" height="10" style="border: none;"></td>
				</tr>
				<tr>
					<td width="200" style="border: none;" align="center"><input
						type="reset" value="Καθαρισμός"
						title="Κλικ για καθαρισμό της φόρμας" /></td>
					<td width="200" style="border: none;" align="center"><input
						type="submit" value="Καταχώρηση"
						title="Κλικ για καταχώρηση στη βάση" /></td>
				</tr>
				<tr>
					<td colspan="2" height="15" style="border: none;"></td>
				</tr>
			</table>
		</form>
		<%
			}
		%>
		<br />
		<div style="width: 400px; margin: auto; text-align: right">
			<input type="button" onclick="window.location = 'index.jsp'"
				value="Επιστροφή" title="Επιστροφή στην αρχική σελίδα" />
		</div>
	</div>
</body>
</html>