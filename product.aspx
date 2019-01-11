<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
 | Electrify Shop</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

<!-- banner -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<!-- Indicators-->
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item item1 active">
				<div class="container">
					<div class="w3l-space-banner">
						<div class="carousel-caption p-lg-5 p-sm-4 p-3">
							<p>Get flat
								<span>10%</span> Cashback</p>
							<h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">The
								<span>Big</span>
								Sale
							</h3>
							<a class="button2" href="product.html">Shop Now </a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item item2">
				<div class="container">
					<div class="w3l-space-banner">
						<div class="carousel-caption p-lg-5 p-sm-4 p-3">
							<p>advanced
								<span>Wireless</span> earbuds</p>
							<h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">Best
								<span>Headphone</span>
							</h3>
							<a class="button2" href="product.html">Shop Now </a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item item3">
				<div class="container">
					<div class="w3l-space-banner">
						<div class="carousel-caption p-lg-5 p-sm-4 p-3">
							<p>Get flat
								<span>10%</span> Cashback</p>
							<h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">New
								<span>Standard</span>
							</h3>
							<a class="button2" href="product.html">Shop Now </a>
						</div>
					</div>
				</div>
			</div>
			<div class="carousel-item item4">
				<div class="container">
					<div class="w3l-space-banner">
						<div class="carousel-caption p-lg-5 p-sm-4 p-3">
							<p>Get Now
								<span>40%</span> Discount</p>
							<h3 class="font-weight-bold pt-2 pb-lg-5 pb-4">Today
								<span>Discount</span>
							</h3>
							<a class="button2" href="product.html">Shop Now </a>
						</div>
					</div>
				</div>
			</div>
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
				<span>N</span>ew
				<span>P</span>roducts
	</h3>
	<center>
	<%
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Users\speed-\Documents\Electrify-Shop.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        con.Open();
	    String query = String.Empty;
        if (Request.QueryString["Type"] != null)
        {
            query = "Select top 9 * from Product where Type = '" + Request.QueryString["Type"]+"'";
        }
        else
        {
            query = "select top 9 * from Product";
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
         Response.Write("<img src='images/product images/" + imgArr[0].ToString() + "' style='height:250px; width:auto;' alt=''>"); %>
						<div class="men-cart-pro">
						<div class="inner-men-cart-pro">
				    		<a href="SingleProduct.aspx?ID=<% Response.Write(reader["ID"].ToString()); %>" class="link-product-add-cart">Quick View</a>
						</div>
						</div>
						<span class="product-new-top">New</span>
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
							<form action="#" method="post">
							<fieldset>
								<input type="hidden" name="cmd" value="_cart" />
								<input type="hidden" name="add" value="1" />
								<input type="hidden" name="business" value=" " />
								<input type="hidden" name="item_name" value="OPPO A37f" />
								<input type="hidden" name="amount" value="230.00" />
								<input type="hidden" name="discount_amount" value="1.00" />
								<input type="hidden" name="currency_code" value="USD" />
								<input type="hidden" name="return" value=" " />
    							<input type="hidden" name="cancel_return" value=" " />
								<input type="submit" name="submit" value="Add to cart" class="button btn" />
							</fieldset>
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
	    
	%>
	</center>
	<!-- //banner -->

</asp:Content>

