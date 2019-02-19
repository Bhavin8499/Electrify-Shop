<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AddElectrifyCash.aspx.cs" Inherits="AddElectrifyCash" Title="Untitled Page" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadTagContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Electrify Cash | Electrify Shop
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">
<%  if (Session["ID"] == null)
    {
        Response.Write("<script>alert('Please Login To View Your Cart Cart'); window.location = \"LoginCustomer.aspx\";</script>");
    }
    else
    {
        String cash = String.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        String query = "select ElectriCash from Customers where ID="+Session["ID"].ToString();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                cash = reader["ElectriCash"].ToString();
            }
        }
        %>
<h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3" style="margin-top:40px;">
	<span>A</span>dd
	<span>E</span>lectrify
	<span>C</span>ash
</h3>
            <div>
				<div class="modal-body" style="margin:30px;">
					<form action="#" method="post">
						<div class="form-group">
							<label class="col-form-label">Your Electrify Cash</label>
							<input type="number" class="form-control" name="addCash" required="" />
							<input type="hidden" class="form-control" name="ID" value="<% Response.Write(Session["ID"].ToString()); %>">
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" name="btnSubmit" value="Add Cash" />
						</div>
						
						<div class="right-w3l">
							<label>Avaliable Electrify Cash : <%  Response.Write(cash);%></label>
						</div>
					</form>
				</div>
			</div>
			
			
	<!-- //modal -->
							
<% } %>
</asp:Content>

