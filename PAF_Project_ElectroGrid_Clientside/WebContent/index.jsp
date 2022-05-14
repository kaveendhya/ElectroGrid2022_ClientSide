<%@page import="model.Electricity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
if (request.getParameter("AccountNum") != null) 
{ 
	Electricity eleconnec = new Electricity();
 String stsMsg = ""; 
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "") 
 { 
 stsMsg = eleconnec.insertNewConnection(request.getParameter("AccountNum"), 
 request.getParameter("LineNum"), 
 request.getParameter("ClientName"), 
 request.getParameter("NIC"),
 request.getParameter("ConnecType"),
 request.getParameter("Email"),
 request.getParameter("Address"),
 request.getParameter("WiringType")); 
 } 
else//Update----------------------
 { 
 stsMsg = eleconnec.updateConnections(request.getParameter("hidItemIDSave"), 
		 request.getParameter("AccountNum"), 
		 request.getParameter("LineNum"), 
		 request.getParameter("ClientName"), 
		 request.getParameter("NIC"),
		 request.getParameter("ConnecType"),
		 request.getParameter("Email"),
		 request.getParameter("Address"),
		 request.getParameter("WiringType"));  
 } 
 session.setAttribute("statusMsg", stsMsg); 
} 
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null) 
{ 
Electricity eleconnec = new Electricity();
 String stsMsg = 
	eleconnec.deleteConnection(request.getParameter("hidItemIDDelete")); 
 session.setAttribute("statusMsg", stsMsg); 
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
</head>
<body> 
<div class="container"><div class="row"><div class="col-6"> 
<h1>ELectricity Connection Management</h1>
<form id="formItem" name="formItem">
 Account Number: 
 <input id="AccountNum" name="AccountNum" type="text" 
 class="form-control form-control-sm">
 <br> Line Number: 
 <input id="LineNum" name="LineNum" type="text" 
 class="form-control form-control-sm">
 <br> Client Name: 
 <input id="ClientName" name="ClientName" type="text" 
 class="form-control form-control-sm">
 <br> NIC: 
 <input id="NIC" name="NIC" type="text" 
 class="form-control form-control-sm">
 <br> Connection Type: 
 <input id="ConnecType" name="ConnecType" type="text" 
 class="form-control form-control-sm">
 <br>
 <br> Email: 
 <input id="Email" name="Email" type="text" 
 class="form-control form-control-sm">
 <br>
 <br> Address: 
 <input id="Address" name="Address" type="text" 
 class="form-control form-control-sm">
 <br>
 <br> Wiring Type: 
 <input id="WiringType" name="WiringType" type="text" 
 class="form-control form-control-sm">
 <br>
 <input id="btnSave" name="btnSave" type="button" value="Save" 
 class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave" 
 name="hidItemIDSave" value="">
</form>
<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divItemsGrid">
 <%
 Electricity eleconnec = new Electricity(); 
 out.print(eleconnec.readConnections()); 
 %>
</div>
</div> </div> </div> 
</body>
</html>
