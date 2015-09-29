<%@ Page Title="Gallery" Language="vb" AutoEventWireup="false" MasterPageFile="~/VIlasi.Master" CodeBehind="Gallery.aspx.vb" Inherits="VilasiComforts.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#nivo-lightbox-demo a').nivoLightbox({ effect: 'fade' });
        });
    </script>
    <style>
        .work-grid{
            padding-bottom:15px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:100px;">
        <div class="portfolio">
            <h2>Non-AC Double Room</h2>
            <div class="products-bottom">
                <div class="col-md-4 col-sm-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/118.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/118.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/121.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/121.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/122t.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/122.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="portfolio">
            <h2>Non-AC Single Rooms</h2>
            <div class="products-bottom">
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/124.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/124.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/111.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/111.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/126.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/126.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
    <div class="container">
        <div class="portfolio">
            <h2>AC Double Rooms</h2>
            <div class="products-bottom">
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/111.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/111.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/113.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/113.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/114.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/114.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div class="portfolio">
            <h2>Suit Rooms</h2>
            <div class="products-bottom">
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/116.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/116.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/117.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/117.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4 work-grid">
                    <div id="nivo-lightbox-demo">
                        <a href="Images/126.jpg" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo">
                            <img src="Images/126.jpg" class="img-responsive " alt="" />
                            <div class="rotate">
                                <i></i>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
