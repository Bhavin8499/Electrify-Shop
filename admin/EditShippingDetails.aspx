<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="EditShippingDetails.aspx.cs" Inherits="admin_EditShippingDetails" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Edit Shipping Details | Electrify-Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    con.Open();

    string ordID = Request.QueryString["ordID"] != null? Request.QueryString["ordID"].ToString() : "0";
    
    String query = "select * from CusOrder where ID="+ ordID;
    SqlCommand cmd = new SqlCommand(query,con);
    SqlDataReader reader = cmd.ExecuteReader();
    String ProductName = String.Empty;
    if (reader.HasRows)
    {
        while (reader.Read())
        {
            String proID = reader["ProID"].ToString();
             String queryPro = "select * from product where ID =" + proID;
                SqlCommand cmdPro = new SqlCommand(queryPro, con);
                SqlDataReader readerProduct = cmdPro.ExecuteReader();
                if (readerProduct.HasRows)
                {
                    while (readerProduct.Read())
                    {
                        ProductName = readerProduct["Name"].ToString();
                    }
                }
        }
    }
     %>


<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:40px;">
	<span>E</span>dit
	<span>S</span>hhiping
	<span>D</span>etails
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="" method="post" enctype="multipart/form-data">
						<div class="form-group">
						<input type="hidden" value="<% Response.Write(Request.QueryString["ordID"].ToString()); %>" name="ID" />
							<label class="col-form-label">Product Name</label>
							<input type="text" class="form-control" name="product_name" disabled=disabled value="<% Response.Write(ProductName); %>" />
						</div>
						<div class="form-group">
						    <label class="col-form-label">Status</label>
							<select name="status" style="display: block;
  width: 100%;
  padding-top: 0.375rem;
  padding-bottom: 0.375rem;
  margin-bottom: 0;
  line-height: 1.5;
  background-color: transparent;
  border: solid 1px gray;
  ">
							<option value="Order Processing">Order Processing</option>
							<option value="Pre-Production">Pre-Production</option>
							<option value="In Production">In Production</option>
							<option value="Shipped">Shipped</option>
							<option value="Delivered">Delivered</option>
							</select>
						</div>
						<div class="form-group">
							<label class="col-form-label">Notes</label>
							<textarea class="form-control" name="Note" style="height:100px;"></textarea>
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Edit Shipping Details" />
						</div>
						
						
						
						
					</form>
				</div>
			</div>

</asp:Content>

