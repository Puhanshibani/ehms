<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Discharge Profile</title>
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
String refno,date,PtntId,ptntNm,sex,age,locality,city,state,phNo,treatment,roomNo,dept,dctrNm,roomchrg,medicinechrg,otherchrg,totalchrg;
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
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>P<font color="white" size="6">atient&nbsp; <font color="black" size="7">D<font color="white" size="6">ischarge &nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Ref. No.</td>
<td><font size="4"  color="white">Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient ID</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Sex</td>
<td><font size="4"  color="white">Age</td>
<td><font size="4"  color="white">Locality</td>
<td><font size="4"  color="white">City</td>
<td><font size="4"  color="white">State</td>
<td nowrap="nowrap"><font size="4"  color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Treatment</td>
<td nowrap="nowrap"><font size="4"  color="white">Room No.</td>
<td><font size="4"  color="white">Department</td>
<td nowrap="nowrap"><font size="4"  color="white">Doctors Name</td>
<td nowrap="nowrap"><font size="4"  color="white">RoomCharge</td>
<td><font size="4"  color="white">MedicineChargee</td>
<td><font size="4"  color="white">OtherCharge</td>
<td><font size="4"  color="white">TotalCharge</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblPatientDischarge");
slno=1;
while(rsData.next()){
refno=rsData.getString("RefNo");
date=rsData.getString("Date");
PtntId=rsData.getString("PatientId");
ptntNm=rsData.getString("PtientName");
sex=rsData.getString("Sex");
age=rsData.getString("Age");
locality=rsData.getString("Locality");
city=rsData.getString("City");
state=rsData.getString("State");
phNo=rsData.getString("PhoneNo");
treatment=rsData.getString("Treatment");
roomNo=rsData.getString("RoomNo");
dept=rsData.getString("Department");
dctrNm=rsData.getString("DoctorsName");
roomchrg=rsData.getString("RoomCharge");
medicinechrg=rsData.getString("MedicineCharge");
otherchrg=rsData.getString("OtherCharge");
totalchrg=rsData.getString("TotalCharge");

if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=refno%></td>
<td><%=date%></td>
<td><%=PtntId%></td>
<td><%=ptntNm%></td>
<td><%=sex%></td>
<td><%=age%></td>
<td><%=locality%></td>
<td><%=city%></td>
<td><%=state%></td>
<td><%=phNo%></td>
<td><%=treatment%></td>
<td><%=roomNo%></td>
<td><%=dept%></td>
<td><%=dctrNm%></td>
<td><%=roomchrg%></td>
<td><%=medicinechrg%></td>
<td><%=otherchrg%></td>
<td><%=totalchrg%></td>
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








