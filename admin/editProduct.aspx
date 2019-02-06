<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="editProduct.aspx.cs" Inherits="admin_editProduct" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">

Edit Product | Electrify Shop

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

<%

    String proID = Request.QueryString["proID"] != null? Request.QueryString["proID"].ToString() : "1"  ;

    String[] imgName = new String[10];
    String proName = String.Empty;
    String Type = String.Empty;
    String Price = String.Empty;
    String Mrp = String.Empty;
    String Desc = String.Empty;
    String KeyWord = String.Empty;
    String BrandName = String.Empty;
    String Qty = String.Empty;
    
    String query = "select * from Product where ID="+proID;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    con.Open();
    SqlCommand cmd = new SqlCommand(query, con);
    SqlDataReader reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {
        while (reader.Read())
        {

            imgName = reader["Product_img"].ToString().Split('|');
            proName = reader["Name"].ToString();
            Type = reader["Type"].ToString();
            Price = reader["Price"].ToString();
            Mrp = reader["MRP"].ToString();
            Desc = reader["Description"].ToString();
            KeyWord = reader["Keyword"].ToString();
            BrandName = reader["BrandName"].ToString();
            Qty = reader["Qty"].ToString();
            
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
    document.getElementById('messae').style.color = 'red';
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
	<span>E</span>dit
	<span>P</span>roduct
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-form-label">Product Name</label>
							<input type="text" class="form-control" name="product_name" value="<% Response.Write(proName); %>" required="">
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
							<option>Mobile Phone</option>
							<option>Appliance</option>
							<option>Headphone</option>
							<option>PC</option>
							<option>Laptop</option>
							<option>Television</option>
							<option>Camera</option>
							<option>Hard Drives</option>
							<option>Game Controllers</option>
							<option>Software</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-form-label">Product Type</label>
							<input type="text" class="form-control" name="product_type"  required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Price</label>
							<input type="text" class="form-control" name="price" value="<% Response.Write(Price); %>" required="" onkeypress='validate(event)'>
						</div>
						<div class="form-group">
							<label class="col-form-label">MRP</label>
							<input type="text" class="form-control" name="mrp" required="" value="<% Response.Write(Mrp); %>" onkeypress='validate(event)'>
						</div>
						
						<div class="form-group">
							<label class="col-form-label">Description</label>
							<textarea class="form-control" name="desc" style="min-height:150px;" value="<% Response.Write(Desc); %>" required=""></textarea>						</div>
						<div class="form-group">
							<label class="col-form-label">Keyword</label>
							<input type="text" class="form-control" name="key" value="<% Response.Write(KeyWord); %>" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Brand Name</label>
							<input type="text" class="form-control" name="brand" value="<% Response.Write(BrandName); %>" required="">
						</div>
						<div class="form-group">
							<label class="col-form-label">Qty :</label>
							<input type="number" class="form-control" name="qty"  min="0"  value="<% Response.Write(Qty); %>" required="">
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
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Register" />
						</div>
						
						
						
						
					</form>
				</div>
			</div>

</asp:Content>

