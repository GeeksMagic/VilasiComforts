<%@ Page Title="Room Allot" Language="vb" AutoEventWireup="false" MasterPageFile="~/VilasiAdmin.Master" CodeBehind="AllotRoom.aspx.vb" Inherits="VilasiComforts.AllotRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../App_Themes/AllotRoom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container">
            <div class="col-lg-10">
                <div class="container">
                    <span style="font-family: Georgia; font-size: xx-large">WELCOME TO VILASI COMFORTS ROOM BOOKING SYSTEM</span>
                </div>
                <div class="container col-lg-10 col-lg-offset-1">
                    <br />
                    <br />

                    <div class="col-lg-12">
                        <div class="container">
                            <div class="col-lg-3">
                                <span style="font-family: Georgia; font-size: x-large">Booking Number:</span>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="TxtBookingNumber" runat="server" CssClass="form-control" MaxLength="15"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RfvBookingId" ControlToValidate="TxtBookingNumber" runat="server"
                                    Text="Required Booking Id" ForeColor="Red" Font-Size="10px" ValidationGroup="Check"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-3">
                                <asp:Button runat="server" ID="BtnCheck" CssClass="btn btn-info" Text="Check" ValidationGroup="Check" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <asp:UpdatePanel runat="server" ID="UpdCustomerDetails" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnCheck" />
                        </Triggers>
                        <ContentTemplate>
                            <asp:Panel runat="server" ID="PnlCustomers" Visible="false">
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Name :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblName" runat="server" Text="Name"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Mobile :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblMobile" runat="server" Text="Mobile Number"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>E-Mail :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblMail" runat="server" Text="E-Mail"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Address :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblAddress" runat="server" Text="Address"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12 wellsetting">
                                    <div class="col-lg-4">
                                        <h4>Room Type :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblRoomType" runat="server" Text="Non-AC Single Room"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Number Of Rooms:</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblNumOfRooms" runat="server" Text="2"></asp:Label></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Members :</h4>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4>
                                            <asp:Label ID="LblAdult" runat="server"></asp:Label>&nbsp; Adult &
                                            <asp:Label ID="LblChild" runat="server"></asp:Label>&nbsp;Child</h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Check In:</h4>
                                    </div>
                                    <div class="col-lg-4">
                                        <h4>
                                            <asp:Label ID="LblCkeckIn" runat="server" Text="DD/MM/YYYY"></asp:Label></h4>
                                    </div>
                                    <div class="col-lg-2 wellsetting">
                                        <h4 class="wellsetting">
                                            <asp:TextBox runat="server" ID="TxtCheckInTime" Placeholder="HH:MM" CssClass="form-control"></asp:TextBox></h4>
                                    </div>
                                </div>
                                <div class="well col-lg-12">
                                    <div class="col-lg-4">
                                        <h4>Check Out:</h4>
                                    </div>
                                    <div class="col-lg-4">
                                        <h4>
                                            <asp:Label ID="LblCheckOut" runat="server" Text="DD/MM/YYYY"></asp:Label></h4>
                                    </div>
                                    <div class="col-lg-2">
                                        <h4>
                                            <asp:TextBox runat="server" ID="TxtCheckOutTime" Placeholder="HH:MM" CssClass="form-control"></asp:TextBox></h4>
                                    </div>
                                </div>
                                <div>
                                    <div class="container">
                                        <div class="col-lg-12 col-lg-offset-3">
                                            <div class="col-lg-3">
                                                <h4>Total Amount :</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label runat="server" ID="LblTotalAmt" Text="0.00"></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="container">
                                        <div class="col-lg-12 col-lg-offset-3">
                                            <div class="col-lg-3">
                                                <h4>Advance :</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label runat="server" ID="TxtAdvance" Text="0.00"></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="container">
                                        <div class="col-lg-12 col-lg-offset-3">
                                            <div class="col-lg-3">
                                                <h4>Remaining Amount:</h4>
                                            </div>
                                            <div class="col-lg-3">
                                                <h4>
                                                    <asp:Label runat="server" ID="LblRemainingAmt" Text="0.00"></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-10">
                                    <div class="container" style="padding-top: 30px !important">
                                        <asp:Button runat="server" ID="BtnOccupyRoom" CssClass="btn btn-info col-lg-offset-2" Text="Occupy Room" />
                                        <asp:Button runat="server" ID="BtnVacate" CssClass="btn btn-info" Text="Vacate Room" />
                                    </div>
                                </div>
                            </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
