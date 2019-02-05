<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="SingleProduct.aspx.cs" Inherits="SingleProduct" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Product Name | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<style>
.img-fluid1 {
  max-width: 100%;
  height: auto;
}

.img-thumbnail1 {
  padding: 0.25rem;
  background-color: #000000;
  border: 1px solid #dee2e6;
  border-radius: 0.25rem;
  max-width: 100%;
  height: auto;
}
</style>
<%
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    String query = "select * from Product where id="+Request.Params["ID"].ToString();
    //String query = "select * from Product where id=1";
    con.Open();
    SqlCommand cmd = new SqlCommand(query,con);
    SqlDataReader reader = cmd.ExecuteReader();
    String ProductID;
    String Name,Price, MRP, Description, WarrentyYear, Type, ProductIMG;
    ProductID = Name = Price = MRP = Description = WarrentyYear = Type = ProductIMG = String.Empty;
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
            ProductIMG = reader["Product_img"].ToString();
        }
    }
    String[] typeArr = Type.Split(null);
    String[] arrDescription = Description.Split(Environment.NewLine.ToCharArray());
    String[] imgArr = ProductIMG.Split('|');
%>


<div class="banner-bootom-w3-agileits py-5">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
			    <%
                    for (int i = 0; i < typeArr.Length; i++)
                    {
                        String tempStr = typeArr[i];
                        for (int x = 0; x < tempStr.Length; x++)
                        {
                            if (x == 0)
                                Response.Write("<span>" + tempStr[x] + "</span>");
                            else
                                Response.Write(tempStr[x]);
                        }
                        Response.Write(" ");
                    }        
			    %>
				</h3>
			<!-- //tittle heading -->
			<div class="row">
				<div class="col-lg-5 col-md-8 single-right-left ">
					<div class="grid images_3_of_2">
						<div class="flexslider">
							<ul class="slides">
							    <%
                                    for (int i = 0; i < imgArr.Length; i++)
                                    {
                                        String imgLoc = "images/products/" + imgArr[i];
                                    %>
                                        <li data-thumb=<% Response.Write("'"+imgLoc+"'"); %> align=center>
									    <div class="thumb-image" >
										<img src=<% Response.Write("'"+imgLoc+"'"); %> data-imagezoom="true" class="img-fluid" alt="" style="height:500px;"> </div>
								        </li>
                                    <%}			        
							    %>
								
							</ul>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>

				<div class="col-lg-7 single-right-left simpleCart_shelfItem">
					<h3 class="mb-3"><% Response.Write(Name); %></h3>
					<p class="mb-3">
						<span class="item_price">$<% Response.Write(Price); %></span>
						<del class="mx-2 font-weight-light">$<% Response.Write(MRP); %></del>
						<label>Free delivery</label>
					</p>
					<div class="single-infoagile">
						<ul>
							<li class="mb-3">
								Fast Delivery Avaliable For Gujarat
							</li>
							<li class="mb-3">
								Out Of Gujarat Delivery Depends Upon Courir Company
							</li>
						</ul>
					</div>
					<div class="product-single-w3l">
						<p class="my-3">
							<i class="far fa-hand-point-right mr-2"></i>
							<label>1 Year</label>Manufacturer Warranty</p>
						<ul>
							<li class="mb-1">
								3 GB RAM | 16 GB ROM | Expandable Upto 256 GB
							</li>
							<li class="mb-1">
								5.5 inch Full HD Display
							</li>
							<li class="mb-1">
								13MP Rear Camera | 8MP Front Camera
							</li>
							<li class="mb-1">
								3300 mAh Battery
							</li>
							<li class="mb-1">
								Exynos 7870 Octa Core 1.6GHz Processor
							</li>
						</ul>
						<p class="my-sm-4 my-3">
							<i class="fas fa-retweet mr-3"></i>Cash On Delivery | Electrify Cash
						</p>
					</div>
					<% if (Session["ID"] != null)
        { %>
					<div class="occasion-cart">
						<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
						    <form method="post">
						       Quntity : <input type="number" min="1" max="10" value="1" name="quntity" style="width:40px;" />						        
								<input type="hidden" name="item_name" value="Samsung Galaxy J7 Prime" />
								<input type="hidden" name="amount" value="200.00" />
								<input type="hidden" name="productID" value="<% Response.Write(ProductID); %>" />
								<input type="hidden" name="customerID" value="<% Response.Write(CustomerID); %>" />
								<input type="submit" name="submit" value="Add to cart" class="button" style="margin-top:10px;" />
						    </form>
						</div>
					</div>
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
	<!-- //Single Page -->

</asp:Content>

