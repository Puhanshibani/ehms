<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String deptCd,deptNm[],hdOfDept[];
Connection conn;
Statement stmtshowcode,stmtDeptData;
ResultSet rsshowcode,rsDeptData;
int i;
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

<%
deptNm=new String[30];
hdOfDept=new String[30];

doConnect();
try{
stmtDeptData=conn.createStatement();
rsDeptData=stmtDeptData.executeQuery("select * from eHMS_tblDepartment");
i=0;
while(rsDeptData.next()){
deptNm[i]=rsDeptData.getString("DepartmentName");
hdOfDept[i]=rsDeptData.getString("HeadOfDepartment");
i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>

<html>
<head>
<title>e-Hospital Management System</title>
<script language="javascript">
var images= new Array();
images[0]='2.jpg';
images[1]='3.jpg';
images[2]='4.jpg';
images[3]='5.jpg';
var i=0;
var time=2000;
function slideShow(){
document.imgNm.src=images[i];
if(i< images.length-1){
i=i+1;
} else{
i=0;
}
setTimeout("slideShow()",time);
}
window.onload=slideShow;

function showDepartmentData(){
var jdeptNm=new Array(); 
var jhdOfDept=new Array();
var j=0,k;
<%
i=0;
while(i<deptNm.length){
%>
jdeptNm[j]="<%=deptNm[i]%>";
jhdOfDept[j]="<%=hdOfDept[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbdeptcd.selectedIndex;
document.f1.txtdeptnm.value=jdeptNm[k-1];
document.f1.txthdofdept.value=jhdOfDept[k-1];
}
function goBack(){
window.location="eHMS_Departmentc.html";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Departmentfs.jsp" method="post">


<table width="100%">
<tr>
	<td align="left" width="50%"><font color="maroon" face="Comic Sans MS" size="8">H<font color="red" face="Comic Sans MS" size="6">ospital
	<font color="maroon" size="8">M<font color="red" size="6">anagement
	<font color="maroon" size="8">S<font color="red" size="6">ystem</font></td>
	<td align="right"><img src="cover.jpg"name="imgName" height="70" width="450">&nbsp;<img src="logoo.jpg" width="100" height="70"></td>
</tr>
</table>                                                                                                                
   
<hr width="85%" size="3" color="red">
<hr width="100%" size="4" color="black">
<br>

<table width="65%" height="35%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>D e p a r t m e n t &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<td><b>Department Code</b> </td>
<td>
<select name="cmbdeptcd" onchange="showDepartmentData()">
<option value="">--select--</option>
<%
doConnect();
try{
stmtshowcode=conn.createStatement();
rsshowcode=stmtshowcode.executeQuery("select * from eHMS_tbldepartment");
while(rsshowcode.next()){
deptCd=rsshowcode.getString("DepartmentCode");
%>
<option value="<%=deptCd%>"><%=deptCd%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
</tr>
<tr>
<td><b>Department Name</b></td>
<td><input type="text" name="txtdeptnm" placeholder="Enter Department Name"></td>
</tr>
<tr>
<td><b>Head OF Department</b></td>
<td><input type="text" name="txthdofdept"></td>
</tr>
</table>

<br>


<center>
<input type="submit"  name="btnUpdate"  value="Update" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Back" value= "Back" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goBack()"> 
<input type="submit" name="btnDelete" value=" Delete" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>
</td>
</tr>
</table>
</form>
<br><br><br><br><br><br>

<center>
<img src="#" name="imgNm" height="20%" width="65%">
</center>

<table width="100%" bgcolor="white" height="30">
<tr>
		<td width="88%">
			<font color="blue" size="4"><marquee behavior="alternate">Designed and Developed By:<I><b><U>&nbsp; SUSMITA DAS &nbsp;&nbsp; & &nbsp;&nbsp; SHIBANI PUHAN...</b></I></marquee>
		</td>
		<td align="right"><font color="black"><b>&copy;All rights Reserved</font></td>
</tr>
</table>

</body>
</html>
