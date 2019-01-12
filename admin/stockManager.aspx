<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="stockManager.aspx.cs" Inherits="admin_stockManager" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Stock Manager | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">




<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <div>
						                
						                <div>
						                    <img src="images/user.jpg"  style="margin:5px; height:100px; border-radius:50%;"/>
						                </div>
						            </div>
                                </div>                               
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">All Stock</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Add Product</a>
                                    </li>
                                    
                                </ul>
                                
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                        <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Product ID : 78</H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product images/p3.jpeg" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Mobile Phone</span></td>
                                                    
                                                    <td style="width:150px;"><b>Price :</b>$12364<br />_____________<b><br />MRP :</b>$12364</td>
                                                    
                                                    <td>3 GB RAM | 16 GB ROM | Expandable Upto 256 GB</td>
                                                    <td style="width:150px;">
                                                        <form id='myform' method='POST' action='#'>
                                                            <input type='button' value='-' class='qtyminus' field='quantity' />
                                                            <input type='text' name='quantity' value='0' class='qty' />
                                                            <input type='button' value='+' class='qtyplus' field='quantity' />
                                                            <input style="font-size:1em; margin:0; padding:0; border:0; background-color:White;" name="Submit" type="submit" value="Restock">
                                                        </form>
                                                    </td>
<script>
jQuery(document).ready(function(){
    // This button will increment the value
    $('.qtyplus').click(function(e){
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If is not undefined
        if (!isNaN(currentVal)) {
            // Increment
            $('input[name='+fieldName+']').val(currentVal + 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
    // This button will decrement the value till 0
    $(".qtyminus").click(function(e) {
        // Stop acting like a button
        e.preventDefault();
        // Get the field name
        fieldName = $(this).attr('field');
        // Get its current value
        var currentVal = parseInt($('input[name='+fieldName+']').val());
        // If it isn't undefined or its greater than 0
        if (!isNaN(currentVal) && currentVal > 0) {
            // Decrement one
            $('input[name='+fieldName+']').val(currentVal - 1);
        } else {
            // Otherwise put a 0 there
            $('input[name='+fieldName+']').val(0);
        }
    });
});

</script>
                                                    <td style="width:100px;"><b><a href="TrackOrder.aspx">Delete Product</a></b></td>
                                                    
                                                </tr>
                                            </table>
                                            </div>
                                         </div>
                                         
                                    </div>
                                    
                                    
                                    
                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
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
					<form action="#" method="post">
						<div class="form-group">
							<label class="col-form-label">Product Name</label>
							<input type="text" class="form-control" name="product_name" required="">
						</div>
						<div class="form-group">
						    <label class="col-form-label">Product Type</label>
							<select style="display: block;
  width: 100%;
  padding-top: 0.375rem;
  padding-bottom: 0.375rem;
  margin-bottom: 0;
  line-height: 1.5;
  background-color: transparent;
  border: solid 1px gray;
  ">
							<option>kidhasns</option>
							<option>bhavin</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-form-label">Product Type</label>
							<input type="text" class="form-control" name="product_type" required="">
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
							<input type="text" class="form-control" name="desc" required="">
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
							<label class="col-form-label">Product Image File Name</label>
							<input type="text" class="form-control" name="brand" required="">
						</div>
						
						<div>
						    <label class="file">
                              <input type="file" id="file" aria-label="File browser example" accept="image/*" onchange="loadFile(event)">
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
                              <input type="file" id="file1" aria-label="File browser example" accept="image/*" onchange="loadFile1(event)">
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
                              <input type="file" id="file2" aria-label="File browser example" accept="image/*" onchange="loadFile2(event)">
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
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Register" />
						</div>
						
						
						
						
					</form>
				</div>
			</div>
			
	<!-- //modal -->
									

                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
    </div>




</asp:Content>

