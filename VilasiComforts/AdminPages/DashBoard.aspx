<%@ Page Title="Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/VilasiAdmin.Master" CodeBehind="DashBoard.aspx.vb" Inherits="VilasiComforts.DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Index.css" rel="stylesheet" />
    <style>
        .list-group-item {
            padding-top: 20px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="Book" runat="server">
        <Scripts>
            <%--<asp:ScriptReference Path="~/js/DashBoard.js" />--%>
        </Scripts>
    </asp:ScriptManagerProxy>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Dashboard</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <%--<i class="fa fa-comments fa-5x"></i>--%>
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="LblNumSuitRooms" runat="server" Text="3"></asp:Label>
                                </div>
                                <div>Suit Rooms</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="LblNumACDoubleRoom" runat="server" Text="10"></asp:Label>
                                </div>
                                <div>AC Double Rooms</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <%--<i class="fa fa-shopping-cart fa-5x"></i>--%>
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="LblNumNonACDoubleRooms" runat="server" Text="10"></asp:Label>
                                </div>
                                <div>Non-AC Double Rooms</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="col-lg-3 col-md-6">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <%--<i class="fa fa-support fa-5x"></i>--%
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">
                                    <asp:Label ID="LblNumNonACSingleRooms" runat="server" Text="10"></asp:Label>
                                </div>
                                <div>Non-AC Single Rooms</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-search fa-fw"></i>Search Criteria
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3">
                                <asp:TextBox ID="TxtCustomerId" runat="server" CssClass="form-control" placeholder="Customer Id" ForeColor="Black" MaxLength="15"></asp:TextBox><br />
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="TxtCheckIn" runat="server" CssClass="form-control" placeholder="CheckIn Date" ForeColor="Black" MaxLength="10"></asp:TextBox>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckIn" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckIn" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckIn" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="search" Font-Size="10px" />
                            </div>
                            <div class="col-lg-3">
                                <asp:DropDownList ID="DdlRoomNumber" runat="server" CssClass="frm-field form-control"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Room No--" Value="0"></asp:ListItem>
                                </asp:DropDownList><br />
                            </div>
                            <div class="col-lg-3 text-center">
                                <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-info" ValidationGroup="search"></asp:Button>
                                <input type="reset" value="Clear" class="btn btn-info" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-table fa-fw"></i>Guest Details
                    </div>
                    <!-- Customer Details -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <asp:UpdatePanel runat="server" ID="updCustomer">
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BtnSearch" />
                                        </Triggers>
                                        <ContentTemplate>
                                            <asp:GridView ID="grvGuest" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false"
                                                EmptyDataText="No Data Found" AllowPaging="true" PageSize="5" OnPageIndexChanging="grvGuest_PageIndexChanging">
                                                <PagerSettings FirstPageText="First" LastPageText="Last" PageButtonCount="5"
                                                    Mode="NumericFirstLast" Position="Top" />
                                                <PagerStyle Height="30px" HorizontalAlign="Center" />
                                                <Columns>
                                                    <%--<asp:BoundField HeaderText="Sl No" DataField="CONTACT_ID" />--%>
                                                    <asp:BoundField HeaderText="Customer Id" DataField="Customer_Id" />
                                                    <asp:BoundField HeaderText="Name" DataField="Full_Name" />
                                                    <asp:BoundField HeaderText="Room No" DataField="Room_Id" />
                                                    <asp:BoundField HeaderText="Check In" DataField="Checkin_Date" DataFormatString="{0: MM/dd/yyyy}" />
                                                    <asp:BoundField HeaderText="Check Out" DataField="CheckOut_Date" DataFormatString="{0: MM/dd/yyyy}" />
                                                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                                                    <asp:BoundField HeaderText="Email Id" DataField="EMail" />
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-table fa-fw"></i>Contact Us
                    </div>
                    <!-- /.Contact Details -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <asp:GridView ID="grvContact" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false"
                                        EmptyDataText="No Data Found" AllowPaging="true" PageSize="5" OnPageIndexChanging="grvContact_PageIndexChanging">
                                        <PagerSettings FirstPageText="First" LastPageText="Last" PageButtonCount="5"
                                            Mode="NumericFirstLast" Position="Top" />
                                        <PagerStyle Height="30px" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:BoundField HeaderText="Sl No" DataField="CONTACT_ID" />
                                            <asp:BoundField HeaderText="Name" DataField="CONTACT_NAME" />
                                            <asp:BoundField HeaderText="E Mail" DataField="CONTACT_EMAIL" />
                                            <asp:BoundField HeaderText="Mobile" DataField="CONTACT_MOBILE" />
                                            <asp:BoundField HeaderText="Message" DataField="CONTACT_MESSAGE" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-tasks fa-fw"></i>Summary Panel
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <a class="list-group-item">
                                <i class="fa fa-users fa-fw"></i>Total Guests
                                   
                                <span class="pull-right text-muted small"><em>
                                    <asp:Label ID="LblTotalGuest" runat="server"></asp:Label>
                                </em>
                                </span>
                            </a>
                            <a class="list-group-item">
                                <i class="fa fa-users fa-fw"></i>Guests in This Month
                                   
                                <span class="pull-right text-muted small"><em>
                                    <asp:Label ID="LblMonthGuest" runat="server"></asp:Label>
                                </em>
                                </span>
                            </a>
                            <a class="list-group-item">
                                <i class="fa fa-users fa-fw"></i>Today's Guests
                                   
                                <span class="pull-right text-muted small"><em>
                                    <asp:Label ID="LblTodayGuest" runat="server"></asp:Label>
                                </em>
                                </span>
                            </a>
                            <%--<div class="list-group-item">
                                <i class=""></i><b>Available Number of Rooms</b>
                            </div>
                            <a class="list-group-item">
                                <i class="fa fa-home fa-fw"></i>Suit Rooms
                                   
                                <span class="pull-right text-muted small"><em>5</em>
                                </span>
                            </a>
                            <a class="list-group-item">
                                <i class="fa fa-home fa-fw"></i>AC Double Rooms
                                   
                                <span class="pull-right text-muted small"><em>5</em>
                                </span>
                            </a>
                            <a class="list-group-item">
                                <i class="fa fa-home fa-fw"></i>Non-AC Double Rooms
                                   
                                <span class="pull-right text-muted small"><em>5</em>
                                </span>
                            </a>
                            <a class="list-group-item">
                                <i class="fa fa-home fa-fw"></i>Non-AC Single Rooms
                                   
                                <span class="pull-right text-muted small"><em>5</em>
                                </span>
                            </a>--%>
                        </div>
                        <!-- /.list-group -->
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-tasks fa-fw"></i>Update Room Prices
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <div class="list-group-item">
                                <asp:DropDownList ID="DdlRoomTypePriceUpdate" runat="server" CssClass="frm-field form-control" AutoPostBack="true"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DdlRoomTypePriceUpdate" Font-Size="10px"
                                    ValidationGroup="update" InitialValue="0" ErrorMessage="Select Room Type" ForeColor="Red" />
                            </div>
                            <div class="list-group-item">
                                <asp:UpdatePanel runat="server">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DdlRoomTypePriceUpdate" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:TextBox ID="TxtPriceUpdate" runat="server" placeholder="Number Of Rooms" CssClass="form-control" MaxLength="4"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4"
                                            ControlToValidate="TxtPriceUpdate" Text="Please Enter Num of Rooms!!" Font-Size="10px"
                                            ForeColor="Red" ValidationGroup="update"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtPriceUpdate"
                                            ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                            ValidationGroup="update" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div><br />
                            <asp:Button ID="BtnUpdate" runat="server" Text="Update Price" CssClass="btn btn-default btn-block" ValidationGroup="update" />
                        </div>
                        <!-- /.list-group -->
                    </div>
                </div>

                    <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-tasks fa-fw"></i>Reserve A Room
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <div class="list-group-item">
                              <asp:TextBox ID="TxtReservedName" runat="server" placeholder="Reserver Name" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    ControlToValidate="TxtReservedName" Text="Please Enter the Name!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                            </div>
                            <div class="list-group-item">
                                <asp:TextBox ID="TxtReservedDate" runat="server" placeholder="Reserved CheckIn Date" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <Ajax:CalendarExtender ID="CalendarExtenderReservedDate" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtReservedDate" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1"
                                    ControlToValidate="TxtReservedDate" Text="Please Enter the Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtReservedDate" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                            </div>
                            <div class="list-group-item">
                                <asp:TextBox ID="TxtReservedCheckOut" runat="server" placeholder="Reserved CheckOut Date" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <Ajax:CalendarExtender ID="CalendarExtenderReservedCheckOutDate" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtReservedCheckOut" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                                    ControlToValidate="TxtReservedCheckOut" Text="Please Enter the Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtReservedCheckOut" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TxtReservedCheckOut" Operator="GreaterThan"
                                    ControlToCompare="TxtReservedDate" ValidationGroup="book" ForeColor="Red" Type="Date" Font-Size="10px"
                                    Text="CheckOut Date should be Greater than CheckIn Date!!"></asp:CompareValidator>
                            </div>
                            <div class="list-group-item">
                                <asp:DropDownList ID="DdlReservedRoomType" runat="server" CssClass="frm-field form-control"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="DdlReservedRoomType" Font-Size="10px"
                                    ValidationGroup="book" InitialValue="0" ErrorMessage="Select Room Type" ForeColor="Red" />
                            </div>
                            <%--<div class="list-group-item">
                                <asp:TextBox ID="TxtReservdNumOfRoooms" runat="server" placeholder="Number Of Rooms" CssClass="form-control" MaxLength="2"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                    ControlToValidate="TxtReservdNumOfRoooms" Text="Please Enter Num of Rooms!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="book"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionAdults" runat="server" ControlToValidate="TxtReservdNumOfRoooms"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                    ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>--%>
                        </div>
                        <asp:Button runat="server" Text="Reserve" ID="BtnReserve" CssClass="btn btn-default btn-block" ValidationGroup="book" />
                    </div>
                </div>
                <!-- /.panel-body -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-tasks fa-fw"></i>Block Rooms
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <div class="list-group-item">
                                <asp:TextBox ID="TxtBlockCheckIn" runat="server" placeholder="Block Date" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                <Ajax:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtBlockCheckIn" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7"
                                    ControlToValidate="TxtBlockCheckIn" Text="Please Enter the Check Date!!" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="block"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtBlockCheckIn" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="block" Font-Size="10px" />
                            </div>
                            <div class="list-group-item">
                                <asp:DropDownList ID="DdlBlockRoomType" runat="server" CssClass="frm-field form-control"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="DdlBlockRoomType" Font-Size="10px"
                                    ValidationGroup="block" InitialValue="0" ErrorMessage="Select Room Type" ForeColor="Red" />
                            </div>
                            <div class="list-group-item">
                                <asp:RadioButtonList runat="server" ID="RblBlock" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Text="Block" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="UnBlock" Value="0"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <asp:Button runat="server" Text="Block Rooms" ID="BtnBlock" CssClass="btn btn-default btn-block" ValidationGroup="block" />
                    </div>
                </div>

            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
</asp:Content>
