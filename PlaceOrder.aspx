<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<% SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
   double cartTotal = 0;
   double cashAvaliable = 0;
   if (Session["ID"] == null)
   {
       Response.Write("<script>alert('Please Login To View Your Cart Cart'); window.location = \"LoginCustomer.aspx\";</script>");
   }
   else
   {
       String query = "select * from Customer_Cart where CusID=" + Session["ID"].ToString();
       con.Open();
       SqlCommand cmd = new SqlCommand(query, con);
       SqlDataReader reader = cmd.ExecuteReader(); 
    
    if (reader.HasRows)
    {
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
                    cartTotal += Total;                    
                } 
            }
            
        }
    }

    query = "select ElectriCash from Customers where ID="+Session["ID"].ToString();
    cmd = new SqlCommand(query,con);
    reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
        while (reader.Read())
        {
            cashAvaliable = Convert.ToInt32(reader["ElectriCash"].ToString());
        }
    }
    
    %>
<script type="text/javascript">
var check = function() {
  if (document.getElementById('Password').value ==
    document.getElementById('CPassword').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password is Matched.';
    document.getElementById("btnSubmit").disabled = false;
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password is not Matching';    
    document.getElementById("btnSubmit").disabled = true;
  }
}
function validate(evt) {
  var theEvent = evt || window.event;

  // Handle paste
  if (theEvent.type === 'paste') {
      key = event.clipboardData.getData('text/plain');
  } else {
  // Handle key press
      var key = theEvent.keyCode || theEvent.which;
      key = String.fromCharCode(key);
  }
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
}
</script>
<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:40px;">
	<span>P</span>lace
	<span>O</span>rder
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="#" method="post">
						<div class="form-group">
						    <input type="hidden" name="CusID" value="<% Response.Write(1); %>" />
							<label class="col-form-label">Your Name</label>
							<input type="text" class="form-control" name="Name" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Address</label>
							<input type="text" class="form-control" name="Address" required="">
						    
						</div>
						<div class="form-group">
							<label class="col-form-label">Pin Code</label>
							<input type="text" class="form-control" name="Pincode"  maxlength="6" onkeypress='validate(event)'  required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Mobile Number</label>
							<input type="text" maxlength="10" onkeypress='validate(event)' class="form-control" name="Mobile" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Email</label>
							<input type="email" class="form-control" name="Email" required="">
						</div>
						
						
						<div class="form-group">
							<label class="col-form-label">Pay Type</label><br />
						    <input type="radio" value="COD"  name="PayType"  checked="true" onclick="typeChangeToCashOnDel();"  /><label class="col-form-label">Cash On Dilavery</label>
						    <br />
						    <input type="radio" value="EF" name="PayType" onclick="typeChangeToElectriCash();"  /><label class="col-form-label">Electrify Cash</label>
						    <br /><span id="Message" style="color:Red; font-weight:bold;"></span>
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Place Order" />
						</div>
						<div class="right-w3l">
						    <label>Total : <% Response.Write(cartTotal); %></label><br />
						    <label>Electrify Cash Avaliable : <% Response.Write(cashAvaliable); %></label>
						</div>
					</form>
				</div>
			</div>
			
	<!-- //modal -->
<script>

function typeChangeToElectriCash(){

    var avaCash = <% Response.Write(cashAvaliable); %>;
    var total = <% Response.Write(cartTotal); %>;
    if(total > avaCash){
        document.getElementById("Message").innerHTML = "You Don't Have Enough Cash";
        document.getElementById("btnSubmit").disabled = true;
    }
    
}

function typeChangeToCashOnDel(){

        document.getElementById("Message").innerHTML = "";
    document.getElementById("btnSubmit").disabled = false;

}
</script>		<% } %>			
</asp:Content>

