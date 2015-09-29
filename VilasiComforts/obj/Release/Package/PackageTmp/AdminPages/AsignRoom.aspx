<%@ Page Title="Assign Room" Language="vb" AutoEventWireup="false" MasterPageFile="~/VilasiAdmin.Master" CodeBehind="AsignRoom.aspx.vb" Inherits="VilasiComforts.AsignRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" class="col-lg-10">
        <div class="container">
            <span style="font-family: Georgia; font-size: xx-large">WELCOME TO VILASI COMFORTS ROOM BOOKING SYSTEM</span>
        </div>
        <div class="container col-lg-7 col-lg-offset-1">
            <br />
            <br />

            <div class="col-lg-1">
                <div class="container">
                    <div class="well col-lg-8">

                        <div class="pull-right">
                            Date : <asp:Label ID="LblDate" runat="server" ></asp:Label>
                        </div>
                        <div class="col-lg-10">
                            <h3>Name :</h3>
                            <br />
                            <div class="col-lg-3">
                                <asp:DropDownList ID="DdlNamePrefix" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Mr."></asp:ListItem>
                                    <asp:ListItem Text="Mrs."></asp:ListItem>
                                    <asp:ListItem Text="Miss."></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="TxtFirstName" placeholder="First Name" CssClass="form-control" Width="90%" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvFirstName"
                                    ControlToValidate="TxtFirstName" Text="Enter First Name!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo" Font-Size="10px"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox runat="server" ID="TxtLastName" placeholder="Last Name" CssClass="form-control" MaxLength="15"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <h3>E-Mail :</h3>
                            <br />
                            <div class="col-lg-9">
                                <asp:TextBox runat="server" ID="TxtEmail" placeholder="E mail" CssClass="form-control" Width="90%"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    ControlToValidate="TxtEmail" Text="Enter E-Mail Address!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo" Font-Size="10px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpEmail" runat="server" ControlToValidate="TxtEmail" Font-Size="10px"
                                    ValidationExpression="^[a-zA-Z0-9]+.[a-zA-Z0-9]*@[a-zA-Z]+.(com|org|in|jp|co.in)$" ErrorMessage="Invalid Email!!"
                                    ValidationGroup="GuestInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <h3>Contact Number :</h3>
                            <br />
                            <div class="col-lg-9">
                                <asp:TextBox runat="server" ID="TxtMobile" placeholder="Mobile Number" CssClass="form-control" Width="90%" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    ControlToValidate="TxtMobile" Text="Enter Mobile Number!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo" Font-Size="10px"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionMobile" runat="server" ControlToValidate="TxtMobile"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Valid Mobile Number!!" Font-Size="10px"
                                    ValidationGroup="GuestInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <h3>Address :</h3>
                            <br />
                            <div class="col-lg-4">
                                <asp:TextBox runat="server" ID="TxtAddress" placeholder="Address" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvAdddress"
                                    ControlToValidate="TxtAddress" Text="Enter Address!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo" Font-Size="10px"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4">
                                <div class="contact-form">
                                    <asp:TextBox runat="server" ID="TxtCity" placeholder="City" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RfvCity"
                                        ControlToValidate="TxtCity" Text="Please Provide City!!"
                                        ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="TxtZip" placeholder="ZIP/Postal" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RfvZip"
                                        ControlToValidate="TxtZip" Text="Please Provide ZIP!!"
                                        ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="contact-form">
                                    <asp:TextBox runat="server" ID="TxtState" placeholder="State" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RfvState"
                                        ControlToValidate="TxtState" Text="Please Provide State!!"
                                        ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                    <asp:TextBox runat="server" ID="TxtCountry" placeholder="Country" CssClass="form-control" Text="India"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RfvCountry"
                                        ControlToValidate="TxtCountry" Text="Please Provide State!!"
                                        ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="col-lg-5" style="padding-left: 0px !important">
                                <h3>Room Type :</h3>
                                <br />
                                <div class="col-lg-12">
                                    <asp:DropDownList ID="DdlReservedRoomType" runat="server" CssClass="frm-field form-control"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvRoomType" runat="server" ControlToValidate="DdlReservedRoomType" Font-Size="10px"
                                        ValidationGroup="GuestInfo" InitialValue="0" ErrorMessage="Select Room Type" ForeColor="Red" />
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <h3>Number Of Rooms:</h3>
                                <br />
                                <div class="col-lg-9">
                                    <asp:DropDownList ID="DdlNumOfRooms" runat="server" CssClass="frm-field form-control" AutoPostBack="true">
                                        <asp:ListItem Text="--Num Of Rooms--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RfvNumOfRooms" runat="server" ControlToValidate="DdlReservedRoomType" Font-Size="10px"
                                        ValidationGroup="GuestInfo" InitialValue="0" ErrorMessage="Select Num of Rooms" ForeColor="Red" />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <h3>Members :</h3>
                            <br />
                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtAdults" runat="server" placeholder="Adults" CssClass="form-control" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6"
                                    ControlToValidate="TxtAdults" Text="Enter Num of Adults!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="TxtChildren" placeholder="Children" CssClass="form-control" Width="90%" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" Font-Size="10px"
                                    ControlToValidate="TxtChildren" Text="Enter Number Of Childrens!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtChildren"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                    ValidationGroup="GuestInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <h3>Check In :</h3>
                            <br />
                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtCheckIn" runat="server" placeholder="MM/DD/YYYY" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7"
                                    ControlToValidate="TxtCheckIn" Text="Enter Check In Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckIn" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckIn" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckIn" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="GuestInfo" Font-Size="10px" />
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="TxtCheckInTime" placeholder="HH:MM:SS" CssClass="form-control" Width="90%"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3"
                                    ControlToValidate="TxtCheckInTime" Text="Enter Check In Time!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <h3>Check Out :</h3>
                            <br />
                            <div class="col-lg-5">
                                <asp:TextBox ID="TxtCheckOut" runat="server" placeholder="MM/DD/YYYY" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvCheckOut" Font-Size="10px"
                                    ControlToValidate="TxtCheckOut" Text="Enter Check Out Date!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtCheckOut" Operator="GreaterThanEqual"
                                    ControlToCompare="TxtCheckIn" ValidationGroup="GuestInfo" ForeColor="Red" Type="Date" Font-Size="10px"
                                    Text="CheckOut Date should be Greater than or Same as CheckIn Date!!"></asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckOut" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckOut" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckOut" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                            </div>
                            <div class="col-lg-5">
                                <asp:TextBox runat="server" ID="TxtCheckOutTime" placeholder="HH:MM:SS" CssClass="form-control" Width="90%"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                                    ControlToValidate="TxtCheckOutTime" Text="Enter CheckOut Time!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <div class="container">
                                <div class="col-lg-12 col-lg-offset-3">
                                    <div class="col-lg-2">
                                        <h3>Total Amount :</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <h3>
                                            <asp:Label runat="server" ID="LblTotalAmt" Text="0.00"></asp:Label></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="container">
                                <div class="col-lg-12 col-lg-offset-3">
                                    <div class="col-lg-2">
                                        <h3>Advance :</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <h3>
                                            <asp:Label runat="server" ID="TxtAdvance" Text="0.00"></asp:Label></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="container">
                                <div class="col-lg-12 col-lg-offset-3">
                                    <div class="col-lg-2">
                                        <h3>Remaining Amount :</h3>
                                    </div>
                                    <div class="col-lg-3">
                                        <h3>
                                            <asp:Label runat="server" ID="LblRemainingAmt" Text="0.00"></asp:Label></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-10">
                            <div class="container" style="padding-top: 30px !important">
                                <asp:Button runat="server" ID="BtnAllotRoom" CssClass="btn btn-info col-lg-offset-2" Text="Allot Room" ValidationGroup="GuestInfo" />
                                <asp:Button runat="server" ID="BtnClear" CssClass="btn btn-info" Text="Clear" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
