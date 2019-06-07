<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Patient Blood Profile</title>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String refno,date,regdno,ptntname,age,sex,mrtlsts,phno,docnm,dept,wbc,rbc,hb,hct,mcv,pltlt,neutrophl,lymphocyt,monocyt,eosinophil,basophl,remark;
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
	<td align="center"><font color="black" size="7"><U>P<font color="white" size="6">atient&nbsp; <font color="black" size="7">B<font color="white" size="6">lood&nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Ref. No.</td>
<td><font size="4" color="white">Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Regd. No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Age</td>
<td><font size="4"  color="white">Sex</td>
<td nowrap="nowrap"><font size="4"  color="white">Marital Status</td>
<td nowrap="nowrap"><font size="4"  color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Doctors Name</td>
<td nowrap="nowrap"><font size="4"  color="white"> Department</td>
<td nowrap="nowrap"><font size="4"  color="white">WBC</td>
<td nowrap="nowrap"><font size="4"  color="white">RBC</td>
<td><font size="4"  color="white">HB</td>
<td nowrap="nowrap"><font size="4"  color="white">HCT</td>
<td nowrap="nowrap"><font size="4"  color="white">MCV</td>
<td><font size="4"  color="white">Platelate</td>
<td><font size="4"  color="white">Neutrophil</td>
<td><font size="4"  color="white">Lymphocyte</td>
<td><font size="4"  color="white">Monocyte</td>
<td><font size="4"  color="white">Eosinophil</td>
<td><font size="4"  color="white">Basophil</td>
<td><font size="4"  color="white">Remark</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
regdno=request.getParameter("cmbregdno");
rsData=stmtSelect.executeQuery("select * from eHMS_tblBlood where RegdNo='"+regdno+"'");
slno=1;
while(rsData.next()){
refno=rsData.getString("RefNo");
date=rsData.getString("Date");
regdno=rsData.getString("RegdNo");
ptntname=rsData.getString("PatientName");
age=rsData.getString("Age");
sex=rsData.getString("Sex");
mrtlsts=rsData.getString("MaritalStatus");
phno=rsData.getString("PhNo");
docnm=rsData.getString("DocNm");
dept=rsData.getString("Department");
wbc=rsData.getString("WBC");
rbc=rsData.getString("RBC");     
hb=rsData.getString("HB");
hct=rsData.getString("HCT");
mcv=rsData.getString("MCV");
pltlt=rsData.getString("Platelate");
neutrophl=rsData.getString("Neutrophil");
lymphocyt=rsData.getString("Lymphocyte");
monocyt=rsData.getString("Monocyte");
eosinophil=rsData.getString("Eosinophil");
basophl=rsData.getString("Basophil");
remark=rsData.getString("Remark");

if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=refno%></td>
<td><%=date%></td>
<td><%=regdno%></td>
<td><%=ptntname%></td>
<td><%=age%></td>
<td><%=sex%></td>
<td><%=mrtlsts%></td>
<td><%=phno%></td>
<td><%=docnm%></td>
<td><%=dept%></td>
<td><%=wbc%></td>
<td><%=rbc%></td>
<td><%=hb%></td>   
<td><%=hct%></td>
<td><%=mcv%></td>
<td><%=pltlt%></td>
<td><%=neutrophl%></td>
<td><%=lymphocyt%></td>
<td><%=monocyt%></td>
<td><%=eosinophil%></td>
<td><%=basophl%></td>
<td><%=remark%></td>
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








