<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Admission Profile</title>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String det,refNo,date,regdno,ptntNm,age,sex,maritalSts,locality,city,phNo,state,trtmnt,hospital,prvDoctor,remark,trtmntFor,dctrNm,department,roomNo;
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
	<td align="center"><font color="black" size="7"><U>P<font color="white" size="6">atient&nbsp; <font color="black" size="7">A<font color="white" size="6">dmission &nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Ref. No.</td>
<td><font size="4"  color="white">Date</td>
<td nowrap><font size="4"  color="white">Regd. No.</td>
<td nowrap><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Age</td>
<td><font size="4"  color="white">Sex</td>
<td><font size="4"  color="white">MaritalStatus</td>
<td><font size="4"  color="white">Locality</td>
<td><font size="4"  color="white">City</td>
<td nowrap><font size="4"  color="white">Phone No.</td>
<td><font size="4"  color="white">State</td>
<td><font size="4"  color="white">Treatment</td>
<td><font size="4"  color="white">Hospital</td>
<td nowrap><font size="4"  color="white">Prev. Doctors Name</td>
<td><font size="4"  color="white">Remark</td>
<td nowrap><font size="4"  color="white">Treatment For</td>
<td nowrap><font size="4"  color="white">Doctors Name</td>
<td><font size="4"  color="white">Department</td>
<td nowrap><font size="4"  color="white">Room No.</td>

</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
det=request.getParameter("cmbdt");
rsData=stmtSelect.executeQuery("select * from eHMS_tblPatientAdmin where Date='"+det+"'");
slno=1;
while(rsData.next()){
refNo=rsData.getString("RefNo");
date=rsData.getString("Date");
regdno=rsData.getString("RegdNo");
ptntNm=rsData.getString("PatientName");
age=rsData.getString("Age");
sex=rsData.getString("Sex");
maritalSts=rsData.getString("MaritalStatus");
locality=rsData.getString("Locality");
city=rsData.getString("City");
phNo=rsData.getString("PhoneNo");
state=rsData.getString("State");
trtmnt=rsData.getString("Treatment");
hospital=rsData.getString("Hospital");
prvDoctor=rsData.getString("PrevDoctorsName");
remark=rsData.getString("Remark");
trtmntFor=rsData.getString("TreatmentFor");
dctrNm=rsData.getString("DoctorsName");
department=rsData.getString("Department");
roomNo=rsData.getString("RoomNo");
if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=refNo%></td>
<td><%=date%></td>
<td><%=regdno%></td>
<td><%=ptntNm%></td>
<td><%=age%></td>
<td><%=sex%></td>
<td><%=maritalSts%></td>
<td><%=locality%></td>
<td><%=city%></td>
<td><%=phNo%></td>
<td><%=state%></td>
<td><%=trtmnt%></td>
<td><%=hospital%></td>
<td><%=prvDoctor%></td>
<td><%=remark%></td>
<td><%=trtmntFor%></td>
<td><%=dctrNm%></td>
<td><%=department%></td>
<td><%=roomNo%></td>
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








