<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Admin | Index
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

<!-- banner -->
	
<%if (string.IsNullOrEmpty(Session["SellerID"] as string))
  {
      Response.Write("<script> alert('Please Login To Get Your Details'); window.location = '../adminLogin.aspx'; </script>");
  }
  else
  {
 %>	
		
	<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:20px;">
				<span>Y</span>our
				<span>R</span>ecent
				<span>P</span>roducts
	</h3>
	<center>
	<%
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString);
    con.Open();
    String query = "select * from Product Where SellerID = " + Session["SellerID"].ToString()+" order by ID desc";
    SqlCommand cmd = new SqlCommand(query, con);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
        //Products
        int LoopCounter = 1;
        while (reader.Read())
        {
            if (LoopCounter == 1)
            {%>
                    <div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4" style="width:98%">
					<div class="row">
					<div class="col-md-4 product-men">
                <%}
            else
            {%>
                    <div class="col-md-4 product-men mt-md-0 mt-5">
               <% }
                %>
                <div class="men-pro-item simpleCart_shelfItem">
					<div class="men-thumb-item text-center" >
					<div style="height:250px; width:auto;">
						<% String[] imgArr = reader["Product_img"].ToString().Split('|');
         Response.Write("<img src='../images/products/" + imgArr[0] + "' style='height:auto; max-height:90%; width:auto; max-width: 90%;' alt=''>"); %>
						</div><div class="men-cart-pro">
						<div class="inner-men-cart-pro">
				    		<a href="editProduct.aspx?proID=<% Response.Write(reader["ID"].ToString()); %>" class="link-product-add-cart">Quick Edit</a>
						</div>
						</div>
					</div>
					<div class="item-info-product text-center border-top mt-4">
						<h4 class="pt-1">
						<% Response.Write(reader["Name"].ToString()); %>
						</h4>
						<div class="info-product-price my-2">
							<span class="item_price">$<% Response.Write(reader["Price"].ToString()); %></span>
							<del>$<% Response.Write(reader["MRP"].ToString()); %></del>
						</div>
						<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out" style="width:50%;">
						<a href="editProduct.aspx?proID=<% Response.Write(reader["ID"].ToString()); %>"><input type="button" name="submit" value="Edit Product" class="button btn" /></a>
							
						</div>
					</div>
				</div>
			</div>
        <%
    LoopCounter++;
    if (LoopCounter == 4)
    {%>
                </div>
                </div>
               
            <%
    LoopCounter = 1;
    }
        }
        if (LoopCounter != 4)
        {%>
              </div>
              </div>  
            <%}
    }   
	    
	%>
	</center>
	<!-- //banner -->
<% } %>
</asp:Content>

