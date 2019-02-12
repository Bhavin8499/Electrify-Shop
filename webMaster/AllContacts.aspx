<%@ Page Language="C#" MasterPageFile="~/webMaster/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AllContacts.aspx.cs" Inherits="webMaster_AllContacts" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">

All Contacts | Electrify-Shop

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<% if (Session["WebID"] == null)
   {
       Response.Write("<script>alert('Please Login First To See All Contact List'); window.location='webLogin.aspx';</script>");
   }
   else
   {

       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
       con.Open();
       String query = "select * from Contact_Us";// Where SellerID = 1";
       SqlCommand cmd = new SqlCommand(query, con);
       SqlDataReader reader = cmd.ExecuteReader();
       if (reader.HasRows)
       {
           while (reader.Read())
           {
                                               %>
                                                  <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:10px; margin-top:20px;">Form ID : <% Response.Write(reader["ID"].ToString()); %></H5></tr>
                                                <tr>                                                    
                                                    <td style="width:200px;"><b><% Response.Write(reader["Name"].ToString()); %></b></td>
                                                    
                                                    <td style="width:150px;"><b>Email :</b> <% Response.Write(reader["Email"].ToString()); %></td>
                                                    
                                                    <td>Message : <% Response.Write(reader["Message"].ToString()); %></td>
                                                    <td><a href="AllContacts.aspx?delID=<% Response.Write(reader["ID"].ToString()); %>">Remove Contact</a></td>
                                                       </tr>
                                            </table>
                                            </div>
                                         </div>   
                                                    <%                                                       
                                                    
                                                   
    }

       }
       else
       {%>
          <center style="margin-top:20px;"><h4>There is No Contact To Show</h4></center>
       <%}






   }// Else Part End Here
%>



</asp:Content>

