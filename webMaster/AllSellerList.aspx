<%@ Page Language="C#" MasterPageFile="~/webMaster/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AllSellerList.aspx.cs" Inherits="webMaster_AllSellerList" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
        <asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
All Avaliable Sellers List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

<%
    if (Session["WebID"] == null)
    {
        Response.Write("<script>alert('Please Login First To See All Product'); window.location='../webLogin.aspx';</script>");
    }
    else
    {
        String query = "select * from Sellers Order By ID DESC";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
     %>

<div class="container">

<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:20px;">
				<span>C</span>urrent
				<span>S</span>ellers
	</h3>

                        <div class="row">
                            <div class="col-12">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                       
                                       <% if (reader.HasRows)
                                          {
                                              while (reader.Read())
                                              {
                                               %>
                                                  <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Seller ID : <% Response.Write(reader["ID"].ToString()); %></H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="../images/SellerProfile/<% Response.Write(reader["ProfileImage"].ToString()); %>" style="width:100%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b><% Response.Write(reader["Name"].ToString()); %></b></td>
                                                    
                                                    <td style="width:150px;"><b>Address :</b><% Response.Write(reader["Address"].ToString()); %><br />_____________________________<b><br />Pincode :</b>$<% Response.Write(reader["Pincode"].ToString()); %><br />_____________________________<br /><b>Mobile No :</b>$<% Response.Write(reader["Mobile"].ToString()); %></td>
                                                    
                                                    <td><b> Email :</b><% Response.Write(reader["Email"].ToString()); %></td>
                                                    <td style="width:150px;">
                                                        <b>Gender :</b> <% Response.Write(reader["Gender"].ToString()); %>
                                                    </td>
                                                     
                                                 </tr>
                                            </table>
                                            </div>
                                         </div>   
                                                  
                                              <%
    }
                                          } %>
                                       
                                                                              
                                    </div>
                                    </div>
                                    </div>
                                    </div>
                                   
<% } // Else Part End Here %>
</asp:Content>

