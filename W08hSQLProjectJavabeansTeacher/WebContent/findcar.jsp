
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,cb.beans.Car"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="findcar" scope="request" class="cb.beans.FindCarBean" />
<jsp:setProperty name="findcar" property="registration" param="registration" />
<jsp:setProperty name="findcar" property="factory" param="factory" />
<jsp:setProperty name="findcar" property="model" param="model" />
<jsp:setProperty name="findcar" property="cc" param="cc" />
<jsp:setProperty name="findcar" property="regdate" param="regdate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Αυτοκίνητα - Εύρεση</title>
</head>
<body>
	<br />
	<br />
	<br />
	<div style="width: 400px; margin: auto">
		<form name="mainform" action="findcar.jsp" method="post">
			<table style="width: 400px" border="1">
				<tr>
					<td colspan="2" style="border: none;"><b>Εύρεση
							αυτοκινήτου</b></td>
				</tr>
				<tr>
					<td colspan="2" style="border: none;" height="10"></td>
				</tr>
				<tr>
					<td width="200">Αριθμός κυκλοφορίας:</td>
					<td width="200" align="center"><input type="text"
						name="registration" value="<%=findcar.getRegistration()%>"
						maxlength="8" /></td>
				</tr>
				<tr>
					<td width="200">Εργοστάσιο κατασκευής:</td>
					<td width="200" align="center"><input type="text"
						name="factory" value="<%=findcar.getFactory()%>" /></td>
				</tr>
				<tr>
					<td width="200">Μοντέλο:</td>
					<td width="200" align="center"><input type="text" name="model"
						value="<%=findcar.getModel()%>" /></td>
				</tr>
				<tr>
					<td width="200">Κυβικά:</td>
					<td width="200" align="center"><input type="text" name="cc"
						value="<%=findcar.getCc()%>" /></td>
				</tr>
				<tr>
					<td width="200">Έτος κατασκευής:</td>
					<td width="200" align="center"><input type="text"
						name="regdate" value="<%=findcar.getRegdate()%>" /></td>
				</tr>
				<tr>
					<td colspan="2" height="10" style="border: none;"></td>
				</tr>
				<tr>
					<td width="200" style="border: none;" align="center"><input
						type="reset" value="Καθαρισμός"
						title="Κλικ για καθαρισμό της φόρμας" /></td>
					<td width="200" style="border: none;" align="center"><input
						type="submit" value="Εύρεση" title="Κλικ για αναζήτηση" /></td>
				</tr>
				<tr>
					<td colspan="2" height="15" style="border: none;"></td>
				</tr>
			</table>
		</form>
	</div>
	<br />
	<br />
	<%
		if (request.getParameter("registration") != null || request.getParameter("factory") != null
				|| request.getParameter("model") != null || request.getParameter("cc") != null
				|| request.getParameter("regdate") != null) {
			ArrayList<Car> al = findcar.findCar();
			if (al != null && al.size() > 0) {
	%>
	<div style="width: 800px; margin: auto;">
		<table style="width: 800px" border="1">
			<tr>
				<td><b>Αρ. Κυκλοφορίας</b></td>
				<td><b>Εργ. Κατασκευής</b></td>
				<td><b>Μοντέλο</b></td>
				<td><b>Κυβικά</b></td>
				<td><b>Χρώμα</b></td>
				<td><b>Έτος Κατασκευής</b></td>
			</tr>
			<%
				for (int i = 0; i < al.size(); i++) {
			%>
			<tr>
				<td><%=al.get(i).getRegistration()%></td>
				<td><%=al.get(i).getFactory()%></td>
				<td><%=al.get(i).getModel()%></td>
				<td><%=al.get(i).getCc()%></td>
				<td><%=al.get(i).getColour()%></td>
				<td><%=al.get(i).getRegdate()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			} else {
		%>
		<div style="width: 400px; text-align: center; margin: auto">
			<p>Δε βρέθηκαν εγγραφές για τα παραπάνω κριτήρια</p>
		</div>
		<%
			}
			}
		%>
		<div style="width: 400px; margin: auto; text-align: right">
			<br /> <input type="button" onclick="window.location = 'index.jsp'"
				value="Επιστροφή" title="Επιστροφή στην αρχική σελίδα" />
		</div>
	</div>
</body>
</html>