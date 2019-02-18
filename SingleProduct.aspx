<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="SingleProduct.aspx.cs" Inherits="SingleProduct" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadTagContentPlaceHolder" Runat="Server">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="styles/product_styles.css">
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css">

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Product Name | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">


 
<%
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    String query = "select * from Product where id="+Request.Params["ID"].ToString();
    //String query = "select * from Product where id=1";
    con.Open();
    SqlCommand cmd = new SqlCommand(query,con);
    SqlDataReader reader = cmd.ExecuteReader();
    String ProductID;
    String Name,Price, MRP, Description, WarrentyYear, Type, ProductIMG, qty;
    ProductID = Name = Price = MRP = Description = WarrentyYear = Type = ProductIMG = qty = String.Empty;
    String CustomerID = String.Empty;
    if (!string.IsNullOrEmpty(Session["ID"] as string))
    {
        CustomerID = Session["ID"].ToString();
    }
    if (reader.HasRows)
    {
        while(reader.Read()){
            ProductID = reader["ID"].ToString();
            Name = reader["Name"].ToString();
            Price = reader["Price"].ToString();
            MRP = reader["MRP"].ToString();
            Description = reader["Description"].ToString();
           // WarrentyYear = reader["Name"].ToString();
            Type = reader["Type"].ToString();
            qty = reader["Qty"].ToString();
            ProductIMG = reader["Product_img"].ToString();
        }
    }
    String[] typeArr = Type.Split(null);
    String[] arrDescription = Description.Split(Environment.NewLine.ToCharArray());
    String[] imgArr = ProductIMG.Split('|');
   
%>
<!--
<div class="super_container">
<div class="single_product">
		<div class="container">
			<div class="row">

				<!-- Images 
				<div class="col-lg-2 order-lg-1 order-2">
					<ul class="image_list">
					<% for (int i = 0; i < imgArr.Length; i++)
        {%>
            <li data-image="images/products/<% Response.Write(imgArr[i]); %>"><img src="images/products/<% Response.Write(imgArr[i]); %>" alt="" /></li>
        <%} %>
						
					</ul>
				</div>

				<div class="col-lg-5 order-lg-2 order-1">
					<div class="image_selected"><img src="images/products/<% Response.Write(imgArr[0]); %>" alt=""></div>
				</div>

				<div class="col-lg-5 order-3">
					<div class="product_description">
						<div class="product_category">Laptops</div>
						<div class="product_name">MacBook Air 13</div>
						<div class="rating_r rating_r_4 product_rating"><i></i><i></i><i></i><i></i><i></i></div>
						<div class="product_text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas fermentum. laoreet turpis, nec sollicitudin dolor cursus at. Maecenas aliquet, dolor a faucibus efficitur, nisi tellus cursus urna, eget dictum lacus turpis.</p></div>
						<div class="order_info d-flex flex-row">
							<form action="#">
								<div class="clearfix" style="z-index: 1000;">

									<div class="product_quantity clearfix">
										<input id="quantity_input" type="number" style="width:100%;" min="1"  value="1" />
										
									</div>

									

								</div>

								<div class="product_price">$2000</div>
								<div class="button_container">
									<button type="button" class="button cart_button">Add to Cart</button>
									<div class="product_fav"><i class="fas fa-heart"></i></div>
								</div>
								
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>-->
<script>
function imgChangeClick(event){

    var x = event;
    var dest = document.getElementById("mainImage");
    dest.src = event.getAttribute("src");
}
function qtyValueChanged(caller){

    var txtBox = caller;
    var val1 = txtBox.value;
    var val2 = document.getElementById("singlePrice").innerHTML;
    var total = val1 * val2;
    document.getElementById("TotalPrice").innerHTML = total;
}
</script>
	<div class="single_product">
		<div class="container">
			<div class="row">

				<!-- Images -->
				<div class="col-lg-2 order-lg-1 order-2">
					<ul class="image_list">
					<% for (int i = 0; i < imgArr.Length; i++)
        {%>
            <li data-image="images/products/<% Response.Write(imgArr[i]); %>"><img  style="max-height:100%; max-width:100%;"   onclick="imgChangeClick(this)" src="images/products/<% Response.Write(imgArr[i]); %>" alt=""></li>
						
        <%} %>
						</ul>
				</div>

				<!-- Selected Image -->
				<div class="col-lg-5 order-lg-2 order-1">
					<div class="image_selected"><img id="mainImage" style="max-height:100%; max-width:100%;" src="images/products/<% Response.Write(imgArr[0]); %>" alt=""></div>
				</div>

				<!-- Description -->
				<div class="col-lg-5 order-3">
					<div class="product_description">
						<div class="product_category"><% Response.Write(Type); %></div>
						<div class="product_name"><% Response.Write(Name); %></div>
						<div class="product_text"><p><% Response.Write(Description); %></p></div>
						<div class="order_info d-flex flex-row">
							<form action="" method="post">
								<div class="clearfix" style="z-index: 1000;">

									<!-- Product Quantity --><% if (Session["ID"] != null)
        { %>
									<div class="product_quantity clearfix" style="border-color:Gray; color:Gray;">
										<input  id="" type="number" min="1" onmouseup="qtyValueChanged(this);" style="width:100%; color:Black; " pattern="[0-9]*" max="<% Response.Write(qty); %>" value="1" name="quntity">
										<input type="hidden" name="item_name" value="<% Response.Write(Name); %>" />
								
								<input type="hidden" name="productID" value="<% Response.Write(ProductID); %>" />
								<input type="hidden" name="customerID" value="<% Response.Write(CustomerID); %>" />
									</div>
								</div>

								<div class="product_price">$<label id="singlePrice"><%Response.Write(Price); %></label></div>
								<div class="product_category">Total : $<label id="TotalPrice"><%Response.Write(Price); %></label></div>
								<div class="button_container">
									<input  type="submit" name="submit" class="button cart_button" value="Add to Cart">
								</div>
								
							</form>
							<%}
        else
        { %>
        <div class="product-single-w3l">
						<p class="my-3">Please Login First To Add Product Into Cart <a href="LoginCustomer.aspx">Login Here</a></p>
						</div>
        
					<%} %>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/greensock/TweenMax.min.js"></script>
<script src="plugins/greensock/TimelineMax.min.js"></script>
<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="plugins/greensock/animation.gsap.min.js"></script>
<script src="plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/product_custom.js"></script>
</asp:Content>

