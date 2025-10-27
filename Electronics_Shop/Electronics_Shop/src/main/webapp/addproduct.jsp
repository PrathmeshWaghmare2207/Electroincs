<%@page import="com.entity.Product"%>
<%@page import="com.entity.category"%>
<%@page import="com.entity.brand"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet" href="images/bootstrap.css">
<link rel="stylesheet" href="Css/w3.css">
<link rel="stylesheet" href="Css/font.css">
<link rel="stylesheet" href="Css/abc.css">

<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}

.a { margin-right: 225px; }
.b { margin-right: 190px; }
.e { margin-right: 205px; }
.d { margin-right: 215px; }
.f { margin-right: 265px; }
.g { margin-right: 195px; }
.j { margin-left: 17px; }
</style>
</head>
<body>

<%@ include file="admin_navbar.jsp" %>

<div style="background-color: #ebe9eb">
    <br>
    <h1>Manage Product</h1>
    <br>
</div>
<br>

<div class="container border">
    <form id="productForm" method="post" action="addproduct" enctype="multipart/form-data">
        
        <!-- Select Brand -->
        <h4><b class="a">Select Brand:</b></h4>
        <h2>
            <select name="bname" class="c"> 
                <% 
                DAO dao = new DAO(DBConnect.getConn());
                List<brand> listb = dao.getAllbrand();
                for(brand b : listb) { %>
                    <option><%= b.getBname() %></option>
                <% } %>
            </select>
        </h2>

        <!-- Select Category -->
        <h4><b class="b">Select Category:</b></h4>
        <h2>
            <select name="cname" class="c">
                <% 
                List<category> listc = dao.getAllcategory();
                for(category c : listc) { %>    
                    <option><%= c.getCname() %></option>
                <% } %>
            </select>
        </h2>

        <!-- Product Name -->
        <h4><b class="e">Product Name:</b></h4>
        <h2><input type="text" name="pname" class="c" required></h2>

        <!-- Product Price -->
        <h4><b class="d">Product Price:</b></h4>
        <h2><input type="number" name="pprice" class="c" required></h2>

        <!-- Quantity -->
        <h4><b class="f">Quantity:</b></h4>
        <h2><input type="number" value="1" name="pquantity" class="c" required></h2>

        <!-- Product Description -->
        <h4><b>Product Description:</b></h4>
        <h2><textarea name="pdesc" class="c" rows="4" cols="50" required></textarea></h2>

        <!-- Product Image -->
        <h4><b class="g">Product Image:</b></h4>
        <div class="j">
            <h6><b><input type="file" name="pimage" required></b></h6>
        </div>

        <br><br>
        <!-- Buttons -->
        <h3>
            <b><input type="submit" value="Add Product"></b>
            <b><input type="button" value="Clear" onclick="clearForm()"></b>
            <b><input type="button" value="Update/Delete" onclick="redirectToUpdatePage()"></b>
        </h3>

    </form>
</div>

<br>

<footer text-align="center" style="padding: 3px;">
    <%@ include file="footer.jsp" %>
</footer>

<script>
    // Function to clear form fields
    function clearForm() {
        document.getElementById("productForm").reset();
    }

    // Function to redirect to Update/Delete Page
    function redirectToUpdatePage() {
        window.location.href = "update_delete_product.jsp";
    }
</script>

</body>
</html>
