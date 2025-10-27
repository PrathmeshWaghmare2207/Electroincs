<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.viewlist"%>
<%@page import="com.dao.DAO2"%>
<%@page import="java.util.Base64.Decoder"%>

<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product Details</title>
        <link rel="stylesheet" href = "images/bootstrap.css">

        <link rel="stylesheet" href="Css/w3.css">
        <link rel="stylesheet" href="Css/font.css">

        <style>
            .w3-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
        </style>
    </head>
    <script>

        function abc(x)
        {

            alert(x);
        }
    </script>
    <body>

        <%@ include file = "navbar.jsp" %>

    <center>
        <div style="background-color: #ebe9eb">
            <br>
            <h1>Product</h1>
            <br>
        </div>
        <br>

        <div class="container border">
            <center>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

                        <%
                            // Get Product Image Name from Request Parameter
                            String st = request.getParameter("Pn");
                            System.out.println("Received Pimage: " + st); // Debugging

                            // Fetch Data from Database
                            DAO2 dao = new DAO2(DBConnect.getConn());
                            List<viewlist> list = dao.getSelecteditem(st);

                            // Check if any product is retrieved
                            if (list.isEmpty()) {
                                out.println("<h3 style='color:red;'>No product found!</h3>");
                            } else {
                                for (viewlist l : list) {
                        %>  

                        <table>
                            <tr>
                                <th colspan='2' align='center'>
                                    <img src='images/<%= l.getPimage()%>' height="250px">
                                </th>
                            </tr>
                        </table>

                        <table border="1" cellspacing="5" cellpadding="5" align="center">
                            <tr>
                                <th>Brand:</th>
                                <th><%= l.getBname()%></th>
                            </tr>
                            <tr>
                                <th>Category:</th>
                                <th><%= l.getCname()%></th>
                            </tr>
                            <tr>
                                <th>Product Name:</th>
                                <th><%= l.getPname()%></th>
                            </tr>
                            <tr>
                                <th>Price:</th>
                                <th>₹ <%= l.getPprice()%></th>
                            </tr>
                            <tr>
                                <th>Quantity:</th>
                                <th><%= l.getPquantity()%></th>
                            </tr>
                            <tr>
                                <th style='text-align: center' colspan='2' bgcolor='#D6EEEE'>
                                    <a href='addtocartnulla?id=<%= l.getBname()%>&ie=<%= l.getCname()%>&ig=<%= l.getPname()%>&ih=<%= l.getPprice()%>&ii=<%= l.getPquantity()%>&ij=<%= l.getPimage()%>'>
                                        Add To Cart
                                    </a>
                                </th>
                            </tr>
                        </table>

                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <h2><%= l.getPname()%></h2><br>
                        <h3> ₹ <%= l.getPprice()%> </h3><br>

                        <p>Discover the amazing features. Designed for performance and reliability,  
                            this product ensures a seamless experience, whether for work, entertainment, or daily use.  
                            Shop now and get the best value with fast delivery and secure payment options!</p><br>
                        <h3>Description</h3><br>

                        <p><%= (l.getPdesc() != null) ? l.getPdesc() : "No description available"%></p>

                    </div>

                    <%
                            } // End of Loop
                        }
                    %>

                </div>
            </center>
        </div>
    </center>

    <br>
    <footer text-align="center" style="padding: 3px;">

            <%@ include file = "footer.jsp" %>
</footer>
</body>
</html>