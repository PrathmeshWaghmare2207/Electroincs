<%@page import="com.entity.Product"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update/Delete Product</title>
    <link rel="stylesheet" href="images/bootstrap.css">
    <link rel="stylesheet" href="Css/w3.css">
    <link rel="stylesheet" href="Css/font.css">
    <link rel="stylesheet" href="Css/abc.css">
    <style>
        .w3-sidebar a {font-family: "Roboto", sans-serif}
        body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
    </style>
    <script>
        function fetchProductDetails() {
            var pid = document.getElementById("pid").value;
            if (pid) {
                window.location.href = "update_delete_product.jsp?pid=" + pid;
            }
        }
         function clearForm() {
        document.getElementById("productForm").reset(); 
        
        
        document.getElementById("pid").selectedIndex = 0; 
        
        
        document.querySelector("input[name='pname']").value = "";
        document.querySelector("input[name='pprice']").value = "";
        document.querySelector("input[name='pquantity']").value = "";
        document.querySelector("textarea[name='pdesc']").value = "";
    }
    </script>
</head>
<body>

<%@ include file="admin_navbar.jsp" %>

<div style="background-color: #ebe9eb">
    <br>
    <h1>Update / Delete Product</h1>
    <br>
    <%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
%>

<% if (msg != null) { %>
    <div style="color: green; font-weight: bold;"><%= msg %></div>
<% } %>

<% if (error != null) { %>
    <div style="color: red; font-weight: bold;"><%= error %></div>
<% } %>

</div>
<br>

<%
    String pidStr = request.getParameter("pid");
    Product product = null;
    DAO dao = new DAO(DBConnect.getConn());

    if (pidStr != null && !pidStr.isEmpty()) {
        try {
            int pid = Integer.parseInt(pidStr);
            product = dao.getProductById(pid);
        } catch (NumberFormatException e) {
            out.println("<p style='color:red;'>Invalid Product ID!</p>");
        }
    }

    List<Product> productList = dao.getAllProducts();
%>

<div class="container border">
    <form id="productForm" method="post" action="product_operations.jsp">
        <h4><b>Select Product:</b></h4>
        <select name="pid" id="pid" class="c" onchange="fetchProductDetails()">
            <option value="">-- Select Product --</option>
            <% for(Product p : productList) { %>
                <option value="<%= p.getPid() %>" <%= (product != null && p.getPid() == product.getPid()) ? "selected" : "" %>><%= p.getPname() %></option>
            <% } %>
        </select>

        <h4><b>Product Name:</b></h4>
        <input type="text" name="pname" class="c" value="<%= (product != null) ? product.getPname() : "" %>" required>

        <h4><b>Product Price:</b></h4>
        <input type="number" name="pprice" class="c" value="<%= (product != null) ? product.getPprice() : "" %>" required>

        <h4><b>Quantity:</b></h4>
        <input type="number" name="pquantity" class="c" value="<%= (product != null) ? product.getPquantity() : "" %>" required>

        <h4><b>Product Description:</b></h4>
        <textarea name="pdesc" class="c" rows="4" required><%= (product != null) ? product.getPdesc() : "" %></textarea>

        <br>
        <h3>
            <input type="submit" name="action" value="Update">
            <input type="submit" name="action" value="Delete" onclick="return confirm('Are you sure you want to delete this product?');">
            <input type="button" value="Clear" onclick="clearForm()">
        </h3>
    </form>
</div>

<footer style="text-align: center; padding: 3px;">
    <%@ include file="footer.jsp" %>
</footer>

</body>
</html>
