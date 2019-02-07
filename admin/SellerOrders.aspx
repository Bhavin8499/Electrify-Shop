<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="SellerOrders.aspx.cs" Inherits="admin_SellerOrders" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Orders | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">


<%
    if (Session["SellerID"] == null)
    {
        Response.Write("<script>alert('Please Login First To Edit Product'); window.location.href='../adminLogin.aspx';</script>");
    }
    else
    {

        String link1 = "";
        String link2 = "";
        String link3 = "";

        String classLink1 = String.Empty;
        String classLink2 = String.Empty;
        String classLink3 = String.Empty;

        if (Request.QueryString["pending"] != null)
        {

            link1 = "nav-link";
            link2 = "nav-link";
            link3 = "nav-link active";

            classLink1 = "tab-pane fade";
            classLink2 = "tab-pane fade";
            classLink3 = "tab-pane fade show active";

        }
        else if (Request.QueryString["deliverd"] != null)
        {

            link1 = "nav-link";
            link2 = "nav-link active";
            link3 = "nav-link";

            classLink1 = "tab-pane fade";
            classLink2 = "tab-pane fade show active";
            classLink3 = "tab-pane fade";


        }
        else
        {
            link1 = "nav-link active";
            link2 = "nav-link";
            link3 = "nav-link";

            classLink1 = "tab-pane fade show active";
            classLink2 = "tab-pane fade";
            classLink3 = "tab-pane fade";

        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());

        con.Open();
        String query = "select * from CusOrder";// Where SellerID = 1";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
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
                                        <a class="<% Response.Write(link1); %>" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Curret Order</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="<% Response.Write(link2); %>" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Delivared Order</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="<% Response.Write(link3); %>" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="pending" aria-selected="false">Pending Order</a>
                                    </li>
                                </ul>
                                
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="<% Response.Write(classLink1); %>" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                    <%
    if (reader.HasRows)
    {
        while (reader.Read())
        {
            String proID = reader["ProID"].ToString();
            String cusID = reader["CusID"].ToString();
            String Price = reader["Price"].ToString();
            String Qty = reader["Qty"].ToString();
            /* String userName = String.Empty;
             String userName = String.Empty;
             String userName = String.Empty;
             String userName = String.Empty;
             String userName = String.Empty;
             */
            int Total = Convert.ToInt32(Price) * Convert.ToInt32(Qty);
            String queryPro = "select * from product where ID =" + proID;
            SqlCommand cmdPro = new SqlCommand(queryPro, con);
            SqlDataReader readerProduct = cmdPro.ExecuteReader();
            if (readerProduct.HasRows)
            {
                while (readerProduct.Read())
                {
                    String[] imgArr = readerProduct["Product_img"].ToString().Split('|');
                                                       %>
                                                                <div style="margin:50px;">
                                                <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                                <table class="timetable_sub">
                                                    <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : <% Response.Write(reader["ID"].ToString()); %></H5></tr>
                                                    <tr>
                                                        <td><div style="width:150px; margin:10px;"><a href="#"><img src="../images/products/<% Response.Write(imgArr[0]); %>" style="width:50%;"/></a></div></td>
                                                        
                                                        <td style="width:200px;"><b><% Response.Write(readerProduct["Name"].ToString()); %></b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                                                        
                                                        <td style="width:100px;"><b>$<% Response.Write(Price); %> <br /> x &nbsp; <% Response.Write(Qty); %> <br />_____________<br />$<% Response.Write(Total.ToString()); %> </b></td>
                                                        
                                                        <td><% Response.Write(reader["Name"].ToString()); %> <br />____________________________________________________<br /><% Response.Write(reader["Address"].ToString()); %><br />____________________________________________________<br /><% Response.Write(reader["MobileNo"].ToString()); %></td>
                                                        <td style="width:100px;"><b><a href="TrackOrder.aspx">Edit Shipping Details</a></b></td>
                                                        
                                                    </tr>
                                                </table>
                                                </div>
                                             </div>
                                                    <%       }
            }
            else
            {
                Response.Write("There Is No Current Orders");
            }




        }

    }
    else
    {
        Response.Write("There Is No Current Orders");
    }
                                           
                                           
                                           
                                           
                                           
                                           
                                        %>
                                        <!--
                                        <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product images/p3.jpeg" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                                                    
                                                    <td style="width:100px;"><b>$12364 <br /> x &nbsp; 5<br />_____________<br />50005</b></td>
                                                    
                                                    <td>Kishan Jinjariya<br />____________________________________________________<br />"Shakti Nivas", Chamunda Soc., Opp. Ranchhoddas Ashram, Kuvadava Road, Rajkot.<br />____________________________________________________<br />9913829112</td>
                                                    <td style="width:100px;"><b><a href="TrackOrder.aspx">Edit Shipping Details</a></b></td>
                                                    
                                                </tr>
                                            </table>
                                            </div>
                                         </div>
                                         -->
                                    </div>
                                    
                                    
                                    
                                    <div class="<% Response.Write(classLink2); %>" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                       <%
    reader.Close();
    reader = cmd.ExecuteReader();
    if (reader.HasRows)
    {

        while (reader.Read())
        {
            if (reader["Status"].ToString() != "Delivered")
            {
                String proID = reader["ProID"].ToString();
                String cusID = reader["CusID"].ToString();
                String Price = reader["Price"].ToString();
                String Qty = reader["Qty"].ToString();
                /* String userName = String.Empty;
                 String userName = String.Empty;
                 String userName = String.Empty;
                 String userName = String.Empty;
                 String userName = String.Empty;
                 */
                int Total = Convert.ToInt32(Price) * Convert.ToInt32(Qty);
                String queryPro = "select * from product where ID =" + proID;
                SqlCommand cmdPro = new SqlCommand(queryPro, con);
                SqlDataReader readerProduct = cmdPro.ExecuteReader();
                if (readerProduct.HasRows)
                {
                    while (readerProduct.Read())
                    {
                        String[] imgArr = readerProduct["Product_img"].ToString().Split('|');
                                                       %>
                                        <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : <% Response.Write(reader["ID"].ToString()); %></H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="../images/products/<% Response.Write(imgArr[0]); %>" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b><% Response.Write(readerProduct["Name"].ToString()); %></b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                                                    
                                                    <td style="width:100px;"><b>$<% Response.Write(Price); %> <br /> x &nbsp; <% Response.Write(Qty); %><br />_____________<br />$<% Response.Write(Total.ToString()); %></b></td>
                                                    
                                                    <td><% Response.Write(reader["Name"].ToString()); %><br />____________________________________________________<br /><% Response.Write(reader["Address"].ToString()); %><br />____________________________________________________<br /><% Response.Write(reader["MobileNo"].ToString()); %></td>
                                                    
                                                </tr>
                                            </table>
                                            </div>
                                         </div>
                                                  <% }
                }
            }
        }
    } 
                                           
                                        %>
                                        <!--
                                        <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product images/p3.jpeg" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                                                    
                                                    <td style="width:100px;"><b>$12364 <br /> x &nbsp; 5<br />_____________<br />50005</b></td>
                                                    
                                                    <td>Kishan Jinjariya<br />____________________________________________________<br />"Shakti Nivas", Chamunda Soc., Opp. Ranchhoddas Ashram, Kuvadava Road, Rajkot.<br />____________________________________________________<br />9913829112</td>
                                                    
                                                </tr>
                                            </table>
                                            </div>
                                         </div>
                                         -->
                                    </div>
                                    <div class="<% Response.Write(classLink3); %>" id="pending" role="tabpanel" aria-labelledby="pending-tab">
                                        <%
    reader.Close();
    reader = cmd.ExecuteReader();

    if (reader.HasRows)
    {
        while (reader.Read())
        {
            if (reader["Status"].ToString() != "Delivered")
            {
                if (reader["Approved"].ToString() != "Approved")
                {
                    String proID = reader["ProID"].ToString();
                    String cusID = reader["CusID"].ToString();
                    String Price = reader["Price"].ToString();
                    String Qty = reader["Qty"].ToString();
                    /* String userName = String.Empty;
                     String userName = String.Empty;
                     String userName = String.Empty;
                     String userName = String.Empty;
                     String userName = String.Empty;
                     */
                    int Total = Convert.ToInt32(Price) * Convert.ToInt32(Qty);
                    String queryPro = "select * from product where ID =" + proID;
                    SqlCommand cmdPro = new SqlCommand(queryPro, con);
                    SqlDataReader readerProduct = cmdPro.ExecuteReader();
                    if (readerProduct.HasRows)
                    {
                        while (readerProduct.Read())
                        {
                            String[] imgArr = readerProduct["Product_img"].ToString().Split('|');
                                        %>
                                        <div style="margin: 50px;">
                                            <div style="width: 98%; box-shadow: -1px 1px 1px 1px Gray;" class="table-responsive">
                                                <table class="timetable_sub">
                                                    <tr style="border-bottom: 1px;">
                                                        <h5 style="font-size: medium; margin: 20px; margin-top: 30px;">
                                                            Order No. : <% Response.Write(reader["ID"].ToString()); %></h5>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="width: 150px; margin: 10px;">
                                                                <a href="#">
                                                                    <img src="../images/products/<% Response.Write(imgArr[0]); %>" style="width: 50%;" /></a></div>
                                                        </td>
                                                        <td style="width: 200px;">
                                                            <b><% Response.Write(readerProduct["Name"].ToString()); %></b><br />
                                                            <span style="color: Gray; font-size: x-small;">Color : Grey</span>
                                                        </td>
                                                        <td style="width: 100px;">
                                                            <b>$<% Response.Write(Price); %>
                                                                <br />
                                                                x &nbsp; <% Response.Write(Qty); %><br />
                                                                _____________<br />
                                                                $<% Response.Write(Total); %></b>
                                                        </td>
                                                        <td>
                                                            <% Response.Write(reader["Name"].ToString()); %><br />
                                                            ____________________________________________________<br />
                                                            <% Response.Write(reader["Address"].ToString()); %><br />
                                                            ____________________________________________________<br />
                                                            <% Response.Write(reader["MobileNo"].ToString()); %>
                                                        </td>
                                                        <td style="width: 100px;">
                                                            <b><a href="TrackOrder.aspx">Approve</a></b>
                                                        </td>
                                                        <td style="width: 100px;">
                                                            <b><a href="TrackOrder.aspx">disapprove</a></b>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <%                }
                    }
                }
            }
        }
    }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
    </div>

<% } // Else Part End Here %>



</asp:Content>

