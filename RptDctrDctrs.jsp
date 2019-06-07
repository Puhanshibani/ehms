<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Doctor Profile</title>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String dctrid,dctrnm,sex,loc,ct,st,pn,ei,doj,dept,photo;
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
	<td align="center"><font color="black" size="7"><U>D<font color="white" size="6">octor <font color="black" size="7">&nbsp;I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap" ><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Doctor's ID</td>
<td nowrap="nowrap"><font size="4" color="white">Doctor's Name</td>
<td><font size="4" color="white">Sex</td>
<td><font size="4" color="white">Locality</td>
<td><font size="4" color="white">City</td>
<td><font size="4" color="white">State</td>
<td nowrap="nowrap"><font size="4" color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4" color="white">Email ID</td>
<td nowrap="nowrap"><font size="4" color="white">Date Of Join</td>
<td><font size="4" color="white">Department</td>
<td><font size="4" color="white">Photo</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();                                            
dctrnm=request.getParameter("cmbdctnm");
rsData=stmtSelect.executeQuery("select * from eHMS_tbldoctor where DoctorsName='"+dctrnm+"'");
slno=1;
while(rsData.next()){
dctrid=rsData.getString("DoctorsId");
dctrnm=rsData.getString("DoctorsName");
sex=rsData.getString("Sex");
loc=rsData.getString("Locality");
ct=rsData.getString("City");
st=rsData.getString("State");
pn=rsData.getString("PhoneNo");
ei=rsData.getString("EmailId");
doj=rsData.getString("DtOfJoin");
dept=rsData.getString("Department");
photo=rsData.getString("Photo");
if(slno%2==1)
out.println("<tr bgcolor=\"lightblue\">");
else
out.println("<tr bgcolor=\"white\">");
%>
<td><%=slno%></td>
<td><%=dctrid%></td>
<td><%=dctrnm%></td>
<td><%=sex%></td>
<td><%=loc%></td>
<td><%=ct%></td>
<td><%=st%></td>
<td><%=pn%></td>
<td><%=ei%></td>
<td><%=doj%></td>
<td><%=dept%></td>
<td><%=photo%></td>
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








