<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="TrackOrder.aspx.cs" Inherits="TrackOrder" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Track Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">



<% if (string.IsNullOrEmpty(Session["ID"] as string))
   { 
       Response.Write("<script>alert('Please Login To See Your Orders'); window.location='LoginCustomer.aspx'; </script>"); 
   }   
   else
   {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
       con.Open();
       String query = "select * from CusOrder where ID = "+Request.QueryString["ID"].ToString() + " ";
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
                       String[] imgArr = readerPrdouct["Product_img"].ToString().Split('|');

                       String pkgTrack1 = "progtrckr-done";
                       String pkgTrack2 = "progtrckr-done";
                       String pkgTrack3 = "progtrckr-done";
                       String pkgTrack4 = "progtrckr-done";
                       String pkgTrack5 = "progtrckr-done";

                       if (reader["Status"].ToString() == "Order Processing")
                       {
                           pkgTrack1 = "progtrckr-done";
                           pkgTrack2 = "progtrckr-todo";
                           pkgTrack3 = "progtrckr-todo";
                           pkgTrack4 = "progtrckr-todo";
                           pkgTrack5 = "progtrckr-todo";
                       }
                       else if (reader["Status"].ToString() == "Pre-Production")
                       {
                           pkgTrack1 = "progtrckr-done";
                           pkgTrack2 = "progtrckr-done";
                           pkgTrack3 = "progtrckr-todo";
                           pkgTrack4 = "progtrckr-todo";
                           pkgTrack5 = "progtrckr-todo";
                       }
                       else if (reader["Status"].ToString() == "In Production")
                       {
                           pkgTrack1 = "progtrckr-done";
                           pkgTrack2 = "progtrckr-done";
                           pkgTrack3 = "progtrckr-done";
                           pkgTrack4 = "progtrckr-todo";
                           pkgTrack5 = "progtrckr-todo";
                       }
                       else if (reader["Status"].ToString() == "Shipped")
                       {
                           pkgTrack1 = "progtrckr-done";
                           pkgTrack2 = "progtrckr-done";
                           pkgTrack3 = "progtrckr-done";
                           pkgTrack4 = "progtrckr-done";
                           pkgTrack5 = "progtrckr-todo";
                       }
                       else if (reader["Status"].ToString() == "Delivered")
                       {
                           pkgTrack1 = "progtrckr-done";
                           pkgTrack2 = "progtrckr-done";
                           pkgTrack3 = "progtrckr-done";
                           pkgTrack4 = "progtrckr-done";
                           pkgTrack5 = "progtrckr-done";
                       }
                       
                    %>
                   
                   <div style="margin:50px;">
                    <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                    <table class="timetable_sub">
                        <tr><td style="width:95%;" align=center colspan=2><ol class="progtrckr" data-progtrckr-steps="5" style="margin:20px;">
                        <li class="<% Response.Write(pkgTrack1); %>">Order Processing</li><!--
                     --><li class="<% Response.Write(pkgTrack2); %>">Pre-Production</li><!--
                     --><li class="<% Response.Write(pkgTrack3); %>">In Production</li><!--
                     --><li class="<% Response.Write(pkgTrack4); %>">Shipped</li><!--
                     --><li class="<% Response.Write(pkgTrack5); %>">Delivered</li>
                    </ol></td></tr>
                        <tr style="border-bottom:1px;"><td colspan=2><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : <% Response.Write(reader["ID"].ToString()); %></H5></td></tr>
                        <tr>
                        
                        
                            <td align=center colspan=2><div style="margin:10px;" align=center><a href="#"><img src="images/products/<% Response.Write(imgArr[0]); %>" style="width:30%;"/></a></div></td>
                            
                            <tr><td><h2>Product Name :</h2> </td><td style="width:200px;"><b><% Response.Write(readerPrdouct["Name"].ToString()); %></b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td></tr>
                            
                            <tr><td><h2>Price :</h2></td><td style="width:100px;"><b>$<% Response.Write(readerPrdouct["Price"].ToString()); %></b></td></tr>
                            
                            <tr><td><h2>Delivary Notes :</h2> </td><td><% Response.Write(reader["Message"].ToString()); %></td></tr>
                            
                            <tr><td><h2>Status :</h2> </td><td><% Response.Write(reader["Status"].ToString()); %></td></tr>
                            
                            <tr><td style="width:100px;" colspan=2><b><a href="CancelOrder.aspx?ID=<% Response.Write(reader["ID"].ToString()); %>"><img src="images/product images/Business_E-commerce__Logistics_55-512.png" width=10%/><br />Cancle Order</a></b></td></tr>
                            
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
    <tr><td style="width:95%;" align=center colspan=2><ol class="progtrckr" data-progtrckr-steps="5" style="margin:20px;">
    <li class="progtrckr-done">Order Processing</li><!--
    <li class="progtrckr-done">Pre-Production</li><!--
    <li class="progtrckr-done">In Production</li><!--
    <li class="progtrckr-done">Shipped</li><!--
    <li class="progtrckr-todo">Delivered</li>
</ol></td></tr>
    <tr style="border-bottom:1px;"><td colspan=2><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></td></tr>
    <tr>
        <td align=center colspan=2><div style="margin:10px;" align=center><a href="#"><img src="images/product images/p3.jpeg" style="width:30%;"/></a></div></td>
        
        <tr><td><h2>Product Name :</h2> </td><td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td></tr>
        
        <tr><td><h2>Price :</h2></td><td style="width:100px;"><b>$12364</b></td></tr>
        
        <tr><td><h2>Delivary Notes :</h2> </td><td>Deleverd on 1 april, 2018 
            <span>your item has bin deleviers</span></td></tr>
        
        <tr><td style="width:100px;" colspan=2><b><a href="CancleOrder.aspx"><img src="images/product images/Business_E-commerce__Logistics_55-512.png" width=10%/><br />Cancle Order</a></b></td></tr>
        
    </tr>
</table>
</div>
</div>
-->

</asp:Content>

