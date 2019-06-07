<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of critical care Hospital Profile</title>
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
String serielno,departmentnm,hospitalnm,city,state,rank,dname;
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
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>C<font color="white" size="6">ritical</U> <font color="black" size="7">&nbsp;<U>C<font color="white" size="6">are</U><font color="black" size="7">&nbsp;<U>H<font color="white" size="6">ospital</U><font color="black" size="7">&nbsp;<U>I<font color="white" size="6">nformation</U> &nbsp;&nbsp;&nbsp;&nbsp;<U><font size="6" color="white"><%=departmentnm%> Department </U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td><font size="4" color="white">Sl No.</td>
<td><font size="4" color="white">Rank</td>
<td><font size="4" color="white">Hospital Name</td>
<td><font size="4" color="white">City</td>
<td><font size="4" color="white">State</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
dname=request.getParameter("cmbdeptnm");
rsData=stmtSelect.executeQuery("select * from eHMS_tblCritical where DepartmentName='"+dname+"'");
slno=1;
while(rsData.next()){
serielno=rsData.getString("SlNo");
departmentnm=rsData.getString("DepartmentName");
hospitalnm=rsData.getString("HospitalName");
city=rsData.getString("City");
state=rsData.getString("State");
rank=rsData.getString("Rank");
if(slno%2==1)
out.println("<tr bgcolor=\"lightblue\">");
else
out.println("<tr bgcolor=\"white\">");
%>
<td><%=slno%></td>
<td><%=rank%></td>
<td><%=hospitalnm%></td>
<td><%=city%></td>
<td><%=state%></td>

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





