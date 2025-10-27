<%@page import="com.entity.viewlist"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO2"%>
<%@page import="java.util.Base64.Decoder"%>
<%@page import ="org.apache.commons.codec.DecoderException"%>
<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href = "images/bootstrap.css">
        <title>Product Details</title>
        <link rel="stylesheet" href="Css/w3.css">
        <link rel="stylesheet" href="Css/font.css">

        <style>
            .w3-sidebar a {font-family: "Roboto", sans-serif}
            body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
        </style>
    </head>

    <body>

        <%@ include file = "customer_navbar.jsp" %>
    <center>
        <div style="background-color: #ebe9eb">
            <br>
            <h1>Product</h1>
            <br>
        </div>
        <br>


        <div class = "container border" style="background-color:">
            <center>
                <div class = "row">
                    <div class = "col-lg-6 col-md-6 col-sm-12 col-xs-12">

                        <%
                            String st = request.getParameter("Pn");
                            DAO2 dao = new DAO2(DBConnect.getConn());
                            List<viewlist> list = dao.getSelecteditem(st);

                            for (viewlist l : list) {%>	


                        <table>

                            <tr>
                                <th colspan='2' align='center'><img src='images/<%=l.getPimage()%>' height= 250px></th>
                            </tr>

                        </table>

                        <table border = '1' cellspacing=5 cellpadding=5 align='center'>

                            <tr>
                                <th>Brand: </th>
                                <th> <%=l.getBname()%></th>
                            </tr>

                            <tr>
                                <th>Category: </th>
                                <th> <%=l.getCname()%></th>
                            </tr>

                            <tr>
                                <th>Product Name: </th>
                                <th><%=l.getPname()%> </th>
                            </tr>

                            <tr>
                                <th>Price: </th>
                                <th>₹ <%=l.getPprice()%> </th>
                            </tr>

                            <tr>
                                <th>Quantity: </th>
                                <th><%=l.getPquantity()%> </th>
                            </tr>

                            <tr>
                                <th style='text-align: center' colspan='2' align='center' bgcolor='#D6EEEE'><a href='addtocart?id=<%=l.getBname()%>&ie=<%=l.getCname()%>&ig=<%=l.getPname()%>&ih=<%=l.getPprice()%>&ii=<%=l.getPquantity()%>&ij=<%=l.getPimage()%>&N=<%=N%>'>Add To Cart</th>

                            </tr>

                        </table>




                    </div>

                    <div class = "col-lg-6 col-md-6 col-sm-12 col-xs-12">


                        <h2><%=  l.getPname()%></h2><br>
                        <h3> ₹ <%=  l.getPprice()%> </h3><br>
                        <p>Discover the amazing features. Designed for performance and reliability,  
                            this product ensures a seamless experience, whether for work, entertainment, or daily use.  
                            Shop now and get the best value with fast delivery and secure payment options!</p><br>

                        <h3>Description</h3><br>
                        <p><%=  l.getPdesc()%></p>  




                    </div>

                    <%
                        } // End of Loop

                    %>
            </center>
        </div>



    </body>
</table>

</center>

<br>
<footer text-align: center;
        padding: 3px;
        background-color: DarkSalmon;
        color: white;>

        <%@ include file = "footer.jsp" %>
</footer>
</body>
</html>