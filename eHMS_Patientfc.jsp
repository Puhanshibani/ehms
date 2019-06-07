<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String refNo,regdNo,dtofregd[],ptntNm[],age[],sex[],maritalSts[],locality[],city[],state[],phNo[];
Connection conn;
Statement stmtshowreg,stmtptntData;
ResultSet rsshowreg,rsptntData;
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
dtofregd=new String[30];
ptntNm=new String[30];
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];

doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatient");
i=0;
while(rsptntData.next()){
dtofregd[i]=rsptntData.getString("DtOfRegd");
ptntNm[i]=rsptntData.getString("PatientName");
age[i]=rsptntData.getString("Age");
sex[i]=rsptntData.getString("Sex");
maritalSts[i]=rsptntData.getString("MaritalStatus");
locality[i]=rsptntData.getString("Locality");
city[i]=rsptntData.getString("City");
state[i]=rsptntData.getString("State");
phNo[i]=rsptntData.getString("PhoneNo");

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

function showPatientData(){
var jdtofregd=new Array();
jptntNm=new Array();
jage=new Array();
jsex=new Array(); 
jmaritalSts=new Array();
jlocality=new Array();
jcity=new Array();
jstate=new Array();
jphNo=new Array();

var j=0,k;
<%
i=0;
while(i<dtofregd.length){
%>
jdtofregd[j]="<%=dtofregd[i]%>";
jptntNm[j]="<%=ptntNm[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";



j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbregno.selectedIndex;
document.f1.dtdor.value=jdtofregd[k-1];
document.f1.txtptntrm.value=jptntNm[k-1];
document.f1.txtage.value=jage[k-1];
jsex[k-1]=jsex[k-1].trim();
document.f1.cmbsex.value=jsex[k-1];
jmaritalSts[k-1]=jmaritalSts[k-1].trim();
document.f1.cmbmaritalstatus.value=jmaritalSts[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
jstate[k-1]=jstate[k-1].trim();
document.f1.cmbstate.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];


}
function goBack(){
window.location="eHMS_Patientc.html";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Patientfs.jsp" method="post">
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
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="75%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td nowrap="nowrap"><b>Registration no</b></td>
<td>
<select name="cmbregno" onchange="showPatientData()">
<option value="null">--select--</option>
<%
doConnect();
try{
stmtshowreg=conn.createStatement();
rsshowreg=stmtshowreg.executeQuery("select * from eHMS_tblPatient");
while(rsshowreg.next()){
regdNo=rsshowreg.getString("RegistrationNo");
%>
<option value="<%=regdNo%>"><%=regdNo%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
<td nowrap="nowrap"><b>Date Of Regd.</b></td>
<td><input type="date" name="dtdor"></td></tr>
<tr>
<td nowrap="nowrap"><b>Patient Name</b></td>
<td><input type="text" name="txtptntrm" size="30" placeholder="Enter Patient Name"></td>
<td><b>Age</b></td>
<td><input type="text" name="txtage" size="30" placeholder="Only Numeric Alllowed"></td>

</tr>
<tr>
<td><b>Sex</b></td>
<td><select name="cmbsex">
<option value="Null">--select--</option>
<option value="M">MALE</option>
<option value="F">FEMALE</option>
</select></td>
<td nowrap="nowrap"><b>Marital Status</b></td>
<td>
<select name="cmbmaritalstatus">
<option value="">--select--</option>
<option value="Married">Married</option>
<option value="Unmarried">Unmarried</option>
</select></td>

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