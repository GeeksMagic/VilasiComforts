<%@ Page Title="Services" Language="vb" AutoEventWireup="false" MasterPageFile="~/VIlasi.Master" CodeBehind="Services.aspx.vb" Inherits="VilasiComforts.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main_bg" style="margin-top:100px;">
        <div class="wrap">
            <div class="main">
                <div class="content">
                    <div class="room">
                        <h4>Vilasi comforts A/C Deluxe Rooms</h4>
                        <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                    </div>
                    <div class="grids_of_2">
                        <div class="grids_of_img" style="padding-bottom:8px;">
                            <img src="images/118.jpg" alt="" />
                        </div>
                        <div class="grids_of_para">
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="grids_of_2">
                        <div class="grids_of_img" style="padding-bottom:8px;">
                            <img src="images/121.jpg" alt="" />
                        </div>
                        <div class="grids_of_para">
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="grids_of_2">
                        <div class="grids_of_img" style="padding-bottom:8px;">
                            <img src="images/122.jpg" alt="" />
                        </div>
                        <div class="grids_of_para">
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="grids_of_2">
                        <div class="grids_of_img" style="padding-bottom:8px;">
                            <img src="images/124.jpg" alt="" />
                        </div>
                        <div class="grids_of_para">
                            <p class="text-justify">Room Service, Multilingual Staff, 24/7 Hot Water Available, Wifi Internet Access, Complimentary Mineral Water Bottle, Food on Request, Laundry Service, Dry Cleaning, Rooms on Monthly Basis.</p>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="grids_of_2">
                        <div class="grids_of_para">
                            <h4>Note :</h4>
                            <p class="para">
                                We are not responsible for your Gold, Cash, Luggage & Valuable Articles
                                <br />
                                Deposit your Gold, Cash Valuable Articles at Reception Counter
                                <br />
                                Gambling is Strictly Prohibited in the Room
                            </p>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="sidebar">
                    <div class="date_btn">
                        <asp:Button ID="BookNow" runat="server" Text="Book Now" Width="82px" CssClass="btn btn-info" PostBackUrl="~/BookRoom.aspx" />
                    </div>
                    <h2><span style="font-style: italic; font-weight: 100; color: #2b3930">AMENITIES </span></h2>
                    <ul class="s_nav">
                        <li><span class="fa fa-shield">&nbsp;Room Service</span> </li>
                        <li><span class="fa fa-users">&nbsp;Multilingual Staff</span></li>
                        <li><span class="fa fa-bitbucket">&nbsp;24/7 Hot Water Available</span></li>
                        <li><span class="fa fa-wifi">&nbsp;Wifi Internet Access</span></li>
                        <li><span class="fa fa-book">&nbsp;All types of Books Available for Reading</span></li>
                        <li><span class="fa fa-glass">&nbsp;Complimentary Mineral Water Bottle</span></li>
                        <li><span class="fa fa-briefcase">&nbsp;Complimentary Breakfast (AC Deluxe Rooms)</span></li>
                        <li><span class="fa fa-shield">&nbsp;Food on Request</span></li>
                        <li><span class="fa fa-shield">&nbsp;Laundry Service</span></li>
                        <li><span class="fa fa-ils">&nbsp;Dry Cleaning</span></li>
                        <li><span class="fa fa-cab">&nbsp;Taxi Facilities</span></li>
                        <li><span class="fa fa-globe">&nbsp;Airport Transportation</span></li>
                        <li><span class="fa fa-video-camera">&nbsp;Tourism Guidance Inside & Outskirts of City</span></li>
                        <li><span class="fa fa-info-circle">&nbsp;Rooms on Monthly Basis</span></li>
                        <li><span class="fa fa-adjust">&nbsp;BTC (Bill Through Company)</span></li>
                    </ul>
                    <h4>we accept all  types of credit & debit cards</h4>
                    <ul class="s_nav1">
                        <li><a class="icon1"></a></li>
                        <li><a class="icon2"></a></li>
                        <li><a class="icon3"></a></li>
                        <li><a class="icon4"></a></li>
                    </ul>
                    <h2><span style="font-style: italic; font-weight: 100; color: #2b3930">TARRIF CARD</span></h2>
                    <h6>(Incl. of all taxes)</h6>
                    <ul class="s_nav">
                        <li><span class="fa fa-arrow-circle-o-right">&nbsp;<asp:Label ID="LblNonAc" runat="server"></asp:Label> : ₹ <asp:Label ID="LblNonAcPrice" runat="server"></asp:Label></span></li>
                       <%-- <li><span class="fa fa-arrow-circle-o-right">&nbsp;Non-AC Single Room : ₹ 900</span></li>--%>
                        <li><span class="fa fa-arrow-circle-o-right">&nbsp;<asp:Label ID="LblAcDouble" runat="server"></asp:Label> : ₹ <asp:Label ID="LblAcDoublePrice" runat="server"></asp:Label></span></li>
                        <li><span class="fa fa-arrow-circle-o-right">&nbsp;<asp:Label ID="LblSuit" runat="server"></asp:Label> : ₹ <asp:Label ID="LblSuitPrice" runat="server"></asp:Label></span></li>
                        <li><span class="fa fa-arrow-circle-o-right">&nbsp;<asp:Label ID="LblExtraBed" runat="server"></asp:Label> : ₹ <asp:Label ID="LblExtraBedPrice" runat="server"></asp:Label></span></li>
                        <li><span class="fa fa-arrow-circle-o-right">&nbsp;<asp:Label ID="LblExtraPerson" runat="server"></asp:Label> : ₹ <asp:Label ID="LblExtraPersonPrice" runat="server"></asp:Label></span></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</asp:Content>
