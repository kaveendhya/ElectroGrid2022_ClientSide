$(document).ready(function() 
{ 
if ($("#alertSuccess").text().trim() == "") 
 { 
 $("#alertSuccess").hide(); 
 } 
 $("#alertError").hide(); 
}); 
// SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
// Clear alerts---------------------
 $("#alertSuccess").text(""); 
 $("#alertSuccess").hide(); 
 $("#alertError").text(""); 
 $("#alertError").hide(); 
// Form validation-------------------
var status = validateItemForm(); 
if (status != true) 
 { 
 $("#alertError").text(status); 
 $("#alertError").show(); 
 return; 
 } 
// If valid------------------------
var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 $.ajax( 
 { 
 url : "ElectricityAPI", 
 type : type, 
 data : $("#formItem").serialize(), 
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemSaveComplete(response.responseText, status); 
 } 
 }); 
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
$("#hidItemIDSave").val($(this).data("ConCode")); 
 $("#AccountNum").val($(this).closest("tr").find('td:eq(0)').text()); 
 $("#LineNum").val($(this).closest("tr").find('td:eq(1)').text()); 
 $("#ClientName").val($(this).closest("tr").find('td:eq(2)').text()); 
 $("#NIC").val($(this).closest("tr").find('td:eq(3)').text()); 
$("#ConnecType").val($(this).closest("tr").find('td:eq(4)').text()); 
$("#Email").val($(this).closest("tr").find('td:eq(5)').text()); 
$("#Address").val($(this).closest("tr").find('td:eq(6)').text()); 
$("#WiringType").val($(this).closest("tr").find('td:eq(7)').text()); 
});

$(document).on("click", ".btnRemove", function(event) 
{ 
 $.ajax( 
 { 
 url : "ElectricityAPI", 
 type : "DELETE", 
 data : "ConCode=" + $(this).data("ConCode"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onItemDeleteComplete(response.responseText, status); 
 } 
 }); 
});
// CLIENT-MODEL================================================================
function validateItemForm() 
{ 
// CODE
if ($("#AccountNum").val().trim() == "") 
 { 
 return "Insert Account Number."; 
 } 
// NAME
if ($("#LineNum").val().trim() == "") 
 { 
 return "Insert Line Number."; 
 } 
// PRICE-------------------------------
if ($("#ClientName").val().trim() == "") 
 { 
 return "Insert Client Name."; 
 } 
// PRICE-------------------------------
if ($("#NIC").val().trim() == "") 
 { 
 return "Insert NIC."; 
 } 
// PRICE-------------------------------
if ($("#ConnecType").val().trim() == "") 
 { 
 return "Insert Connection Type."; 
 } 
// PRICE-------------------------------
if ($("#Email").val().trim() == "") 
 { 
 return "Insert Email."; 
 } 
// PRICE-------------------------------
if ($("#Address").val().trim() == "") 
 { 
 return "Insert Address."; 
 } 
if ($("#WiringType").val().trim() == "") 
 { 
 return "Insert Wiring Type."; 
 }

return true; 
}

function onItemSaveComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully saved."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while saving."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while saving.."); 
 $("#alertError").show(); 
 } 
 $("#hidItemIDSave").val(""); 
 $("#formItem")[0].reset(); 
}


function onItemDeleteComplete(response, status) 
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}