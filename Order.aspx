<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Order | Electrify-Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<% if (string.IsNullOrEmpty(Session["ID"] as string))
   { 
       Response.Write("<script>alert('Please Login To See Your Orders'); window.location='CustomerLogin.aspx'; </script>"); 
   }   
   else
   {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
       con.Open();
       String query = "select * from CusOrder where CusID = " +Session["ID"].ToString() + " ";
       SqlCommand cmd = new SqlCommand(query, con);
       SqlDataReader reader = cmd.ExecuteReader();
       if (reader.HasRows)
       {
           while (reader.Read())
           {
               SqlConnection conProduct = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
               conProduct.Open();
               String queryProduct = "select * from Product where ID="+reader["ProID"].ToString();
               SqlCommand cmdProduct = new SqlCommand(queryProduct, conProduct);
               SqlDataReader readerPrdouct = cmdProduct.ExecuteReader();
               if (readerPrdouct.HasRows)
               {
                   while (readerPrdouct.Read())
                   {
                       Response.Write(readerPrdouct["Product_img"].ToString());
                       //String[] imgArr = readerPrdouct["Product_img"].ToString().Split("|");
                   
                       %>
                   
                   <div style="margin:50px;">
                    <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                    <table class="timetable_sub">
                    <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></tr>
                    <tr>
                        <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product.<% Response.Write(imgArr[0]); %>" style="width:50%;"/></a></div></td>
                        
                        <td style="width:200px;"><b><% Response.Write(readerPrdouct["Name"].ToString()); %></b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                        
                        <td style="width:100px;"><b>$<% Response.Write(reader["Price"].ToString()); %></b></td>
                        
                        <td>Deleverd on 1 april, 2018 
                            <span><% Response.Write(reader["Message"].ToString()); %></span><br /><span><b>Status : </b><% Response.Write(reader["Status"].ToString()); %></span></td>
                        <td style="width:100px;"><b><a href="TrackOrder.aspx"><img src="images/product images/Business_E-commerce__Logistics_56-512.png" width=100%/><br />Track Order</a></b></td>
                        <td style="width:100px;"><b><a href="CancleOrder.aspx"><img src="images/product images/Business_E-commerce__Logistics_55-512.png" width=100%/><br />Cancle Order</a></b></td>
                        
                    </tr>
                    </table>
                    </div>
                    </div>
                   
                   <%}
               }
               readerPrdouct.Close();
                conProduct.Close();
           }  
       }
       %>
   
    
   
   <%}%>


<!--
<div style="margin:50px;">
<div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
<table class="timetable_sub">
    <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></tr>
    <tr>
        <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product images/p3.jpeg" style="width:50%;"/></a></div></td>
        
        <td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
        
        <td style="width:100px;"><b>$12364</b></td>
        
        <td>Deleverd on 1 april, 2018 
            <span>your item has bin deleviers</span></td>
        <td style="width:100px;"><b><a href="TrackOrder.aspx"><img src="images/product images/Business_E-commerce__Logistics_56-512.png" width=100%/><br />Track Order</a></b></td>
        <td style="width:100px;"><b><a href="CancleOrder.aspx"><img src="images/product images/Business_E-commerce__Logistics_55-512.png" width=100%/><br />Cancle Order</a></b></td>
        
    </tr>
</table>
</div>
</div>

-->


</asp:Content>

