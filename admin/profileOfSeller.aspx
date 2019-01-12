<%@ Page Language="C#" MasterPageFile="hfNoSidebar.master" AutoEventWireup="true" CodeFile="profileOfSeller.aspx.cs" Inherits="profileOfSeller" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Profile | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%
    
    String firstClass = "";
    String secondClass = "";
    String navBarItem1 = "";
    String navBarItem2 = "";
    if (Request.QueryString["edit"] != null)
    {
        firstClass = "tab-pane fade";
        secondClass = "tab-pane fade show active";
        navBarItem1 = "nav-link";
        navBarItem2 = "nav-link active";
    }
    else
    {
        secondClass = "tab-pane fade";
        firstClass = "tab-pane fade show active";
        navBarItem2 = "nav-link";
        navBarItem1 = "nav-link active";
    }
 %>



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
                                        <a class="<% Response.Write(navBarItem1); %>" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false">Basic Info</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="<% Response.Write(navBarItem2); %>" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="true">Edit Profile</a>
                                    </li>
                                </ul>
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="<% Response.Write(firstClass); %>" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                        

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Name</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                Kishan Jinjariya
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">NickName</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                Kishan
                                            </div>
                                        </div>
                                        <hr />
                                        
                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Address</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                "Shakti Nivas", Chamunda Soc., Opp. Ranchhoddas Ashram, Kuvadava Road, Rajkot.
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Pincod</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                360003
                                            </div> 
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Email</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                kishan.speedtech@gmail.com
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Gender</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                Male
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Rating</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                4.5
                                            </div>
                                        </div>
                                        <hr />

                                    </div>
                                    <div class="<% Response.Write(secondClass); %>" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                        
                                        
                                        
                                    <div>
				                    <div class="modal-body" style="margin:30px;">
					                    <form action="#" method="post">
						                    <div class="form-group">
							                    <label class="col-form-label">Your Name</label>
							                    <input type="text" class="form-control" name="Name" required="" readonly="" value="Kishan Jinjariya">
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
                    										
                    						
                    						
						
						
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="btnEditProfile" value="Update Profile" />
						</div>
						
					</form>
				</div>
			</div>
                                        
                                        
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

