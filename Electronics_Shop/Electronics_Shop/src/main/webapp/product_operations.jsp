<%@page import="com.entity.Product"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.conn.DBConnect"%>

<%
    // Retrieve parameters
    String action = request.getParameter("action");
    String pidStr = request.getParameter("pid");

    // Debugging output
    out.println("<p>DEBUG: action = " + action + "</p>");
    out.println("<p>DEBUG: pid = " + pidStr + "</p>");

    // Validate request
    if (action == null || pidStr == null || pidStr.isEmpty()) {
        out.println("<p style='color:red;'>Invalid request! Please select a product and try again.</p>");
        return;
    }

    int pid = Integer.parseInt(pidStr);
    DAO dao = new DAO(DBConnect.getConn());

    if ("Update".equals(action)) {
        String pname = request.getParameter("pname");
        String ppriceStr = request.getParameter("pprice");
        String pquantityStr = request.getParameter("pquantity");
        String pdesc = request.getParameter("pdesc");

        if (pname == null || ppriceStr == null || pquantityStr == null || pdesc == null) {
            out.println("<p style='color:red;'>Missing product details!</p>");
            return;
        }

        int pprice = Integer.parseInt(ppriceStr);
        int pquantity = Integer.parseInt(pquantityStr);

        Product product = new Product(pid, pname, pprice, pquantity, pdesc);
        int rowsAffected = dao.updateProduct(product);

        if (rowsAffected > 0) {
            response.sendRedirect("update_delete_product.jsp?pid=" + pid + "&msg=Product Updated Successfully");
        } else {
            response.sendRedirect("update_delete_product.jsp?pid=" + pid + "&error=Failed to Update Product");
        }
    } 
    else if ("Delete".equals(action)) {
        boolean success = dao.deleteProduct(pid) > 0;

        if (success) {
            response.sendRedirect("update_delete_product.jsp?msg=Product Deleted Successfully");
        } else {
            response.sendRedirect("update_delete_product.jsp?pid=" + pid + "&error=Failed to Delete Product");
        }
    } 
    else {
        out.println("<p style='color:red;'>Invalid action!</p>");
    }
%>
