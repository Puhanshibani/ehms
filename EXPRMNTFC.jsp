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
window.location="EXPRMNTC.html";
}
</script>
</head>
<body background="back136.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Hospitalfs.jsp" method="post">
<table width="100%">
<tr>
	<td><font color="maroon" face="Comic Sans MS" size="6">H<font color="red" face="Comic Sans MS" size="5">ospital
	<font color="maroon" size="6">M<font color="red" size="5">anagement
	<font color="maroon" size="6">S<font color="red" size="5">ystem</font></td>
	<td align="right"><img src="logoo.jpg" width="100" height="70"></td>
</tr>
</table>
<hr width="100%" size="4" color="maroon">
<hr width="100%" size="4" color="maroon">
<br><br>
<table width="80%" align="center" border="2" background="bk4.jpg"  style="border-radius:20px 20px 0px 0px">
<tr>
	<td style="border-radius:20px 20px 0px 0px">
		<table width="100%" bgcolor="maroon" height="30" style="border-radius:20px 20px 0px 0px"><tr>
		<td><font color="white" size="4"><b><center>H o s p i t a l &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
	</td>
</tr>
<tr>
<td>
<table width="70%"  height="50"  align="center">
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
<td><b>Hospital name</b></td>
<td><input type="text" name="txthosnm" size="30"></td>
</tr>
<tr>
<td><b>Contact person</b></td>
<td><input type="text" name="txtcntprs" size="30"></td>
<tr>
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
<td><b>Phn no</b></td>
<td><input type="text" name="txtphno"></td>
<td><b>Fax no</b></td>
<td><input type="text" name="txtfaxno"></td>
</tr>
<tr>
<td><b>e-mail id</b></td>
<td><input type="mail" name="txtmlid" size="30"></td>
<td><b>Website</b></td>
<td><input type="text" name="txtwbstnm" size="30"></td>
</tr>
</table>
<br>
<center>
<input type="submit" name="btnUpdate" value=" Update " style="color:white;border-radius:20px;background-color:red;height:25px" >
<input type="submit" name="btnDelete" value=" Delete " style="color:white;border-radius:20px;background-color:red;height:25px" >
 <input type="button" name="btnBack"   value="  Back  "style="color:white;border-radius:20px;background-color:red;height:25px" onclick="goBack()">
</center>
<br>
</td>
</tr>
</table>
</form>
<br><br>

<img src="cover.jpg" height="100" width="700">
<table width="100%" bgcolor="maroon" height="30">
<tr>
		<td width="60%">
			<font color="white" size="4"><b><marquee behavior="alternate">Designed and Developed By:<I>Shibani...</marquee></I></b>
		</td>
		<td align="right"><font color="white"><b>&copy;All rights Reserved</font></td>
</tr>
</table>
</body>
</html>
</html>