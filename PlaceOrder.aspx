<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
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
						    <input type="radio" value="EF" name="PayType" checked="true" /><label class="col-form-label">Electrify Cash</label>
						    <br />
						    <input type="radio" value="COD" name="PayType" /><label class="col-form-label">Cash On Dilavery</label>
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Place Order" />
						</div>
						
					</form>
				</div>
			</div>
			
	<!-- //modal -->
					
</asp:Content>

