<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Cart | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<!-- checkout page -->
<%
    SqlConnection con = null;
    String query = String.Empty;
    SqlDataReader reader = null;
    if (Session["ID"] == null)
    {
        Response.Write("<script>alert('Please Login To View Your Cart Cart'); window.location = \"LoginCustomer.aspx\";</script>");
    }
    else
    {
        query = "select * from Customer_Cart where CusID=" + Session["ID"].ToString();
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        reader = cmd.ExecuteReader(); 
     %>
	<div class="privacy py-sm-5 py-4">
		<div class="container py-xl-4 py-lg-2">
			<!-- tittle heading -->
			<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">
				<span>C</span>art
			</h3>
			<!-- //tittle heading -->
			<h4 class="mb-sm-4 mb-3">Your shopping cart contains:
                    <span id="TotalProduct"><% Response.Write(0); %> Products</span>
                </h4>
            <div class="checkout-right"> 
                           
				<div class="table-responsive">
					<table class="timetable_sub">
						<thead>
							<tr>
								<th>SL No.</th>
								<th>Product</th>
								<th>Quality</th>
								<th>Product Name</th>
								<th>Price</th>
								<th>Total</th>
								<th>Remove</th>
							</tr>
						</thead>
						<tbody>
					<%
    int i = 0;
    if (reader.HasRows)
    {
        i = 1;
        while (reader.Read())
        {
            SqlConnection conProduct = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            conProduct.Open();
            String query1 = "select * from Product where ID=" + reader["ProductID"].ToString();
            SqlCommand cmdProduct = new SqlCommand(query1, conProduct);
            SqlDataReader readerProduct = cmdProduct.ExecuteReader();
            if (readerProduct.HasRows)
            {
                while (readerProduct.Read())
                {
                    String[] imgArr = readerProduct["Product_img"].ToString().Split('|');
                    double Price = Convert.ToDouble(readerProduct["Price"].ToString());
                    double qty = Convert.ToDouble(reader["Qty"].ToString());
                    double Total = Price * qty;
                                        
                            %>
                                                <tr class="rem1">
							                    <td class="invert"><% Response.Write(i.ToString()); %></td>
							                    <td class="invert-image">
								                    <a href="single.html">
									                    <img src="images/products/<% Response.Write(imgArr[0]); %>" alt=" " class="img-responsive">
								                    </a>
							                    </td>
							                    <td class="invert">
								                    <div class="quantity">
									                    <div class="quantity-select">
										                    <div class="entry value-minus">&nbsp;</div>
										                    <div class="entry value">
											                    <span><% Response.Write(reader["Qty"].ToString()); %></span>
										                    </div>
										                    <div class="entry value-plus active">&nbsp;</div>
									                    </div>
								                    </div>
							                    </td>
							                    <td class="invert"><% Response.Write(readerProduct["Name"].ToString()); %></td>
							                    <td class="invert"><% Response.Write(readerProduct["Price"].ToString()); %></td>
							                    <td class="invert"><% Response.Write(Total); %></td>
							                    <td class="invert">
								                    <div class="rem">
									                    <div class="close1"> </div>
								                    </div>
							                    </td>
						                </tr>
                            <%
    }
            }
            i++;
        }
    }			    
		
				     %>
						    
							
						</tbody>
					</table>
				</div>
			</div>
			
			
		</div>
	</div>
	<script type="text/javascript">
	    var totalProduct = document.getElementById('TotalProduct');
	    totalProduct.innerHTML = <% Response.Write(i-1); %>+" Products";
	</script>
	
	<!-- //checkout page -->
	
	<!-- js-files -->
	<!-- jquery -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- //jquery -->

	<!-- nav smooth scroll -->
	<script>
		$(document).ready(function () {
			$(".dropdown").hover(
				function () {
					$('.dropdown-menu', this).stop(true, true).slideDown("fast");
					$(this).toggleClass('open');
				},
				function () {
					$('.dropdown-menu', this).stop(true, true).slideUp("fast");
					$(this).toggleClass('open');
				}
			);
		});
	</script>
	<!-- //nav smooth scroll -->

	<!-- popup modal (for location)-->
	<script src="js/jquery.magnific-popup.js"></script>
	<script>
		$(document).ready(function () {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});

		});
	</script>
	<!-- //popup modal (for location)-->

	<!-- cart-js -->
	<script src="js/minicart.js"></script>
	<script>
		paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

		paypals.minicarts.cart.on('checkout', function (evt) {
			var items = this.items(),
				len = items.length,
				total = 0,
				i;

			// Count the number of each item in the cart
			for (i = 0; i < len; i++) {
				total += items[i].get('quantity');
			}

			if (total < 3) {
				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
				evt.preventDefault();
			}
		});
	</script>
	<!-- //cart-js -->

	<!-- password-script -->
	<script>
		window.onload = function () {
			document.getElementById("password1").onchange = validatePassword;
			document.getElementById("password2").onchange = validatePassword;
		}

		function validatePassword() {
			var pass2 = document.getElementById("password2").value;
			var pass1 = document.getElementById("password1").value;
			if (pass1 != pass2)
				document.getElementById("password2").setCustomValidity("Passwords Don't Match");
			else
				document.getElementById("password2").setCustomValidity('');
			//empty string means no validation error
		}
	</script>
	<!-- //password-script -->

	<!-- quantity -->
	<script type="text/javascript">             //Default.aspx
        function DeleteKartItems() {     
         $.ajax({
         type: "POST",
         url: 'Cart.aspx/DeleteCartProduct',
         data: "",
         contentType: "application/json; charset=utf-8",
         dataType: "json",
         success: function (msg) {
             $("#divResult").html("success");
         },
         error: function (e) {
             $("#divResult").html("Something Wrong.");
         }
        });
     }
</script>
	<script>
		$('.value-plus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) + 1;
			divUpd.text(newVal);
		});

		$('.value-minus').on('click', function () {
			var divUpd = $(this).parent().find('.value'),
				newVal = parseInt(divUpd.text(), 10) - 1;
			if (newVal >= 1) divUpd.text(newVal);
		});
	</script>
	<!--quantity-->
	<script>
		$(document).ready(function (c) {
			$('.close1').on('click', function (c) {
				$('.rem1').fadeOut('slow', function (c) {
					$('.rem1').remove();
					DeleteKartItems();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close2').on('click', function (c) {
				$('.rem2').fadeOut('slow', function (c) {
					$('.rem2').remove();
					DeleteKartItems();
				});
			});
		});
	</script>
	<script>
		$(document).ready(function (c) {
			$('.close3').on('click', function (c) {
				$('.rem3').fadeOut('slow', function (c) {
					$('.rem3').remove();
				});
			});
		});
	</script>
	<!-- //quantity -->

	<!-- smoothscroll -->
	<script src="js/SmoothScroll.min.js"></script>
	<!-- //smoothscroll -->

	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();

				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->

	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->

	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<!-- //js-files -->
	<% } %>
</asp:Content>




