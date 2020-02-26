<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>H1 {text-align:center;}
       H2 {text-align:center;}
</style>
<meta charset="ISO-8859-1">

<title>CustomerList</title>
</head>

<body>

 <H1 style="color:green">Customer Fleet List</H1>
    <form method="get" action="search">
        <input type="text" name="keyword" /> &nbsp;
        <input type="submit" value="Search" />
    </form>
 <h3><a href="/new">New Customer</a></h3>
   
   <table border="1" cellpadding="10">
     <tr>
     <th>Customer IDs</th> 
     <th>Customer Name</th>
     <th>Address </th>
     <th>City </th>
     <th>State </th>
     <th>Country </th>
     <th>Postal Code </th>
     <th>Latitude </th>
     <th>Longitude </th>
     <th>Business Phone </th>
     <th>Personal Phone </th>

     
   </tr>
   <c:forEach items="${CustomerFleetJoins}" var="customerf">
     <tr>
         <td>${customerf.customerId}</td>
         <td>${customerf.customerName}</td>
         <td>${customerf.address_line_1}</td>
         <td>${customerf.city}</td>
         <td>${customerf.state}</td>
         <td>${customerf.country}</td>
         <td>${customerf.postal_code}</td>
         <td>${customerf.latitude}</td>
         <td>${customerf.longitude}</td>
         <td>${customerf.business_phone}</td>
         <td>${customerf.personal_phone}</td>
         <td>
                <a href="/edit?id=${customer.id}">Edit</a>
                &nbsp;&nbsp;&nbsp;
                <a href="/delete?id=${customer.id}">Delete</a>
            </td>    
        
      </tr>  
      </c:forEach>  
   </table>

 <H1 style="color:green">Customer Fleet Infos</H1>

 <table border="1" cellpadding="10">
     <tr>
         <th>Fleet IDs</th>
         <th>Fleet Name</th>
         <th>Fleet Model </th>
         <th>Fleet Make </th>
         <th>Latitude </th>
         <th>Longitude </th>
         <th>Category </th>
         <th>Serial Number </th>

     </tr>
     <tr th:each="fleet:${customerf.fleetInfos}" >


         <td th:text="${fleet.fleet_id}"></td>
         <td th:text="${fleet.fleet_name}"></td>
         <td th:text="${fleet.fleet_model}"></td>
         <td th:text="${fleet.fleet_make}"></td>
         <td th:text="${fleet.latitude}"></td>
         <td th:text="${fleet.longitude}"></td>
         <td th:text="${fleet.category}"></td>
         <td th:text="${fleet.serial_number}"></td>

 </table>




</body>
</html>


