<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Profile</title>
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
String regdNo,dtofregd,ptntNm,age,sex,maritalSts,locality,city,state,phNo;
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
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>P<font color="white" size="6">atient <font color="black" size="7">&nbsp;I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td><font size="4" color="white">Sl No.</td>
<td><font size="4" color="white">Reg. No.</td>
<td><font size="4" color="white">Date Of Regd.</td>
<td><font size="4" color="white">Patient Name</td>
<td><font size="4" color="white">Age</td>
<td><font size="4" color="white">Sex</td>
<td><font size="4" color="white">MaritalStatus</td>
<td><font size="4" color="white"> Locality.</td>
<td><font size="4" color="white">City.</td>
<td><font size="4" color="white">State</td>
<td><font size="4" color="white">Phone No.</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblPatient");
slno=1;
while(rsData.next()){
regdNo=rsData.getString("RegistrationNo");
dtofregd=rsData.getString("DtOfRegd");
ptntNm=rsData.getString("PatientName");
age=rsData.getString("Age");
sex=rsData.getString("Sex");
maritalSts=rsData.getString("MaritalStatus");
locality=rsData.getString("Locality");
city=rsData.getString("City");
state=rsData.getString("State");
phNo=rsData.getString("PhoneNo");
if(slno%2==1)
out.println("<tr bgcolor=\"lightblue\">");
else
out.println("<tr bgcolor=\"white\">");
%>
<td><%=slno%></td>
<td><%=regdNo%></td>
<td><%=dtofregd%></td>
<td><%=ptntNm%></td>
<td><%=age%></td>
<td><%=sex%></td>
<td><%=maritalSts%></td>
<td><%=locality%></td>
<td><%=city%></td>
<td><%=state%></td>
<td><%=phNo%></td>
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








