<%@ Page Language="C#" MasterPageFile="hfNoSidebar.master" AutoEventWireup="true" CodeFile="profileOfSeller.aspx.cs" Inherits="profileOfSeller" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Profile | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%
    if (Session["SellerID"] == null)
    {
        Response.Write("<script>alert('Please Login First To Edit Product'); window.location.href='../adminLogin.aspx';</script>");
    }
    else
    {
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


        if (Session["SellerID"] == null)
        {
            Response.Write("<script>alert('Please Login To Check Your Profile'); window.location = '../adminLogin.aspx';</script>");
        }
        else
        {
            string query = "select * from Sellers where ID = " + Session["SellerID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader reader = cmd.ExecuteReader();

            String ID = String.Empty;
            String Name = String.Empty;
            String NickName = String.Empty;
            String Address = String.Empty;
            String Pincode = String.Empty;
            String Mobile = String.Empty;
            String Email = String.Empty;
            String Gender = String.Empty;
            String ProfileImage = String.Empty;
            String Ratings = String.Empty;
            String imgName = String.Empty;
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    ID = reader["ID"].ToString();
                    Name = reader["Name"].ToString();
                    NickName = reader["NickName"].ToString();
                    Address = reader["Address"].ToString();
                    Pincode = reader["Pincode"].ToString();
                    Mobile = reader["Mobile"].ToString();
                    Email = reader["Email"].ToString();
                    Gender = reader["Gender"].ToString();
                    ProfileImage = reader["ProfileImage"].ToString();
                    Ratings = reader["Ratings"].ToString();
                    imgName = reader["ProfileImage"].ToString();
                }
            }
            con.Close();
            reader.Close();
 %>



<div class="container">
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body"  >
                        <div class="card-title mb-4" >
                            <div class="d-flex justify-content-start" >
                                <div class="image-container" >
                                    <div>
						                
						                <div >
						                   <img src="../images/SellerProfile/<% Response.Write(imgName); %>"  style="margin:5px; height:350px; border-radius:10%;"/>
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
                                                <% Response.Write(Name); %>
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">NickName</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(NickName); %>
                                            </div>
                                        </div>
                                        <hr />
                                        
                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Address</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(Address); %>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Pincod</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(Pincode); %>
                                            </div> 
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Email</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(Email); %>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Gender</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(Gender); %>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Rating</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <% Response.Write(Ratings); %>
                                            </div>
                                        </div>
                                        <hr />

                                    </div>
                                    <div class="<% Response.Write(secondClass); %>" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                        
                                        
                                        
                                    <div>
				                    <div class="modal-body" style="margin:30px;">
					                    <form action="#" method="post" enctype="multipart/form-data">
						                    <div class="form-group">
						                        <input type="hidden" name="SellerID" value="<% Response.Write(ID); %>" />
							                    <label class="col-form-label">Your Name</label>
							                    <input type="text" class="form-control" name="Name" required="" readonly="" value="<% Response.Write(Name); %>">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Your Nickname</label>
							                    <input type="text" class="form-control" name="Nickname" required="" value="<% Response.Write(NickName); %>">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Address</label>
							                    <input type="text" class="form-control" name="Address" required="" value="<% Response.Write(Address); %>">
                    						    
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Pin Code</label>
							                    <input type="text" class="form-control" name="Pincode"  maxlength="6" onkeypress='validate(event)'  value="<% Response.Write(Pincode); %>" required="">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Mobile Number</label>
							                    <input type="text" maxlength="10" onkeypress='validate(event)' class="form-control" name="Mobile" value="<% Response.Write(Mobile); %>" required="">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Email</label>
							                    <input type="email" class="form-control" name="Email" required="" value="<% Response.Write(Email); %>">
						                    </div>
						                    <div class="form-group">
							                    <label class="col-form-label">Gender</label><br />
						                        <input type="radio" value="Male" name="Gender" <% if(Gender == "Male") Response.Write("checked='checked'"); %>  /><label class="col-form-label">Male</label>
						                        <input type="radio" value="Female" name="Gender" <% if(Gender == "Female") Response.Write("checked='checked'"); %> /><label class="col-form-label">Female</label>
						                    </div>		
						                    <div>
						                                    <label class="file">
                                                              <input type="file" id="file" name="file" aria-label="File browser example" accept="image/*" onchange="loadFile(event)">
                                                              <span class="file-custom"></span>
                                                            </label>
						                                    <div>
						                                        <img id="output"  style="margin:5px; height:300px; border-radius:10%;"/>
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

<%}
    } // Else Part End Here%>


</asp:Content>

