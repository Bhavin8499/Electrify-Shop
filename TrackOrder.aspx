<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="TrackOrder.aspx.cs" Inherits="TrackOrder" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Track Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">









<div style="margin:50px;">
<div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
<table class="timetable_sub">
    <tr><td style="width:95%;" align=center colspan=2><ol class="progtrckr" data-progtrckr-steps="5" style="margin:20px;">
    <li class="progtrckr-done">Order Processing</li><!--
 --><li class="progtrckr-done">Pre-Production</li><!--
 --><li class="progtrckr-done">In Production</li><!--
 --><li class="progtrckr-done">Shipped</li><!--
 --><li class="progtrckr-todo">Delivered</li>
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


</asp:Content>

