<%@ Page Title="Book Your Room" Language="vb" AutoEventWireup="false" MasterPageFile="~/VIlasi.Master" CodeBehind="BookRoom.aspx.vb" Inherits="VilasiComforts.BookRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="Book" runat="server">
        <Scripts>
            <asp:ScriptReference Path="js/BookRoom.js" />
        </Scripts>
    </asp:ScriptManagerProxy>
    <div class="" style="margin-top: 60px;">

        <div class="">
            <div class="main">
                <div class="res_online text-center">
                    <h1><span style="font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif">START BOOKING YOUR ROOM</span> </h1>
                </div>
            </div>
            <asp:HiddenField ID="HdnNumDays" runat="server" />
            <div>
                <%-- <asp:UpdatePanel runat="server" ID="UpdBookingsystem">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="BtnBook" />
                        <asp:AsyncPostBackTrigger ControlID="LbtEditRoomDetailsForm" />
                        <asp:AsyncPostBackTrigger ControlID="LbtEditRoomDetails" />
                        <asp:AsyncPostBackTrigger ControlID="BtnConfirm" />
                        <asp:AsyncPostBackTrigger ControlID="DdlRoomType" />
                        <asp:AsyncPostBackTrigger ControlID="DdlNomOfRooms" />
                        <%--<asp:AsyncPostBackTrigger ControlID="TxtCheckOut" />--%
                    </Triggers>
                    <ContentTemplate>--%>
                <asp:Panel runat="server" ID="PnlBookingInformation">
                    <div class="text-center">
                        <div>
                            <div style="color: #808080; font-size: xx-large; font-weight: bold">Choose Your Dates & Options Below</div>
                        </div>
                    </div>
                    <div class="span_of_2">
                        <div class="col-lg-6">
                            <h4>Check-In </h4>
                            <div class="">
                                <asp:TextBox ID="TxtTodayDate" runat="server" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="TxtCheckIn" runat="server" CssClass="form-control textbox" placeholder="MM/DD/YYYY" ForeColor="Black" MaxLength="10"></asp:TextBox><br />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    ControlToValidate="TxtCheckIn" Text="Please Enter the CheckIn Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckIn" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckIn" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckIn" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <h4>Check-Out </h4>
                            <div class="">
                                <asp:TextBox ID="TxtCheckOut" runat="server" CssClass="form-control textbox" placeholder="MM/DD/YYYY" ForeColor="Black" MaxLength="10" EnableViewState="true" OnChange="chek();"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    ControlToValidate="TxtCheckOut" Text="Please Enter the CheckOut Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtCheckOut" Operator="GreaterThan"
                                    ControlToCompare="TxtCheckIn" ValidationGroup="book" ForeColor="Red" Type="Date" Font-Size="10px"
                                    Text="CheckOut Date should be Greater than CheckIn Date!!"></asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckOut" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckOut" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckOut" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />

                            </div>
                        </div>
                        <asp:UpdatePanel ID="UpdRooms" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DdlRoomType" />
                                <asp:AsyncPostBackTrigger ControlID="DdlNomOfRooms" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="col-lg-3">
                                    <h4>Type of Room</h4>
                                    <asp:DropDownList ID="DdlRoomType" runat="server" CssClass="frm-field form-control" AutoPostBack="true" OnSelectedIndexChanged="DdlRoomType_SelectedIndexChanged"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                        <%-- <asp:ListItem Text="Non AC Double Room" Value="1250"></asp:ListItem>
                                        <asp:ListItem Text="No AC Single Room" Value="900"></asp:ListItem>
                                        <asp:ListItem Text="AC Double Room" Value="1990"></asp:ListItem>
                                        <asp:ListItem Text="Suit Room" Value="3000"></asp:ListItem>--%>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="DdlRoomType" Font-Size="10px"
                                        ValidationGroup="book" InitialValue="0" ErrorMessage="Select Room Type" ForeColor="Red" />
                                </div>
                                <div class="col-lg-3">
                                    <h4>Number Of Rooms</h4>
                                    <div class="col-lg-12" style="padding-left: 0px !important">
                                        <asp:DropDownList ID="DdlNomOfRooms" runat="server" CssClass="frm-field form-control" AutoPostBack="true" OnSelectedIndexChanged="DdlNomOfRooms_SelectedIndexChanged">
                                            <asp:ListItem Text="--Select Room Type First--" Value="0"></asp:ListItem>
                                            <%-- <asp:ListItem Text="2" Value="2"></asp:ListItem>--%>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <h4>Adults </h4>
                                    <div class="col-lg-12" style="padding-left: 0px !important">
                                        <asp:TextBox ID="TxtAdults" runat="server" placeholder="Number of Adults" CssClass="frm-field form-control" ForeColor="Black" MaxLength="2"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RfvAdults"
                                            ControlToValidate="TxtAdults" Text="Please Enter Number of Adults!!" Font-Size="10px"
                                            ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator><br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionAdults" runat="server" ControlToValidate="TxtAdults"
                                            ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                            ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                                        <%--<asp:DropDownList ID="DdlAdults" runat="server" CssClass="frm-field form-control" AutoPostBack="true" OnSelectedIndexChanged="DdlNomOfRooms_SelectedIndexChanged">
                                            <asp:ListItem Text="--Select Number of Rooms--" Value="1"></asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-lg-3">
                            <h4>Childern </h4>
                            <asp:TextBox ID="TxtChildrens" runat="server" placeholder="Number of Childrens" CssClass="frm-field form-control" ForeColor="Black" MaxLength="2"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator runat="server" ID="RfvChildrens"
                                ControlToValidate="TxtChildrens" Text="Please Enter Number of Childrens!!" Font-Size="10px"
                                ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator><br />--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtChildrens"
                                ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <asp:UpdatePanel ID="UpdAmount" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DdlNomOfRooms" />
                                <asp:AsyncPostBackTrigger ControlID="DdlRoomType" />
                                <asp:AsyncPostBackTrigger ControlID="TxtCheckIn" />
                                <asp:AsyncPostBackTrigger ControlID="TxtCheckOut" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="col-lg-offset-7">
                                    <div class="" style="margin-top: 30px;">
                                        <div style="color: #2e2828; font-size: medium; font-weight: bold">
                                            Total Amount to be Paid : ₹ 
                                                    <asp:Label runat="server" Text=" 00.0" ID="LblAmount"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="clear"></div>

                    </div>
                    <div class="res_btn col-lg-offset-5" style="width: 150px">
                        <asp:Button ID="BtnBook" runat="server" Text="Book Now!" CssClass="btn btn-info" ValidationGroup="book" />
                    </div>

                    <asp:ValidationSummary ID="VsRoomInfo" runat="server" ShowSummary="false" DisplayMode="BulletList"
                        ValidationGroup="book" />
                </asp:Panel>

                <asp:Panel runat="server" ID="PnlGuestInfo" Visible="false">
                    <div class="text-center">
                        <div class="">
                            <div style="color: #808080; font-size: xx-large; font-weight: bold">FILL OUT THE FORM TO COMPLETE YOUR BOOKING</div>
                        </div>
                    </div>
                    <div class="col-lg-12 main">
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-tasks fa-fw"></i>Reservation Summary:
                                            <asp:LinkButton ID="LbtEditRoomDetailsForm" runat="server" CssClass="fa fa-edit pull-right btn btn-default">
                                                <asp:Label ID="LblEditRoomDetailsForm" runat="server" Text="Edit">
                                                </asp:Label>
                                            </asp:LinkButton>

                                </div>
                            </div>
                            <div class="">
                                <div class="">
                                    <i class="fa fa-info fa-fw"></i>Reservation Info:
                                </div>
                                <hr />
                            </div>
                            <div class="list-group">
                                <a class="list-group-item">
                                    <i class="fa fa-calendar fa-fw"></i>Check In
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblCheckIn" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-calendar fa-fw"></i>Check Out
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblCheckOut" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-users fa-fw"></i>Adults
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblNumAdults" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-user-md fa-fw"></i>Children
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblNumChilds" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                            </div>
                            <div class="">
                                <div class="">
                                    <i class="fa fa-info fa-fw"></i>Room Info:
                                            <hr />
                                </div>
                            </div>
                            <div class="list-group">
                                <a class="list-group-item">
                                    <i class="fa fa-home fa-fw"></i>Room Type
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblRoomType1" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-navicon fa-fw"></i>Number Of Rooms
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:Label ID="LblNumRooms" runat="server"></asp:Label></em>
                                            </span>
                                </a>
                            </div>
                            <hr />
                            <div>
                                <i class="fa fa-rupee fa-fw"></i>Total Cost
                                         <span class="pull-right text-muted"><em><b>₹
                                             <asp:Label ID="LblPayAmount" runat="server"></asp:Label></b></em>
                            </div>


                        </div>
                        <div class="col-lg-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-tasks fa-fw"></i>Reservation Info:
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <asp:TextBox runat="server" ID="TxtFirstName" placeholder="First Name" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvFirstName" Font-Size="10px"
                                    ControlToValidate="TxtFirstName" Text="Please Provide First Name!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" ID="TxtLastName" placeholder="Last Name" CssClass="form-control" MaxLength="15"></asp:TextBox>
                                <br />
                                <asp:TextBox runat="server" ID="TxtEmail" placeholder="Email" CssClass="form-control" MaxLength="40"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvEmail"
                                    ControlToValidate="TxtEmail" Text="Please Provide E-Mail!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpEmail" runat="server" ControlToValidate="TxtEmail" Font-Size="10px"
                                    ValidationExpression="^[a-zA-Z0-9]+.[a-zA-Z0-9]*@[a-zA-Z]+.(com|org|in|jp|co.in)$" ErrorMessage="Invalid Email!!"
                                    ValidationGroup="GuestInfo" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" ID="TxtConfirmEmail" placeholder="Confirm Email" CssClass="form-control" MaxLength="40" onpaste="return false"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvConfirmMail"
                                    ControlToValidate="TxtConfirmEmail" Text="Confirm E-Mail!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidatorEmail" runat="server" ControlToValidate="TxtConfirmEmail"
                                    ControlToCompare="TxtEmail" ValidationGroup="GuestInfo" ForeColor="Red" Text="Email Not Matching!!" Font-Size="10px"></asp:CompareValidator>
                                <asp:TextBox runat="server" ID="TxtMobile" CssClass="form-control" placeHolder="Mobile Number" MaxLength="15"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvMobile" Font-Size="10px"
                                    ControlToValidate="TxtMobile" Text="Please Provide Mobile Number!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionMobile" runat="server" ControlToValidate="TxtMobile"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Valid Mobile Number!!" Font-Size="10px"
                                    ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" ID="TxtCity" placeholder="City" CssClass="form-control" MaxLength="30"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvCity" Font-Size="10px"
                                    ControlToValidate="TxtCity" Text="Please Provide City!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidatorCity" runat="server" ControlToValidate="TxtCity"
                                    ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Enter Valid City!!" Font-Size="10px"
                                    ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" ID="TxtZip" placeholder="ZIP/Postal" CssClass="form-control" MaxLength="8"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvZip" Font-Size="10px"
                                    ControlToValidate="TxtZip" Text="Please Provide ZIP!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionZip" runat="server" ControlToValidate="TxtZip"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Valid Pin Code!!" Font-Size="10px"
                                    ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" ID="TxtAddress" placeholder="Address" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvAdddress" Font-Size="10px"
                                    ControlToValidate="TxtAddress" Text="Please Provide Address!!"
                                    ForeColor="Red" ValidationGroup="GuestInfo"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-6">
                                <asp:TextBox runat="server" ID="TxtRequest" TextMode="MultiLine" Rows="16" CssClass="form-control" placeholder="Special Request"></asp:TextBox>
                                <br />
                                <asp:CheckBox ID="ChkAgree" runat="server" Text="I Agree with the" CssClass="checkbox-inline"></asp:CheckBox>
                                <a href="#" class="">Terms & Conditions</a>
                                <br />
                                <br />
                                <div style="width: 200px">
                                    <%--<asp:Button ID="BtnBookMore" runat="server" Text="Book More.." CssClass="btn btn-info" />--%>
                                    <asp:Button ID="BtnConfirm" runat="server" Text="Confirm and Proceed" CssClass="btn btn-info" Width="250px" ValidationGroup="GuestInfo" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="VsGuestInfo" runat="server" ShowSummary="false" DisplayMode="BulletList"
                        ValidationGroup="GuestInfo" />
                </asp:Panel>

                <asp:Panel runat="server" ID="PnlReport" Visible="false">
                    <div class="">
                        <input type="hidden" runat="server" id="key" name="key" />
                        <input type="hidden" runat="server" id="hash" name="hash" />
                        <input type="hidden" runat="server" id="txnid" name="txnid" />
                        <div class="res_online text-center">
                            <div style="color: #808080; font-size: xx-large; font-weight: bold">BOOKING SUMMARY</div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="col-lg-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-tasks fa-fw"></i>Reservation Summary:
                                            <asp:LinkButton ID="LbtEditRoomDetails" runat="server" CssClass="fa fa-edit pull-right btn btn-default">
                                                <asp:Label ID="LblEditRoomDetails" runat="server" Text="Edit">
                                                </asp:Label>
                                            </asp:LinkButton>
                                </div>
                            </div>
                            <div class="">
                                <div class="">
                                    <i class="fa fa-tasks fa-fw"></i>Reservation Info:
                                </div>
                                <hr />
                            </div>
                            <div class="list-group">
                                <a class="list-group-item">
                                    <i class="fa fa-calendar fa-fw"></i>Check In
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="chkin" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblchkin" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-calendar fa-fw"></i>Check Out
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="chkout" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblchkout" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-users fa-fw"></i>Adults
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="adults" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lbladults" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-user-md fa-fw"></i>Children
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="children" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblchildren" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                            </div>
                            <i class="fa fa-info fa-fw"></i>Room Info:
                                            <hr />
                            <div class="list-group">
                                <a class="list-group-item">
                                    <i class="fa fa-info fa-fw"></i>Room Type
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="roomtype" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblroomtype" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                                <a class="list-group-item">
                                    <i class="fa fa-info fa-fw"></i>Number Of Rooms
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="noofrooms" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblnoofrooms" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-tasks fa-fw"></i>Reservation Info:
                                            <asp:LinkButton ID="LbtEditFormDetails" runat="server" CssClass="fa fa-edit pull-right btn btn-default">
                                                <asp:Label ID="LblEditFormDetails" runat="server" Text="Edit">
                                                </asp:Label>
                                            </asp:LinkButton>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div>
                                    <a class="list-group-item">
                                        <i class="fa fa-envelope-square fa-fw"></i>Name
                                   
                                            <span class="pull-right text-muted small" style="word-break: break-all"><em>
                                                <asp:TextBox ID="firstname" runat="server" Style="display: none"></asp:TextBox>
                                                <asp:Label ID="LblGuestName" runat="server"></asp:Label>
                                            </em>
                                            </span>
                                    </a>
                                    <a class="list-group-item">
                                        <i class="fa fa-envelope-square fa-fw"></i>E Mail
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="email" runat="server" Style="display: none"></asp:TextBox>
                                                <asp:Label ID="LblGuestEmail" runat="server" Text="AAA"></asp:Label><br />
                                            </em>
                                            </span>
                                    </a>
                                    <a class="list-group-item">
                                        <i class="fa fa-phone-square fa-fw"></i>Phone
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="phone" runat="server" Style="display: none"></asp:TextBox>
                                                <asp:Label ID="LblGuestMobile" runat="server" Text="AAA"></asp:Label><br />
                                            </em>
                                            </span>
                                    </a>
                                    <a class="list-group-item">
                                        <i class="fa fa-archive fa-fw"></i>City
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="city" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblcity" runat="server" Text="AAA"></asp:Label></em>
                                            </span>
                                    </a>
                                    <a class="list-group-item">
                                        <i class="fa fa-tag fa-fw"></i>ZIP
                                   
                                            <span class="pull-right text-muted small"><em>
                                                <asp:TextBox ID="zip" runat="server" style="display:none"></asp:TextBox>
                                                <asp:Label ID="Lblzip" runat="server" Text="572106"></asp:Label></em>
                                            </span>
                                    </a>
                                    <a class="list-group-item panel panel-default">
                                        <div>
                                            <i class="fa fa-archive fa-fw"></i>Address
                                                    <div class="panel-body">
                                                        <span class="pull-right text-muted small" style="word-break: break-all"><em>
                                                            <asp:TextBox ID="address" runat="server" style="display:none"></asp:TextBox>
                                                            <asp:Label ID="Lbladdress" runat="server" Text="AAA"></asp:Label>
                                                        </em>
                                                        </span>
                                                    </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <i class="fa fa-quote-left fa-fw"></i>Special Request 
                                    </div>
                                    <div class="panel-body">
                                        <span class="pull-right text-muted small" style="word-break: break-all"><em>
                                            <asp:TextBox ID="spclrequest" runat="server" style="display:none"></asp:TextBox>
                                            <asp:Label ID="Lblspclrequest" runat="server"></asp:Label>
                                        </em>
                                        </span>
                                    </div>
                                </div>

                                <hr />
                                <div>
                                     <a class="list-group-item">
                                       <i class="fa fa-rupee fa-fw"></i>Total Cost
                                         <span class="pull-right text-muted"><em><b>
                                             ₹<asp:Label ID="LblGuestAmount" runat="server" Text="AAA"></asp:Label></b></em>
                                    </a>
                                    <a class="list-group-item">
                                       <i class="fa fa-rupee fa-fw"></i>Service Charges
                                         <span class="pull-right text-muted"><em><b>
                                             ₹<asp:Label ID="LblServiceCharges" runat="server" Text="AAA"></asp:Label></b></em>
                                    </a>
                                    <a class="list-group-item">
                                       <i class="fa fa-rupee fa-fw"></i>Total Amount To Be Paid
                                         <span class="pull-right text-muted"><em><b>
                                              <asp:TextBox ID="amount" runat="server" Style="display: none"></asp:TextBox>
                                             ₹<asp:Label ID="LblTotalPaidAmount" runat="server" Text="AAA"></asp:Label></b></em>
                                    </a>
                                    
                                </div>
                                <br />
                                <br />
                                <div style="width: 250px">
                                    <%--<asp:Button ID="BtnEditInfo" runat="server" Text="Edit" CssClass="btn btn-info" />--%>
                                    <asp:Button ID="BtnPay" runat="server" Text="Proceed To Pay" CssClass="btn btn-info" Width="140px" />
                                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" PostBackUrl="~/Index.aspx" CssClass="btn btn-info" Width="100px" />
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </div>
                            <asp:TextBox ID="service_provider" runat="server" Text="payu_paisa" Style="display: none" />
                            <asp:TextBox ID="productinfo" runat="server" Text="RoomBooking" Style="display: none"></asp:TextBox>
                            <asp:TextBox ID="surl" runat="server" Text="http://localhost:2015/ResponseHandling.aspx" Style="display: none"></asp:TextBox>
                            <asp:TextBox ID="furl" runat="server" Text="http://localhost:2015/ResponseHandling.aspx" Style="display: none"></asp:TextBox>
                        </div>
                    </div>
                </asp:Panel>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                <div>
                    <div class="grids_of_3">
                        <div class="grid1_of_3">
                            <div class="grid1_of_3_img">
                                <a href="#">
                                    <img src="images/122.jpg" alt="" />
                                    <%--<span class="next"></span>--%>
                                </a>
                            </div>
                            <h5><a href="#"><asp:Label ID="LblNonAcDouble" runat="server"></asp:Label><span>₹ <asp:Label ID="LblNonAcDoublePrice" runat="server"></asp:Label></span></a></h5>
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                       <%-- <div class="grid1_of_3">
                            <div class="grid1_of_3_img">
                                <a href="#">
                                    <img src="images/124.jpg" alt="" />
                                    <%--<span class="next"></span>--%
                                </a>
                            </div>
                            <h5><a href="#">Non-AC Single Room <span>₹ 900</span></a></h5>
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>--%>
                        <div class="grid1_of_3">
                            <div class="grid1_of_3_img">
                                <a href="#">
                                    <img src="images/118.jpg" alt="" />
                                    <%--<span class="next"></span>--%>
                                </a>
                            </div>
                            <h5><a href="#"><asp:Label ID="LblAcDouble" runat="server"></asp:Label><span>₹ <asp:Label ID="LblAcDoublePrice" runat="server"></asp:Label></span></a></h5>
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                        <div class="grid1_of_3">
                            <div class="grid1_of_3_img">
                                <a href="#">
                                    <img src="images/126.jpg" alt="" />
                                    <%--<span class="next"></span>--%>
                                </a>
                            </div>
                            <h5><a href="#"><asp:Label ID="LblSuit" runat="server"></asp:Label><span>₹ <asp:Label ID="LblSuitPrice" runat="server"></asp:Label></span></a></h5>
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>

                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
