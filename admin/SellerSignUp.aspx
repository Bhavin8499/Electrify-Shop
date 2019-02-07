<%@ Page Language="C#" MasterPageFile="../hfNoSidebar.master" AutoEventWireup="true" CodeFile="SellerSignUp.aspx.cs" Inherits="CustomerSignUp" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Customer Sign Up | Electrify Shop
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
	<span>S</span>eller
	<span>S</span>ign
	<span>U</span>p
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="#" method="post">
						<div class="form-group">
							<label class="col-form-label">Your Name</label>
							<input type="text" class="form-control" name="Name" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Your Nickname</label>
							<input type="text" class="form-control" name="Nickname" required="">
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
							<label class="col-form-label">Gender</label><br />
						    <input type="radio" value="Male" name="Gender" checked="true" /><label class="col-form-label">Male</label>
						    <input type="radio" value="Female" name="Gender" /><label class="col-form-label">Female</label>
						</div>		
						<div>
						                <label class="file">
                                          <input type="file" id="file" aria-label="File browser example" accept="image/*" onchange="loadFile(event)">
                                          <span class="file-custom"></span>
                                        </label>
						                <div>
						                    <img id="output"  style="margin:5px; height:300px; border-radius:50%;"/>
						                </div>
						                    <script>
						                    var loadFile = function(event)
						                    {
						                        var width = document.getElementById('file').offsetWidth;
                                               var output = document.getElementById('output');
                                              output.src = URL.createObjectURL(event.target.files[0]);
                                              output.width = width;
                                            };
                                            </script>
						            </div>
										
						<div class="form-group">
							<label class="col-form-label">Password</label>
							<input type="password" class="form-control" name="Password" onkeyup="check();" id="Password" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Confirm Password</label>
							<input type="password" class="form-control" name="CPassword" id="CPassword" onkeyup="check();" required="">
							<span id='message'></span>
						</div>
						
						
						
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Register" />
						</div>
						<div class="sub-w3l">
								<input type="checkbox" required="true">
								<label >I Accept to the Terms & Conditions</label>
						</div>
					</form>
				</div>
			</div>
			
	<!-- //modal -->
									
	

</asp:Content>

