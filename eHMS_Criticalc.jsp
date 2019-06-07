<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String deptNm;
Connection conn;
Statement stmtshowcode;
ResultSet rsshowcode;
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

function goFind(){
window.location="eHMS_Criticalfc.jsp";
}
function goHome(){
window.close();
}
</script>
</head>
<body background="bk4.jpg" >
<form name="f1" action="eHMS_Criticals.jsp" method="post">
 <table width="100%" bgcolor="maroon" height="45">
 <tr>
	<td align="left" width="35%"></td>
	<td align="center" width="30%"><font color="white" size="5">e-Hospital Management System</font></td>
	<td align="right" width="35%"><img src="logoo.jpg" height="45" width="70"></td>
</tr>
</table>                                                                                                               
   

<br><br><br><br>

<table width="65%" height="35%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="maroon" size="5"><b><center><U>C r i t i c a l &nbsp;&nbsp;&nbsp;  C a r e  &nbsp;&nbsp;&nbsp; H o s p i t a l &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">

<tr>
<td nowrap="nowrap"><b>Sl No.</b> </td>
<td><input type="text" name="txtslno" title="Enter seriel Number Code" placeholder="Example-S001" required><font color="red">*</td>
</tr>
<tr>
<td nowrap="nowrap"><b>Department Name</b></td>
<td>
<select name="cmbdeptnm" >
<option value="">--select--</option>
<%
doConnect();
try{
stmtshowcode=conn.createStatement();
rsshowcode=stmtshowcode.executeQuery("select * from eHMS_tbldepartment");
while(rsshowcode.next()){
deptNm=rsshowcode.getString("DepartmentName");
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
<option value="1 "> 1 </option>
<option value=" 2"> 2 </option>
<option value="3 "> 3 </option>
<option value="4 "> 4 </option>
<option value=" 6"> 5 </option>
<option value=" 7"> 7 </option>
<option value="8 ">8  </option>
<option value="9 "> 9 </option>
<option value="10 "> 10 </option>
<option value=" 11"> 11 </option>
<option value="12 "> 12 </option>
<option value="13 "> 13 </option>
<option value=" "> 14 </option>
<option value=" ">  15</option>
<option value=" "> 16 </option>
<option value=" "> 17</option>
<option value=" "> 18 </option>
<option value=" "> 19 </option>
<option value=" "> 20 </option>
</select></td>
</tr>

</table>

<br>
<center>
<input type="button" name="gotohome" value= "Go To Home" style="color:black;border-radius:20px;background-color:white;height:25px" onclick="goHome()">
<input type="submit" name="Submit" value="Submit" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Find" value= "Find" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goFind()"> 
<input type="reset" name="Reset" value=" Reset" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>

</td>
</tr>
</table>
</form>
<br><br><br><br><br><br><br>


<table align="center" width="95%"  height="30" bgcolor="maroon" style="border-radius:20px 20px 20px 20px">
<tr bgcolor="maroon" width="95%" style="border-radius:20px 20px 20px 20px">	
<td align="left"width="16%" style="border-radius:20px 0px 0px 20px"><font color="white" size="3"> Designed and Developed By:</td>
		<td width="67%" align="center">
			<font color="white" size="4"><marquee behavior="alternate"><b><U> SUSMITA DAS </U>&nbsp;and&nbsp;<U> SHIBANI PUHAN </U></b></marquee>
		</td>
		<td width="12%" align="right" style="border-radius:0px 20px 20px 0px" ><font color="white"><b>&copy;All rights Reserved</td>
</tr>
</table>


</body>
</html>
