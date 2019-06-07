<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Progress Profile</title>
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
String srlno,date,regno,ptntNm,sex,age,locality,city,state,phNo,trtmntFor,roomNo,crntStatus,doctorsNm,department,dctrsAdvc;
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
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>P<font color="white" size="6">atient&nbsp; <font color="black" size="7">P<font color="white" size="6">rogress &nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">serial No.</td>
<td><font size="4"  color="white">Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Regd. No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Sex</td>
<td><font size="4"  color="white">Age</td>
<td><font size="4"  color="white">Locality</td>
<td><font size="4"  color="white">City</td>
<td><font size="4"  color="white">State</td>
<td nowrap="nowrap"><font size="4"  color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Treatment For</td>
<td nowrap="nowrap"><font size="4"  color="white">Room No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Current Status</td>
<td nowrap="nowrap"><font size="4"  color="white">Doctors Name</td>
<td><font size="4"  color="white">Department</td>
<td><font size="4"  color="white">Doctors Advice</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblPatientProgress");
slno=1;
while(rsData.next()){
srlno=rsData.getString("SerialNo");
date=rsData.getString("Date");
regno=rsData.getString("PatientRegNo");
ptntNm=rsData.getString("PatientName");
sex=rsData.getString("Sex");
age=rsData.getString("Age");
locality=rsData.getString("Locality");
city=rsData.getString("City");
state=rsData.getString("State");
phNo=rsData.getString("PhoneNo");
trtmntFor=rsData.getString("TreatmentFor");
roomNo=rsData.getString("RoomNo");
crntStatus=rsData.getString("CurrentStatus");
doctorsNm=rsData.getString("DoctorsName");
department=rsData.getString("Department");
dctrsAdvc=rsData.getString("DoctorsAdvice");

if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=srlno%></td>
<td><%=date%></td>
<td><%=regno%></td>
<td><%=ptntNm%></td>
<td><%=sex%></td>
<td><%=age%></td>
<td><%=locality%></td>
<td><%=city%></td>
<td><%=state%></td>
<td><%=phNo%></td>
<td><%=trtmntFor%></td>
<td><%=roomNo%></td>
<td><%=crntStatus%></td>
<td><%=doctorsNm%></td>
<td><%=department%></td>
<td><%=dctrsAdvc%></td>
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








