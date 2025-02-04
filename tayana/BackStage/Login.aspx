﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tayana.BackStage.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登入管理後台</title>

    <!-- [Meta] -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Datta able is trending dashboard template made using Bootstrap 5 design framework. Datta able is available in Bootstrap, React, CodeIgniter, Angular,  and .net Technologies.">
    <meta name="keywords" content="Bootstrap admin template, Dashboard UI Kit, Dashboard Template, Backend Panel, react dashboard, angular dashboard">
    <meta name="author" content="Codedthemes">

    <!-- [Favicon] icon -->
    <link rel="icon" href="../BackMasterMaterial/assets/images/favicon.svg" type="image/x-icon">
    <!-- [Font] Family -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
    <!-- [Tabler Icons] https://tablericons.com -->
    <link rel="stylesheet" href="../BackMasterMaterial/assets/fonts/tabler-icons.min.css">
    <!-- [Feather Icons] https://feathericons.com -->
    <link rel="stylesheet" href="../BackMasterMaterial/assets/fonts/feather.css">
    <!-- [Font Awesome Icons] https://fontawesome.com/icons -->
    <link rel="stylesheet" href="../BackMasterMaterial/assets/fonts/fontawesome.css">
    <!-- [Material Icons] https://fonts.google.com/icons -->
    <link rel="stylesheet" href="../BackMasterMaterial/assets/fonts/material.css">
    <!-- [Template CSS Files] -->
    <link rel="stylesheet" href="../BackMasterMaterial/assets/css/style.css" id="mainStyleLink">
    <link rel="stylesheet" href="../BackMasterMaterial/assets/css/style-preset.css">
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-14K1GBX9FG"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-14K1GBX9FG');
</script>
    <!-- WiserNotify -->
    <script>
        !(function () {
            if (window.t4hto4) console.log('WiserNotify pixel installed multiple time in this page');
            else {
                window.t4hto4 = !0;
                var t = document,
                    e = window,
                    n = function () {
                        var e = t.createElement('script');
                        (e.type = 'text/javascript'),
                            (e.async = !0),
                            (e.src = 'https://pt.wisernotify.com/pixel.js?ti=1jclj6jkfc4hhry'),
                            document.body.appendChild(e);
                    };
                'complete' === t.readyState ? n() : window.attachEvent ? e.attachEvent('onload', n) : e.addEventListener('load', n, !1);
            }
        })();
</script>
    <!-- Microsoft clarity -->
    <script type="text/javascript">
        (function (c, l, a, r, i, t, y) {
            c[a] =
                c[a] ||
                function () {
                    (c[a].q = c[a].q || []).push(arguments);
                };
            t = l.createElement(r);
            t.async = 1;
            t.src = 'https://www.clarity.ms/tag/' + i;
            y = l.getElementsByTagName(r)[0];
            y.parentNode.insertBefore(t, y);
        })(window, document, 'clarity', 'script', 'gkn6wuhrtb');
</script>
</head>
<body data-pc-preset="preset-1" data-pc-sidebar-caption="true" data-pc-direction="ltr" data-pc-theme="light">
    <form id="form1" runat="server">
    <!-- [ Pre-loader ] start -->
    <div class="loader-bg">
        <div class="loader-track">
            <div class="loader-fill"></div>
        </div>
    </div>
    <!-- [ Pre-loader ] End -->
    <div class="auth-main">
        <div class="auth-wrapper v1">
            <div class="auth-form">
                <div class="position-relative my-5">
                    <div class="auth-bg">
                        <span class="r"></span>
                        <span class="r s"></span>
                        <span class="r s"></span>
                        <span class="r"></span>
                    </div>
                    <div class="card mb-0">
                        <div class="card-body">
                            <h4 class="text-center f-w-500 mt-4 mb-3">登入後台</h4>
                            <div class="form-group mb-3">
                                <asp:Label ID="lblUserName" runat="server" Text="帳號："></asp:Label>
                                <asp:TextBox ID="TextBoxUsername" class="form-control" runat="server" Width="80%"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="必填!!"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group mb-3">
                                <asp:Label ID="Label2" runat="server" Text="密碼："></asp:Label>
                                <asp:TextBox ID="TextBoxPassword" class="form-control" runat="server" TextMode="Password" Width="80%"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="必填!!"></asp:RequiredFieldValidator>
                            </div>
                            <div style="display:flex;text-align:center" class="text-center mt-4">
                                <asp:Button ID="btnLogin" class="btn btn-primary shadow px-sm-4" runat="server" Text="登入"  Width="45%" OnClick="btnLogin_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="btnIndex" class="form-control" runat="server"  CausesValidation="False" Width="45%" OnClick="btnIndex_Click">取消</asp:LinkButton>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- [ Main Content ] end -->
    <!-- Required Js -->
    <script src="dist/assets/js/plugins/popper.min.js"></script>
    <script src="dist/assets/js/plugins/simplebar.min.js"></script>
    <script src="dist/assets/js/plugins/bootstrap.min.js"></script>
    <script src="dist/assets/js/fonts/custom-font.js"></script>
    <script src="dist/assets/js/pcoded.js"></script>
    <script src="dist/assets/js/plugins/feather.min.js"></script>





    <script>layout_change('light');</script>




    <script>change_box_container('false');</script>


    <script>layout_caption_change('true');</script>




    <script>layout_rtl_change('false');</script>


    <script>preset_change("preset-1");</script>


    <script>layout_theme_sidebar_change('false');</script>

    </form>
</body>
</html>
