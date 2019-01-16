<%@ Page Language="C#" MasterPageFile="~/webMaster/hfNoSidebar.master" AutoEventWireup="true"
    CodeFile="allSeller.aspx.cs" Inherits="webMaster_allSeller" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" runat="Server">
    All Seller | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" runat="Server">
    <div style="margin: 50px;">
        <div style="width: 98%; box-shadow: -1px 1px 1px 1px Gray;" class="table-responsive">
            <table class="timetable_sub">
                <tr style="border-bottom: 1px;">
                    <h5 style="font-size: medium; margin: 20px; margin-top: 30px;">
                        Seller ID : 78</h5>
                </tr>
                <tr>
                    <td>
                        <div style="width: 150px; margin: 10px;">
                            <a href="#">
                                <img src="images/user.jpg" style="width: 50%;" /></a></div>
                    </td>
                    <td style="width: 200px;">
                        <b>:: Seller Name ::</b><br />
                        Kishan Jinjariya
                    </td>
                    <td style="width: 200px;">
                        <b>:: Email ::</b><br />
                        kishan.speedtech@gmail.com
                    </td>
                    <td style="width: 200px;">
                        <b>:: Rating ::</b><br />
                        4.5
                    </td>
                    <td style="width: 200px;">
                        <b>:: Address ::</b><br />
                        "Shakti Nivas", Chamunda Soc., Opp. Ranchhoddas Ashram, Kuvadava Road, Rajkot.
                    </td>
                    <td style="width: 100px;">
                        <b><a href="TrackOrder.aspx">Delete Seller</a></b>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
