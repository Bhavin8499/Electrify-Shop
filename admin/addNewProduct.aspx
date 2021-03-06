﻿<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" validateRequest="false" AutoEventWireup="true" CodeFile="addNewProduct.aspx.cs" Inherits="admin_addNewProduct" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">

Add New Product | Admin

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%  if (Session["SellerID"] == null)
    {
        Response.Write("<script>alert('Please Login First To Add New Product'); window.location.href='../adminLogin.aspx';</script>");
    }
    else
    { %>
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
	<span>A</span>dd
	<span>N</span>ew
	<span>P</span>roduct
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-form-label">Product Name</label>
							<input type="text" class="form-control" name="product_name" required="">
						</div>
						<div class="form-group">
						    <label class="col-form-label">Product Type</label>
							<select name="product_type" style="display: block;
  width: 100%;
  padding-top: 0.375rem;
  padding-bottom: 0.375rem;
  margin-bottom: 0;
  line-height: 1.5;
  background-color: transparent;
  border: solid 1px gray;
  ">
							<option value="Mobile">Mobile Phone</option>
							<option value="Appliance">Appliance</option>
							<option value="Headphone">Headphone</option>
							<option value="PC">PC</option>
							<option value="Laptop">Laptop</option>
							<option value="Television">Television</option>
							<option value="Camera">Camera</option>
							<option value="Hard Drives">Hard Drives</option>
							<option value="Game Controllers">Game Controllers</option>
							<option value="Software">Software</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-form-label">Price</label>
							<input type="text" class="form-control" name="price" required="" onkeypress='validate(event)'>
						</div>
						<div class="form-group">
							<label class="col-form-label">MRP</label>
							<input type="text" class="form-control" name="mrp" required="" onkeypress='validate(event)'>
						</div>
						
						<div class="form-group">
							<label class="col-form-label">Description</label>
							<textarea name="desc" class="form-control" style="height:200px;"></textarea>
						</div>
						<div class="form-group">
							<label class="col-form-label">Keyword</label>
							<input type="text" class="form-control" name="key" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Brand Name</label>
							<input type="text" class="form-control" name="brand" required="">
						</div>
						
						<div class="form-group">
							<label class="col-form-label">Quntity : </label>
							<input type="number" min="1" class="form-control" name="qty"  required="">
						</div>
						<div>
						    <label class="file">
                              <input type="file" id="file" name="file" aria-label="File browser example" accept="image/*" onchange="loadFile(event)">
                              <span class="file-custom"></span>
                            </label>
						    <div>
						        <img id="output"  style="margin:5px; "/>
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
						
						<div>
						    <label class="file">
                              <input type="file" id="file1"  name="file1" aria-label="File browser example" accept="image/*" onchange="loadFile1(event)">
                              <span class="file-custom"></span>
                            </label>
						    <div>
						        <img id="Img1"  style="margin:5px; "/>
						    </div>
						    <script>
						    var loadFile1 = function(event)
						    {
						        var width = document.getElementById('file1').offsetWidth;
                               var output = document.getElementById('Img1');
                              output.src = URL.createObjectURL(event.target.files[0]);
                              output.width = width;
                            };
                            </script>
						</div>
						
						<div>
						    <label class="file">
                              <input type="file" id="file2" name="file2" aria-label="File browser example" accept="image/*" onchange="loadFile2(event)">
                              <span class="file-custom"></span>
                            </label>
						    <div>
						        <img id="Img2"  style="margin:5px; "/>
						    </div>
						    <script>
						    var loadFile2 = function(event)
						    {
						        var width = document.getElementById('file2').offsetWidth;
                               var output = document.getElementById('Img2');
                              output.src = URL.createObjectURL(event.target.files[0]);
                              output.width = width;
                            };
                            </script>
						</div>
						
						
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Add Product" />
						</div>
						
						
						
						
					</form>
				</div>
			</div>
			
	<!-- //modal -->
									
	<% }//Else Part End Here %>

</asp:Content>

