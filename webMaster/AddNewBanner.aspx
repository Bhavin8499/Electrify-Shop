<%@ Page Language="C#" ValidateRequest="false" MasterPageFile="~/webMaster/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AddNewBanner.aspx.cs" Inherits="webMaster_AddNewBanner" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<% if (Session["WebID"] == null)
   {
       Response.Write("<script>alert('Please Login First To Add New Banner'); window.location='../webLogin.aspx';</script>");
   }
   else
   { %>
    <div>
		<div>
			<div style="margin:30px;">
				<div>
					<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:40px;">
					<span>A</span>dd
                    <span>N</span>ew
                    <span>B</span>Banner
				</div>
				<div>
				                    <div class="modal-body" style="margin:30px;">
					                    <form action="#" method="post" enctype="multipart/form-data">
						                    <div class="form-group">
							                    <label class="col-form-label">First Line</label>
							                    <input type="text" class="form-control" name="Line1" required="">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Second Line</label>
							                    <input type="text" class="form-control" name="Line2" required="">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Search Query</label>
							                    <input type="text" class="form-control" name="Query" required="">
                    						    
						                    </div>
						                    <div>
						                                    <label class="file">
                                                              <input type="file" class="form-control" id="file" name="file" aria-label="File browser example" accept="image/*" onchange="loadFile(event)">
                                                              <span class="file-custom"></span>
                                                            </label>
						                                    <div>
						                                        <img id="output"  style="margin:5px; object-fit: contain; border-radius:10%;"/>
						                                    </div>
						                                        <script>
						                                        var loadFile = function(event)
						                                        {
						                                            var width = document.getElementById('file').offsetWidth;
                                                                   var output = document.getElementById('output');
                                                                  output.src = URL.createObjectURL(event.target.files[0]);
                                                                  output.width = width;
                                                                  output.height = 300;
                                                                  
                                                                };
                                                                </script>
						                                </div>
                    										
                    						
                    						
						
						
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="btnAddBanner" value="Add New Banner" />
						</div>
						
					</form>
				</div>
			</div>
</div>
</div>
</div>
<% } // Else Part End here %>

</asp:Content>

