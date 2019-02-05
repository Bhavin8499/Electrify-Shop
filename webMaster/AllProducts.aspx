<%@ Page Language="C#" MasterPageFile="~/webMaster/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AllProducts.aspx.cs" Inherits="webMaster_AllProducts" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">

Current Avaliable Products

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%
SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    con.Open();
    String query = "select * from Product";// Where SellerID = 1";
    SqlCommand cmd = new SqlCommand(query, con);
    SqlDataReader reader = cmd.ExecuteReader();
   if (reader.HasRows)
                                           {
                                               while (reader.Read())
                                               {
                                                  String[] imgArr = reader["Product_img"].ToString().Split('|');
                                               %>
                                                  <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Product ID : <% Response.Write(reader["ID"].ToString()); %></H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="../images/products/<% Response.Write(imgArr[0]); %>" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b><% Response.Write(reader["Name"].ToString()); %></b><br /><span style="color:Gray; font-size:x-small;"><% Response.Write(reader["Type"].ToString()); %></span></td>
                                                    
                                                    <td style="width:150px;"><b>Price :</b>$<% Response.Write(reader["Price"].ToString()); %><br />_____________<b><br />MRP :</b>$<% Response.Write(reader["MRP"].ToString()); %></td>
                                                    
                                                    <td><% Response.Write(reader["Description"].ToString()); %></td>
                                                    <td style="width:150px;">                                                        
                                                           <Span>Qty : </Span><% Response.Write(reader["Qty"].ToString()); %>
                                                          
                                                    </td>
                                                       </tr>
                                            </table>
                                            </div>
                                         </div>   
                                                    <%                                                       
                                                    
                                                   
                                               }

                                           }
                                           else
                                           {
                                               Response.Write("There Is No Current Orders");
                                           }
                                           
                                           
                                        
                                           
                                           
                                           
                                        %>

</asp:Content>

