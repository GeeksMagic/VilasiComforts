<%@ Page Title="Contact" Language="vb" AutoEventWireup="false" MasterPageFile="~/VIlasi.Master" CodeBehind="ContactUs.aspx.vb" Inherits="VilasiComforts.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
body
{
    margin: 0;
    padding: 0;
    font-family: Arial;
}
.modal
{
    position: fixed;
    z-index: 999;
    height: 100%;
    width: 100%;
    top: 0;
    background-color: Black;
    filter: alpha(opacity=60);
    opacity: 0.6;
    -moz-opacity: 0.8;
}
.center
{
    z-index: 1000;
    margin: 300px auto;
    padding: 10px;
    width: 130px;
    background-color: White;
    border-radius: 10px;
    filter: alpha(opacity=100);
    opacity: 1;
    -moz-opacity: 1;
}
.center img
{
    height: 128px;
    width: 128px;
}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdContactForm">
        <ProgressTemplate>
            <div class="modal">
                <div class="center">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="main_bg" style="margin-top: 100px;">
        <div class="wrap">
            <div class="main">
                <div class="contact">

                    <div class="contact_right">
                        <div class="col-lg-6">
                            <img src="images/Build.jpg" alt="" />
                        </div>
                        <div class="col-lg-6">

                            <asp:UpdatePanel ID="UpdContactForm" runat="server" UpdateMode="Conditional">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnSubmit" />
                                </Triggers>
                                <ContentTemplate>


                                    <div class="contact-form">
                                        <h3>Contact Us</h3>

                                        <div>
                                            <span>
                                                <label>NAME</label></span>
                                            <span>
                                                <asp:TextBox ID="TxtUserName" runat="server" CssClass="form-control" placeholder="Name" MaxLength="40"></asp:TextBox></span>
                                            <asp:RequiredFieldValidator runat="server" ID="RfvUserName"
                                                ControlToValidate="TxtUserName" Text="*"
                                                ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                        </div>
                                        <div>
                                            <span>
                                                <label>E-MAIL</label></span>
                                            <span>
                                                <asp:TextBox ID="TxtUserEmail" runat="server" CssClass="form-control" placeholder="E-Mail" MaxLength="40"></asp:TextBox></span>
                                            <asp:RequiredFieldValidator runat="server" ID="RfvUserEmail"
                                                ControlToValidate="TxtUserEmail" Text="*"
                                                ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpEmail" runat="server" ControlToValidate="TxtUserEmail"
                                                ValidationExpression="^[a-zA-Z0-9]+.[a-zA-Z0-9]*@[a-zA-Z]+.(com|org|in|jp|co.in)$" ErrorMessage="Invalid Email!!"
                                                ValidationGroup="Contact" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                        <div>
                                            <span>
                                                <label>MOBILE</label></span>
                                            <span>
                                                <asp:TextBox ID="TxtPhone" runat="server" CssClass="form-control" placeholder="Mobile" MaxLength="10"></asp:TextBox></span>
                                            <asp:RequiredFieldValidator runat="server" ID="RfvPhone"
                                                ControlToValidate="TxtPhone" Text="*"
                                                ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionMobile" runat="server" ControlToValidate="TxtPhone"
                                                ValidationExpression="^[0-9]+$" ErrorMessage="Enter Valid Mobile Number!!"
                                                ValidationGroup="Contact" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </div>
                                        <div>
                                            <span>
                                                <label>SUBJECT</label></span>
                                            <span>
                                                <asp:TextBox ID="TxtUsrMessge" runat="server" Rows="5" TextMode="MultiLine" placeholder="Message" CssClass="form-control"></asp:TextBox></span>
                                            <asp:RequiredFieldValidator runat="server" ID="RfvUsrMessge"
                                                ControlToValidate="TxtUsrMessge" Text="*"
                                                ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                        </div>
                                        <div>
                                            <span>
                                                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" ValidationGroup="Contact" />
                                            </span>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

                    </div>
                    <div class="contact_left">
                        <div class="contact_info">
                            <h3>Find Us Here</h3>
                            <div class="map">

                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3882.198388461758!2d77.11611500000002!3d13.337932!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bb02c3af2aaa853%3A0x2083e3936c8ee0cd!2sVilasi+Comforts!5e0!3m2!1sen!2sin!4v1437842707731" width="100%" height="175" frameborder="0" style="border: 0" allowfullscreen></iframe>

                            </div>
                        </div>
                        <div class="company_address">
                            <h3>Address :</h3>
                            <p class="fa fa-home"> &nbsp;Vilasi Comforts,</p> <br />
                            <p class="fa fa-circle">&nbsp;Sri Shivakumara Swamy Circle,</p><br />
                            <p class="fa fa-road">&nbsp;B.H. Road, Tumkur</p><br />
                            <p class="fa fa-phone">&nbsp;Phone:0816- 2255789,2277589</p><br />
                            <p class="fa fa-envelope">&nbsp;Email: <a href="mailto:info@vilasicomforts.com">info@vilasicomforts.com</a> , <a href="mailto:vilasicomforts.tumkur@gmail.com">vilasicomforts.tumkur@gmail.com</a></p>
                            <p class="fa fa-soccer-ball-o">&nbsp;Follow Us: <a href="https://www.facebook.com/VilasiComforts" target="_blank" class="fa fa-facebook-square">&nbsp;Facebook</a>,&nbsp; <a href="http://Twitter.com" target="_blank" class="fa fa-twitter-square">&nbsp;Twitter</a>,&nbsp; <a href="http://plus.google.com" target="_blank" class="fa fa-google-plus-square">&nbsp;Google+</a>,&nbsp; <a href="http://Linkedin.com" target="_blank" class="fa fa-linkedin-square">&nbsp;LinkedIn</a></p>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
