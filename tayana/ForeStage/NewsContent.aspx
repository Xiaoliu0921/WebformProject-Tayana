<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="NewsContent.aspx.cs" Inherits="tayana.ForeStage.NewsContent" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHoldermasks" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="../ForeMasterMaterial/images/banner02_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChangePhoto" runat="server">
    <asp:HiddenField ID="HiddenFieldNowPage" runat="server" />
    <ul>
        <li>
            <img src="../ForeMasterMaterial/images/newbanner.jpg" alt="Tayana Yachts" /></li>
    </ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeftBar" runat="server">
    <p><span>NEWS</span></p>
    <ul>
        <li><a href="#">News & Events</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSystemNamePath" runat="server">
    <a href="#">Home</a>
    >> <a href="#">News </a>
    >> <a href="#"><span class="on1">News & Events</span></a>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSystemName" runat="server">
    News & Events
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSystemContent" runat="server">
    <div class="box3">
        <!--內文開始-->
        <asp:Repeater ID="RepeaterContent" runat="server">
            <ItemTemplate>
                <h4><%#Eval("Title").ToString() %></h4>
                <%#Eval("Content").ToString().Replace("<p>","").Replace("</p>","") %>
            </ItemTemplate>
            <FooterTemplate>
                <br />
            </FooterTemplate>
        </asp:Repeater>
        <!--內文結束-->

        <!--下載開始-->
        <asp:Repeater ID="RepeaterFile" runat="server">
            <HeaderTemplate>
                <div class="downloads">
                    <img src="/ForeMasterMaterial/images/downloads.gif" alt="&quot;&quot;" />
                    <ul style="margin-bottom:20px;">
            </HeaderTemplate>

            <ItemTemplate>
                <li><a href="<%#Eval("FilePath").ToString() %>" download="<%#Eval("FileName").ToString() %>"><%#Eval("FileName").ToString() %></a></li>
            </ItemTemplate>

            <FooterTemplate>
                </ul>
             </div>
            </FooterTemplate>
        </asp:Repeater>
        <!--下載結束-->
        <br />
        <br />
        <br />
        <!--圖片開始-->
        <asp:Repeater ID="RepeaterImage" runat="server">
            <ItemTemplate>
                <p style="float: left">
                    <img alt="" src="<%#Eval("ImagePath").ToString() %>" style="width: 660px; height: 438px;">
                </p>
            </ItemTemplate>
            <FooterTemplate>
                <br />
            </FooterTemplate>
        </asp:Repeater>
        <!--圖片結束-->
    </div>
    <!--內容完全結束-->

    <!--返回按鈕-->
    <div class="buttom001">
        <a href="javascript:window.history.back();">
            <img src="/ForeMasterMaterial/images/back.gif" alt="&quot;&quot;" width="55" height="28" />
        </a>
    </div>


</asp:Content>
