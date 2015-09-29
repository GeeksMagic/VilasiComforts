<%@ Page Title="Home" Language="vb" AutoEventWireup="false" MasterPageFile="~/VIlasi.Master" CodeBehind="Index.aspx.vb" Inherits="VilasiComforts.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="App_Themes/Index.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!----start-images-slider---->
    <div class="images-slider">
        <!-- start slider -->
        <div id="fwslider">
            <div class="slider_container main_bg">
                <div class="slide">
                    <!-- Slide image -->
                    <img src="images/Room1.jpg" alt="" />
                    <!-- /Slide image -->
                    <!-- Texts container -->
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title"><i class="bg"></i>Vilasi Comforts, Tumkur</h4>
                            <h5 class="title1"><i class="bg"></i>A/C & NON - A/C Deluxe Bed Rooms </h5>
                            <!-- /Text title -->
                        </div>
                    </div>
                    <!-- /Texts container -->
                </div>
                <!-- /Duplicate to create more slides -->
                <div class="slide">
                    <img src="images/Room2.jpg" alt="" />
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title"><i class="bg"></i>Suit Room </h4>
                            <h5 class="title1"><i class="bg"></i>Luxury Room for five Persons </h5>
                            <!-- /Text title -->
                        </div>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/Room3.jpg" alt="" />
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title"><i class="bg"></i>A/C & NON-A/C Double Bed Room </h4>
                            <h5 class="title1"><i class="bg"></i>Luxury Room for Two Persons </h5>
                            <!-- /Text title -->
                        </div>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/Room4.jpg" alt="" />
                    <div class="slide_content">
                        <div class="slide_content_wrap">
                            <!-- Text title -->
                            <h4 class="title"><i class="bg"></i>A/C & NON-A/C Single Bed Room  </h4>
                            <h5 class="title1"><i class="bg"></i>Luxury Room for Single Person </h5>
                            <!-- /Text title -->
                        </div>
                    </div>
                </div>
                <!--/slide -->
            </div>
            <div class="timers"></div>
            <div class="slidePrev"><span></span></div>
            <div class="slideNext"><span></span></div>
        </div>
        <!--/slider -->
    </div>

    <!--start main -->
    <div class="main_bg">
        <div class="wrap">
            <div class="online_reservation text-justify">
                <div>
                    <br />
                    <div class="col-lg-3">
                        <div class="panel panel-default">
                            <div class="panel panel-heading">
                                <div class="text-capitalize text-center reserve">RESERVATION:</div>
                            </div>
                            <div class=" panel panel-body">

                                <h5>Check-In-Date:</h5>
                                <asp:TextBox ID="TxtTodayDate" runat="server" Style="display: none"></asp:TextBox>
                                <asp:TextBox ID="TxtCheckIn" runat="server" CssClass="form-control textbox" placeholder="MM/DD/YYYY" MaxLength="10" ForeColor="Black"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvCheckInInfo"
                                    ControlToValidate="TxtCheckIn" Text="*" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="Availability"></asp:RequiredFieldValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckIn" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckIn" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckIn" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                                <h5>Check-Out-Date:</h5>
                                <asp:TextBox ID="TxtCheckOut" runat="server" CssClass="form-control textbox" placeholder="MM/DD/YYYY" MaxLength="10" ForeColor="Black"></asp:TextBox>
                                <asp:RequiredFieldValidator runat="server" ID="RfvCheckOutInfo"
                                    ControlToValidate="TxtCheckOut" Text="*" Font-Size="10px"
                                    ForeColor="Red" ValidationGroup="Availability"></asp:RequiredFieldValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderCheckOut" runat="server" Format="MM/dd/yyyy"
                                    TargetControlID="TxtCheckOut" CssClass="calenderAjax">
                                </Ajax:CalendarExtender>
                                <asp:CompareValidator ID="CompareValidatorCheckOut" runat="server" ControlToValidate="TxtCheckOut" Operator="GreaterThanEqual"
                                    ControlToCompare="TxtCheckIn" ValidationGroup="Availability" ForeColor="Red" Type="Date" Font-Size="10px"
                                    Text="CheckOut Date should be Greater than or Same as CheckIn Date!!"></asp:CompareValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="TxtCheckOut" ValidationExpression="^(\d\d|\d)[- /.](\d\d|\d)[- /.](19|20)\d\d$"
                                    ErrorMessage="Invalid date format." ForeColor="Red" ValidationGroup="book" Font-Size="10px" />
                                <h5>Type Of Room:</h5>
                                <asp:DropDownList ID="DdlRoomType" runat="server" CssClass="frm-field required form-control" AppendDataBoundItems="true" Width="235px">
                                    <asp:ListItem Text="--Select Room Type--" Value="0"></asp:ListItem>
                                    <%-- <asp:ListItem Text="Non AC Double Room" Value="1250"></asp:ListItem>
                                        <asp:ListItem Text="No AC Single Room" Value="900"></asp:ListItem>
                                        <asp:ListItem Text="AC Double Room" Value="1990"></asp:ListItem>
                                        <asp:ListItem Text="Suit Room" Value="3000"></asp:ListItem>--%>
                                </asp:DropDownList>
                                <br />
                                <h5>Adults:</h5>
                                <asp:TextBox ID="TxtAdults" runat="server" placeholder="Members" CssClass="frm-field required form-control" ForeColor="Black" MaxLength="2"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionAdults" runat="server" ControlToValidate="TxtAdults"
                                    ValidationExpression="^[0-9]+$" ErrorMessage="Enter Numeric Value!!" Font-Size="10px"
                                    ValidationGroup="book" ForeColor="Red"></asp:RegularExpressionValidator>
                                <br />
                                <asp:Button ID="BtnCheck" runat="server" CssClass="btn btn-info" Text="Check Availability" ValidationGroup="Availability" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <p class="text-capitalize text-center headvilasi">WELCOME TO VILASI COMFORTS, TUMKUR</p>
                        <div>
                            <div class="col-lg-3">
                                <div class="img-responsive img-thumbnail">
                                    <img src="Images/Room1.jpg" alt="" />
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <p class="text-justify">
                                    Come alone or Bring your family with you, stay here for a night or for a weeks, Stay here while on Business trip or at some kind of conference - either way our lodge is the best possible varient.
                                </p>
                                <br />
                                <p class="text-justify">
                                    Feel free to contact us Anytime in case you have any questions or concerns.
                                </p>
                            </div>
                        </div>
                        <div>
                            <%--<br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />--%>
                            <div class="welcome"></div>
                            <div class="col-lg-4">
                                <br />
                                <div class="text-capitalize spcl">SPECIAL SERVICES:</div>
                                <br />
                                <ul class="services">
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;24/7 Hot Water Available</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Wifi Internet Access</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;All types of Books Available for Reading</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Complimentary Mineral Water Bottle</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Complimentary Breakfast</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Laundry Service</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Dry Cleaning</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Taxi Facilities</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Airport Transportation</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Tourism Guidance Inside & Outskirts of City</span></li>
                                    <li><span class="fa fa-mail-forward">&nbsp;&nbsp;Rooms on Monthly Basis</span></li>
                                </ul>
                            </div>
                            <div class="col-lg-4 text-">
                                <br />
                                <div class="text-capitalize spcl">LOCATION :</div>
                                <br />
                                <div class="services">
                                    <p class="fa fa-home">&nbsp;Vilasi Comforts,</p>
                                    <br />
                                    <p class="fa fa-circle">&nbsp;Sri Shivakumara Swamy Circle,</p>
                                    <br />
                                    <p class="fa fa-road">&nbsp;B.H. Road, Tumkur</p>
                                    <br />
                                    <br />
                                    <div class="text-capitalize spcl">CONTACT US :</div>
                                    <br />
                                    <p class="fa fa-phone">&nbsp;&nbsp;0816- 2255789,2277589</p>
                                    <br />
                                    <p class="fa fa-envelope"><a href="mailto:info@vilasicomforts.com">&nbsp;info@vilasicomforts.com</a>,<a href="mailto:vilasicomforts.tumkur@gmail.com"><br />&nbsp;&nbsp;&nbsp;&nbsp; vilasicomforts.tumkur@gmail.com</a></p>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <br />
                                <div class="text-capitalize spcl">REACH US :</div>
                                <br />
                                <div class="img-thumbnail text-center img-responsive">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d7764.286734280267!2d77.10479363549359!3d13.341356597624294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e6!4m5!1s0x3bb02e8280d39e31%3A0xf0949612e7bb243b!2sTumakuru+KSRTC+Bus+Stand%2C+Ashoka+Road%2C+Tumkur%2C+Tumakuru%2C+Karnataka!3m2!1d13.341033999999999!2d77.1021305!4m5!1s0x3bb02c3af2aaa853%3A0x2083e3936c8ee0cd!2sVilasi+Comforts%2C+Tumakuru%2C+Karnataka!3m2!1d13.337931999999999!2d77.116115!5e0!3m2!1sen!2sin!4v1440416776654" width="250" height="200" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="b_room">
                    <div class="clear"></div>
                </div>




            </div>
        </div>

    </div>
    <!--start main -->
</asp:Content>
