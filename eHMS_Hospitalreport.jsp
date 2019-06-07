<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Hospital Profile</title>
<script language="javascript">
function goHome(){
window.close();
}
</script>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String regno,hosNm,contPerson,locality,ct,st,pn,faxNo,emailId,webSite;
int slno;
public void doConnect(){
      try{
	      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  }
	  catch(ClassNotFoundException cnfe){
	     System.out.println("Unable to connect");
	  }
       try{
	      conn=DriverManager.getConnection("jdbc:odbc:localserver","sa","root");
	  }
	  catch(SQLException se){
	      System.out.println("Unable to connect"+se);
	  }
}
%>

<table width="100%">
<tr>
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>H<font color="white" size="6">ospital <font color="black" size="7">&nbsp;I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td><font size="4" color="white">Sl No.</td>
<td><font size="4" color="white">Reg. No.</td>
<td><font size="4" color="white">Hospital's Name</td>
<td><font size="4" color="white">Contact Person</td>
<td><font size="4" color="white">Locality</td>
<td><font size="4" color="white">City</td>
<td><font size="4" color="white">State</td>
<td><font size="4" color="white">Phone No.</td>
<td><font size="4" color="white">Fax No.</td>
<td><font size="4" color="white">Email ID</td>
<td><font size="4" color="white">Website</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblHospital");
slno=1;
while(rsData.next()){
regno=rsData.getString("RegistrationNo");
hosNm=rsData.getString("HospitalName");
contPerson=rsData.getString("ConPerson");
locality=rsData.getString("Locality");
ct=rsData.getString("City");
st=rsData.getString("State");
pn=rsData.getString("PhNo");
faxNo=rsData.getString("FaxNo");
emailId=rsData.getString("Email");
webSite=rsData.getString("WebSite");
if(slno%2==1)
out.println("<tr bgcolor=\"lightblue\">");
else
out.println("<tr bgcolor=\"white\">");
%>
<td><%=slno%></td>
<td><%=regno%></td>
<td><%=hosNm%></td>
<td><%=contPerson%></td>
<td><%=locality%></td>
<td><%=ct%></td>
<td><%=st%></td>
<td><%=pn%></td>
<td><%=faxNo%></td>
<td><%=emailId%></td>
<td><%=webSite%></td>
</tr>
<%
slno=slno+1;
}
}
catch(SQLException se){
out.println("Error");
}
%>
</table>
</body>
</html>








