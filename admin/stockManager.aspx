<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="stockManager.aspx.cs" Inherits="admin_stockManager" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Stock Manager | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

<%
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    con.Open();
    String query = "select * from Product where SellerID = 1";
    SqlCommand cmd = new SqlCommand(query, con);
    SqlDataReader reader = cmd.ExecuteReader();
 %>


<div class="container">

<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:20px;">
				<span>Y</span>our
				<span>C</span>urrent
				<span>S</span>tock
	</h3>

                        <div class="row">
                            <div class="col-12">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                       
                                       <% if (reader.HasRows)
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
                                                        <form id='myform' method='post' action='stockManager.aspx'>
                                                            <input type='number' name='quantity' value="<% Response.Write(reader["Qty"].ToString()); %>" min="0" class='qty' /><br />
                                                            <input type='hidden' name='ProductID' value='<% Response.Write(reader["ID"].ToString()); %>' />
                                                            <input style="font-size:1em; margin:0; padding:0; border:0; background-color:White;" name="Submit" type="submit" value="Restock" />
                                                        </form>  
                                                    </td>
                                                     <td style="width:100px;"><b><a href="stockManager.aspx?deleteProduct=<% Response.Write(reader["ID"].ToString()); %>">Delete Product</a></b></td>
                                                 </tr>
                                            </table>
                                            </div>
                                         </div>   
                                                  
                                              <%
                                              }
                                          } %>
                                       
                                                                              
                                    </div>
                                    </div>
<script>
jQuery(document).ready(function(){
    // This button will increment the value
    $(".qtyplus").click(function(e){
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
                                                   
                                    
                                    
                                   
			</div>
			
	<!-- //modal -->
									

                                    </div>
                                    
                                    
                                </div>
                            </div>
                        </div>

             




</asp:Content>

