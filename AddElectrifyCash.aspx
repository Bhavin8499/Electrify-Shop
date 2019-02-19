<%@ Page Language="C#" MasterPageFile="~/hfNoSidebar.master" AutoEventWireup="true" CodeFile="AddElectrifyCash.aspx.cs" Inherits="AddElectrifyCash" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadTagContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Electrify Cash | Electrify Shop
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">

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
							<input type="number" class="form-control" name="addCash" required="">
							<input type="hidden" class="form-control" name="ID" value="">
						</div>
						<div class="right-w3l">
							<input type="submit" class="form-control" id="btnSubmit" name="submit" value="Add Cash" />
						</div>
					</form>
				</div>
			</div>
			
	<!-- //modal -->
							

</asp:Content>

