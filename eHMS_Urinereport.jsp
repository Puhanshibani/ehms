<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Urine Profile</title>
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
String refno,regdno,det,ptntNm,age,sex,maritalSts,phnNo,dctrsNm,dept,app,spcgrv,rctn,albmn,wall,lumen,rmk;
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
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>P<font color="white" size="6">atient&nbsp; <font color="black" size="7">U<font color="white" size="6">rine &nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Reference No.</td>
<td><font size="4" color="white">Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Regd. No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Age</td>
<td><font size="4"  color="white">Sex</td>
<td nowrap="nowrap"><font size="4"  color="white">Marital Status</td>
<td nowrap="nowrap"><font size="4"  color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Doctors Name</td>
<td nowrap="nowrap"><font size="4"  color="white"> Department</td>
<td nowrap="nowrap"><font size="4"  color="white">Appearance</td>
<td nowrap="nowrap"><font size="4"  color="white">SpecificGravity</td>
<td><font size="4"  color="white">Reaction</td>
<td nowrap="nowrap"><font size="4"  color="white">Albumin</td>
<td nowrap="nowrap"><font size="4"  color="white">WallThickness</td>
<td><font size="4"  color="white">Lumen</td>
<td><font size="4"  color="white">Remark</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblUrine");
slno=1;
while(rsData.next()){
refno=rsData.getString("RefNo");
det=rsData.getString("Date");
regdno=rsData.getString("RegdNo");
ptntNm=rsData.getString("PatientName");
age=rsData.getString("Age");
sex=rsData.getString("Sex");
maritalSts=rsData.getString("MaritalStatus");
phnNo=rsData.getString("PhNo");
dctrsNm=rsData.getString("DoctorName");
dept=rsData.getString("Department");
app=rsData.getString("Appearance");
spcgrv=rsData.getString("SpecificGravity");     
rctn=rsData.getString("Reaction");
albmn=rsData.getString("Albumin");
wall=rsData.getString("WallThickness");
lumen=rsData.getString("Lumen");
rmk=rsData.getString("Remark");
if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=refno%></td>
<td><%=det%></td>
<td><%=regdno%></td>
<td><%=ptntNm%></td>
<td><%=age%></td>
<td><%=sex%></td>
<td><%=maritalSts%></td>
<td><%=phnNo%></td>
<td><%=dctrsNm%></td>
<td><%=dept%></td>
<td><%=app%></td>
<td><%=spcgrv%></td>
<td><%=rctn%></td>   
<td><%=albmn%></td>
<td><%=wall%></td>
<td><%=lumen%></td>
<td><%=rmk%></td>

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








