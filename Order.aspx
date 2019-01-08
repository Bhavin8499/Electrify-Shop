<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Order | Electrify-Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<% if (!string.IsNullOrEmpty(Session["ID"] as string))
   { Response.Write("<script>alert(Please Login To See Your Orders); window.location='CustomerLogin.aspx'; </script>"); }

   else
   {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"]);
       con.Open();
       String query = "select * from Order Where CusID=" + Session["ID"].ToString() + " order by ID desc";
       SqlCommand cmd = new SqlCommand(query,con);
       SqlDataReader reader = cmd.ExecuteReader();
       if (reader.HasRows)
       {
           while (reader.Read())
           {

           }  
       }
       %>
   
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
   
   <%}%>



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




</asp:Content>

