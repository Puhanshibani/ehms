<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String deptNm,serielNo,departmentNm[],hospitalNm[],city[],state[],rank1[];
Connection conn;
Statement stmtshowname,stmtshowslno,stmtSerielData;
ResultSet rsshowname,rsshowslno,rsSerielData;
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
departmentNm=new String[30];
hospitalNm=new String[30];
city=new String[30];
state=new String[30];
rank1=new String[30];
doConnect();
try{
stmtSerielData=conn.createStatement();
rsSerielData=stmtSerielData.executeQuery("select * from eHMS_tblCritical");
i=0;
while(rsSerielData.next()){
departmentNm[i]=rsSerielData.getString("DepartmentName");
hospitalNm[i]=rsSerielData.getString("HospitalName");
city[i]=rsSerielData.getString("City");
state[i]=rsSerielData.getString("State");
rank1[i]=rsSerielData.getString("Rank");
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


function showSerielData(){
var jdepartmentNm=new Array(); 
var jhospitalNm=new Array();
var jcity=new Array();
var jstate=new Array();
var jrank=new Array();
var j=0,k;
<%
i=0;
while(i<departmentNm.length){
%>
jdepartmentNm[j]="<%=departmentNm[i]%>";
jhospitalNm[j]="<%=hospitalNm[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jrank[j]="<%=rank1[i]%>";
j=j+1;
<%
i=i+1;
}
%>

k=document.f1.cmbslno.selectedIndex;
jdepartmentNm[k-1]=jdepartmentNm[k-1].trim();
document.f1.cmbdeptnm.value=jdepartmentNm[k-1];
document.f1.txthospitalname.value=jhospitalNm[k-1];
document.f1.txtcity.value=jcity[k-1];
jstate[k-1]=jstate[k-1].trim();
document.f1.cmbstate.value=jstate[k-1];
jrank[k-1]=jrank[k-1].trim();
document.f1.cmbrank.value=jrank[k-1];
alert("hii");
}


function goBack(){
window.location="eHMS_Criticalc.jsp";
}
function goHome(){
window.close();
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Criticalfs.jsp" method="post">
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
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>C r i t i c a l &nbsp;&nbsp;&nbsp;  C a r e  &nbsp;&nbsp;&nbsp; H o s p i t a l &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">

<tr>
<td nowrap="nowrap"><b>Sl No.</b> </td>
<td>
<select name="cmbslno" onchange="showSerielData()">
<option value="">--select--</option>
<%
doConnect();
try{
stmtshowslno=conn.createStatement();
rsshowslno=stmtshowslno.executeQuery("select * from eHMS_tblCritical");
while(rsshowslno.next()){
serielNo=rsshowslno.getString("SlNo");
%>
<option value="<%=serielNo%>"><%=serielNo%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</tr>
<tr>
<td nowrap="nowrap"><b>Department Name</b></td>
<td>
<select name="cmbdeptnm" >
<option value="">--select--</option>
<%
doConnect();
try{
stmtshowname=conn.createStatement();
rsshowname=stmtshowname.executeQuery("select * from eHMS_tbldepartment");
while(rsshowname.next()){
deptNm=rsshowname.getString("DepartmentName");
%>
<option value="<%=deptNm%>"><%=deptNm%></option>
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
<td nowrap="nowrap"><b>Hospital Name</b></td>
<td><input type="text" name="txthospitalname"></td>
</tr>
<tr>
<td><b>City</b></td>
<td><input type="text" name="txtcity">
</td>
</tr>
<tr>
<td><b>State</b></td>
<td><select name="cmbstate">
<option value="Null">--select--</option>
<option value="Andhra pradesh">Andhra pradesh</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhatisgarh">Chhatisgarh</option>
<option value="Goa">Goa</option>
<option value="Gujurat">Gujurat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu & Kasmir">Jammu & Kasmir</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnatak">Karnatak</option>
<option value="Keral">Keral</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharastra">Maharastra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram</option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajastan">Rajastan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telengana">Telengana</option>
<option value="Tripura">Tripura</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="Utter Pradesh">Utter Pradesh</option>
<option value="West Bengal">West Bengal</option>
</select></td>
</tr>
<tr>
<td><b>Rank</b></td>
<td><select name="cmbrank">
<option value="Null">--select--</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="6">5</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
</select></td>
</tr>

</table>

<br>
<center>
<input type="submit"  name="btnUpdate"  value="Update" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Back" value= "Back" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goBack()"> 
<input type="submit" name="btnDelete" value=" Delete" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="reset" name="Reset" value=" Reset" style="color:black;border-radius:20px;background-color:white;height:25px">
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
			<font color="blue" size="4"><marquee behaviour="alternate">Designed and Developed By:<I><b><U>&nbsp; SUSMITA DAS &nbsp;&nbsp; & &nbsp;&nbsp; SHIBANI PUHAN...</b></I></marquee>
		</td>
		<td align="right"><font color="black"><b>&copy;All rights Reserved</font></td>
</tr>
</table>


</body>
</html>
