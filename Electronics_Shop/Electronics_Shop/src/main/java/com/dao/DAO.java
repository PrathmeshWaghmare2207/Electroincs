package com.dao;

import com.conn.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.entity.category;
import com.entity.customer;
import com.utility.MyUtilities;
import com.entity.Product;
import com.entity.customer;
import com.entity.brand;

public class DAO {

    private Connection conn;

    public DAO(Connection conn) {
        this.conn = conn;
    }

    // list all brand
    public List<brand> getAllbrand() {
        List<brand> listb = new ArrayList<brand>();

        brand b = null;

        try {
            String sql = "select * from brand";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new brand();
                b.setBid(rs.getInt(1));
                b.setBname(rs.getString(2));
                listb.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listb;
    }

    // list all category
    public List<category> getAllcategory() {
        List<category> listc = new ArrayList<category>();

        category c = null;

        try {
            String sql = "select * from category";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new category();
                c.setCid(rs.getInt(1));
                c.setCname(rs.getString(2));
                listc.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listc;
    }

    
    
    
    
    
    //get all products
   public List<Product> getAllProducts() {
    List<Product> productList = new ArrayList<>();
    try {
        String query = "SELECT * FROM product";  
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Product p = new Product();
            p.setPid(rs.getInt("pid"));  
            p.setPname(rs.getString("pname"));
            p.setPprice((int) rs.getDouble("pprice"));
            p.setPquantity(rs.getInt("pquantity"));
            p.setPdesc(rs.getString("pdesc"));
            p.setPimage(rs.getString("pimage"));
            productList.add(p);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return productList;
}
   
   
   
   
   
   public Product getProductById(int pid) {
    Product product = null;
    try {
        String query = "SELECT * FROM product WHERE pid = ?";
         PreparedStatement ps = conn.prepareStatement(query);
          ps.setInt(1, pid);
        ResultSet rs = ps.executeQuery();
       

        if (rs.next()) {
            product = new Product();
            product.setPid(rs.getInt("pid"));
            product.setPname(rs.getString("pname"));
            product.setPprice((int)rs.getDouble("pprice"));
            product.setPquantity(rs.getInt("pquantity"));
            product.setPdesc(rs.getString("pdesc"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return product;
}

    //
   public int  addproduct(HttpServletRequest request) {
		
	String path = "C:\\Users\\Admin\\OneDrive\\Documents\\NetBeansProjects\\EcommerceApp\\src\\main\\webapp\\";
	
	
	
		int a =  0;
		try {
			
			String pname = "";
			int pprice = 0;
			int pquantity = 0;
			String pimage = "";
			int bid = 0;
			int cid = 0;
			String pdesc = "";
			
			String sql = "INSERT INTO product(pname, pprice, pquantity, pimage, bid, cid, pdesc) VALUES (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps= conn.prepareStatement(sql);
			

			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			
			for (FileItem item1 : multiparts) {
				if (item1.isFormField()) {
					if (item1.getFieldName().equals("pname"))
						pname = item1.getString();

					if (item1.getFieldName().equals("pprice"))
						pprice = Integer.parseInt(item1.getString());

					if (item1.getFieldName().equals("pquantity"))
						pquantity = Integer.parseInt(item1.getString());

					if (item1.getFieldName().equals("pdesc")) // Extract description
						pdesc = item1.getString();
						
					

					if (item1.getFieldName().equals("bname"))
						{
						if(item1.getString().equals("samsung"))
							bid = 1;
						if(item1.getString().equals("sony"))
							bid = 2;
						if(item1.getString().equals("lenovo"))
							bid = 3;
						if(item1.getString().equals("acer"))
							bid = 4;
						if(item1.getString().equals("onida"))
							bid = 5;
						}
					if (item1.getFieldName().equals("cname"))
					{
						if(item1.getString().equals("laptop"))
							cid = 1;
						if(item1.getString().equals("tv"))
							cid = 2;
						if(item1.getString().equals("mobile"))
							cid = 3;
						if(item1.getString().equals("watch"))
							cid = 4;
					}

				}
				
				else
					{
					com.utility.MyUtilities m1=new MyUtilities();
					String destinationpath=path + "images/";
					ArrayList <String> ext=new ArrayList();
					ext.add(".jpg");ext.add(".bmp");ext.add(".jpeg");ext.add(".png");ext.add(".webp");
					
					pimage = m1.UploadFile(item1, destinationpath, ext);
					
					}
			}
			
			if(pimage.equals("Problem with upload") == false)
			{
				
				
				ps.setString(1, pname);
				ps.setInt(2,pprice);
				ps.setInt(3,pquantity);
				ps.setString(4,pimage);
				ps.setInt(5,bid);
				ps.setInt(6,cid);
				ps.setString(7, pdesc);
				ps.executeUpdate();
				a = 1;
			}
			
			System.out.println("pname: " + pname);
			System.out.println("pprice: " + pprice);
			System.out.println("pquantity: " + pquantity);
			System.out.println("pimage: " + pimage);
			System.out.println("bid: " + bid);
			System.out.println("cid: " + cid);
			System.out.println("pdesc: " + pdesc); 

			
			conn.close();
			
		}catch (Exception e) {
			System.out.println(e);
		}finally {
    try {
        if (conn != null) conn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
}

	return a;
		
	}
   
   
   
   //update and delete 
   // ? Update Product
public int updateProduct(Product product) {
    int result = 0;
    try {
        Connection con = DBConnect.getConn();
        String query = "UPDATE product SET pname=?, pprice=?, pquantity=?, pdesc=? WHERE pid=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, product.getPname());
        ps.setDouble(2, product.getPprice());
        ps.setInt(3, product.getPquantity());
        ps.setString(4, product.getPdesc());
        ps.setInt(5, product.getPid());

        result = ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result;
}

// ? Delete Product
public int deleteProduct(int pid) {
    int result = 0;
    try {
        Connection con = DBConnect.getConn();
        String query = "DELETE FROM product WHERE pid=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, pid);
        result = ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
    return result; 
}

//display all customers
    public List<customer> getAllCustomer() {
        List<customer> list = new ArrayList<customer>();

        customer c = null;

        try {
            String sql = "select * from customer";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new customer();
                c.setName(rs.getString(1));
                c.setPassword(rs.getString(2));
                c.setEmail_Id(rs.getString(3));
                c.setContact_No(rs.getInt(4));
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

//Delete Customer
    public boolean deleteCustomer(customer c) {
        boolean f = false;

        try {

            String sql = "delete from customer where Name = ? and Email_Id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail_Id());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // display selected customer
    public List<customer> getCustomer(String eid) {
        List<customer> list = new ArrayList<customer>();

        customer c = null;

        try {
            String sql = "select * from customer where Email_Id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, eid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                c = new customer();
                c.setName(rs.getString(1));
                c.setPassword(rs.getString(2));
                c.setEmail_Id(rs.getString(3));
                c.setContact_No(rs.getInt(4));
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   

}
