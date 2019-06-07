<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String regno,hosNm[],contPerson[],locality[],city[],state[],phNo[],faxNo[],emailId[],webSite[];
Connection conn;
Statement stmtshowreg,stmtHosData;
ResultSet rsshowreg,rsHosData;
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
hosNm=new String[30];
contPerson=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
faxNo=new String[30];
emailId=new String[30];
webSite=new String[30];
doConnect();
try{
stmtHosData=conn.createStatement();
rsHosData=stmtHosData.executeQuery("select * from eHMS_tblHospital");
i=0;
while(rsHosData.next()){
hosNm[i]=rsHosData.getString("HospitalName");
contPerson[i]=rsHosData.getString("ConPerson");
locality[i]=rsHosData.getString("Locality");
city[i]=rsHosData.getString("City");
state[i]=rsHosData.getString("State");
phNo[i]=rsHosData.getString("PhNo");
faxNo[i]=rsHosData.getString("FaxNo");
emailId[i]=rsHosData.getString("Email");
webSite[i]=rsHosData.getString("WebSite");
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
document.slide.src=images[i];
if(i< images.length-1){
i=i+1;
} else{
i=0;
}
setTimeout("slideShow()",time);
}
window.onload=slideShow;


function showHospitalData(){
var jhosNm=new Array();
jcontPerson=new Array(); 
jlocality=new Array();
jcity=new Array();
jstate=new Array();
jphNo=new Array();
jfaxNo=new Array();
jemailId=new Array();
jwebSite=new Array();
var j=0,k;
<%
i=0;
while(i<hosNm.length){
%>
jhosNm[j]="<%=hosNm[i]%>";
jcontPerson[j]="<%=contPerson[i]%>"; 
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
jfaxNo[j]="<%=faxNo[i]%>";
jemailId[j]="<%=emailId[i]%>";
jwebSite[j]="<%=webSite[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbregno.selectedIndex;
document.f1.txthosnm.value=jhosNm[k-1];
document.f1.txtcntprs.value=jcontPerson[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
jstate[k-1]=jstate[k-1].trim();
document.f1.cmbstate.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txtfaxno.value=jfaxNo[k-1];
document.f1.txtmlid.value=jemailId[k-1];
document.f1.txtwbstnm.value=jwebSite[k-1];
}
function goBack(){
window.location="eHMS_Hospitalc.html";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Hospitalfs.jsp" method="post">
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

<table width="70%" height="45%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>H o s p i t a l &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>

<td><b>Registration no</b></td>
<td>
<select name="cmbregno" onchange="showHospitalData()">
<option value="null">--select--</option>
<%
doConnect();
try{
stmtshowreg=conn.createStatement();
rsshowreg=stmtshowreg.executeQuery("select * from eHMS_tblHospital");
while(rsshowreg.next()){
regno=rsshowreg.getString("RegistrationNo");
%>
<option value="<%=regno%>"><%=regno%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
<tr>
<td nowrap="nowrap"><b>Hospital name</b></td>
<td><input type="text" name="txthosnm" size="30" title="Enter Registration No." placeholder="First 3 letter must be REG"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Contact person</b></td>
<td><input type="text" name="txtcntprs" size="30"></td>
</tr>
<tr>
<td><b>Locality</b></td>
<td><input type="text" name="txtloc"></td>
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
<td nowrap="nowrap"><b>Phone No.</b></td>
<td><input type="text" name="txtphno"></td>
<td nowrap="nowrap"><b>Fax No.</b></td>
<td><input type="text" name="txtfaxno"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>e-mail id</b></td>
<td><input type="mail" name="txtmlid" size="30" placeholder="Example-abc@gmail.com"></td>
<td><b>Website</b></td>
<td><input type="text" name="txtwbstnm" size="30" placeholder="www.abc.com"></td>
</tr>
</table>
<br>
<center>
<input type="submit"  name="btnUpdate"  value="Update" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Back" value= "Back" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goBack()"> 
<input type="submit" name="btnDelete" value=" Delete" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>
<br>
</td>
</tr>
</table>
</form>
<br><br>

<center>
<img src="#" name="slide" height="20%" width="70%">
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
</html>