<%@ Page Language="C#" MasterPageFile="~/admin/hfNoSidebar.master" AutoEventWireup="true" CodeFile="SellerOrders.aspx.cs" Inherits="admin_SellerOrders" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
Orders | Electrify Shop
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContentPlaceHolder" Runat="Server">





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
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Curret Order</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Delivared Order</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="pending-tab" data-toggle="tab" href="#pending" role="tab" aria-controls="pending" aria-selected="false">Pending Order</a>
                                    </li>
                                </ul>
                                
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
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
                                    </div>
                                    
                                    
                                    
                                    <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
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
                                    </div>
                                    
                                    <div class="tab-pane fade" id="pending" role="tabpanel" aria-labelledby="pending-tab">
                                         <div style="margin:50px;">
                                            <div style="width:98%; box-shadow:-1px 1px 1px 1px Gray;" class="table-responsive">
                                            <table class="timetable_sub">
                                                <tr style="border-bottom:1px;"><H5 style="font-size:medium; margin:20px; margin-top:30px;">Order No. : 78945612123</H5></tr>
                                                <tr>
                                                    <td><div style="width:150px; margin:10px;"><a href="#"><img src="images/product images/p3.jpeg" style="width:50%;"/></a></div></td>
                                                    
                                                    <td style="width:200px;"><b>Oppo F7</b><br /><span style="color:Gray; font-size:x-small;">Color : Grey</span></td>
                                                    
                                                    <td style="width:100px;"><b>$12364 <br /> x &nbsp; 5<br />_____________<br />50005</b></td>
                                                    
                                                    <td>Kishan Jinjariya<br />____________________________________________________<br />"Shakti Nivas", Chamunda Soc., Opp. Ranchhoddas Ashram, Kuvadava Road, Rajkot.<br />____________________________________________________<br />9913829112</td>
                                                    <td style="width:100px;"><b><a href="TrackOrder.aspx">Approve</a></b></td>
                                                    <td style="width:100px;"><b><a href="TrackOrder.aspx">disapprove</a></b></td>
                                                    
                                                </tr>
                                            </table>
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





</asp:Content>

