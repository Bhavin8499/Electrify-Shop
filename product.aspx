﻿<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Product | Electrify Shop</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<style type="text/css">
.centerBlock {
  display: block;
  margin-left: auto;
  margin-right: auto;
  min-height:100px;
  min-width:100px;
  max-width:350px;
  height:auto;
  width:auto;
  max-height:250px;
}</style>
<!-- banner -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<!-- Indicators-->
		<%
            SqlConnection conBan = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            conBan.Open();
            String queryBane = @"select * from Banners";
            SqlCommand cmdBan = new SqlCommand(queryBane, conBan);
            SqlDataReader readerBanner = cmdBan.ExecuteReader(); %>
		<ol class="carousel-indicators">

		<%   if (readerBanner.HasRows)
       {
           int i = 0;
           while (readerBanner.Read())
           {%>
     <li data-target="#carouselExampleIndicators" data-slide-to="<% Response.Write(i); %>" <% if(i==0){ Response.Write("class=\"active\"");} %>></li>
    <% i++;
           }
       }
       readerBanner.Close();
      %>
			
		</ol>
		<div class="carousel-inner">
		<%
 		    readerBanner = cmdBan.ExecuteReader();
     if (readerBanner.HasRows)
     { int i=0;
         while (readerBanner.Read())
         { String ClassName= "carousel-item item1";
             if(i==0)
            {
             ClassName = "carousel-item item1 active";
            }%>
             <div class=" <% Response.Write(ClassName); %>" style="background:url(images/Banners/<% Response.Write(readerBanner["Image"].ToString()); %>) no-repeat center ; background-size: cover;">
				<div class="container">
					<div class="w3l-space-banner">
						<div class="carousel-caption p-lg-5 p-sm-4 p-3">
							<p><% Response.Write(readerBanner["Line1"].ToString()); %></p>
							<h3 class="font-weight-bold pt-2 pb-lg-5 pb-4"><% Response.Write(readerBanner["Line1"].ToString()); %>
							</h3>
							<a class="button2" href="product.aspx?querySearch=<% Response.Write(readerBanner["Query"].ToString()); %>">Shop Now </a>
						</div>
					</div>
				</div>
			</div>		
        <% i++;
         }
     }     %>
			
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:20px;">
				<span>O</span>ur
				<span>P</span>roducts
	</h3>
	<center>
	<%
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
	    String query = String.Empty;
        if (Request.QueryString["Type"] != null || Request.QueryString["proType"] != null)
        {
            query = "Select * from Product where Type = '" + Request.QueryString["proType"] + "' order by ID desc";
        }
        else if (Request.QueryString["searchQuery"] != null)
        {
            query = "Select * from Product where Name like ('%" + Request.QueryString["searchQuery"] + "%') order by ID desc";
        }
        else if (Request.QueryString["querySearch"] != null)
        {
            query = "Select * from Product where Name like ('%" + Request.QueryString["querySearch"] + "%') OR Type like ('%" + Request.QueryString["querySearch"] + "%') order by ID desc";
        }
        else
        {
            query = "select * from Product order by ID desc";
        }
	       
        SqlCommand cmd = new SqlCommand(query,con);  
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
					
						<% String[] imgArr = reader["Product_img"].ToString().Split('|');
         Response.Write("<img class='centerBlock' src='images/products/" + imgArr[0].ToString() + "'  >"); %>
						<div class="men-cart-pro">
						<div class="inner-men-cart-pro">
				    		<a href="SingleProduct.aspx?ID=<% Response.Write(reader["ID"].ToString()); %>" class="link-product-add-cart">Quick View</a>
						</div>
						</div>
						<!--<span class="product-new-top">New</span>-->
					</div>
					<div class="item-info-product text-center border-top mt-4">
						<h4 class="pt-1">
						<a href="singleProduct.aspx"><% Response.Write(reader["Name"].ToString()); %></a>
						</h4>
						<div class="info-product-price my-2">
							<span class="item_price">$<% Response.Write(reader["Price"].ToString()); %></span>
							<del>$<% Response.Write(reader["MRP"].ToString()); %></del>
						</div>
						<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out" style="width:50%;">
							<form action="" method="post">
							<input type="hidden" name="ProID" value="<% Response.Write(reader["ID"].ToString()); %>" />
								<input type="submit" name="addToCart" value="Add to cart" class="button btn" />
							</form>
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
        else
        {
            Response.Write("No Product Found");
        }
	%>
	</center>
	<!-- //banner -->

</asp:Content>

