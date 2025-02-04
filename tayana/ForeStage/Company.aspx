<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="tayana.ForeStage.Company" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHoldermasks" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="../ForeMasterMaterial/images/banner02_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChangePhoto" runat="server">
    <ul>
        <li>
            <img src="../ForeMasterMaterial/images/newbanner.jpg" alt="Tayana Yachts" /></li>
    </ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeftBar" runat="server">
    <p><span>COMPANY</span></p>
    <ul>
        <li><a href="Company.aspx">About Us</a></li>
        <li><a href="Compan1.aspx">Certificate</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSystemNamePath" runat="server">
    <a href="#">Home</a>
    >> <a href="#">COMPANY</a>
    >> <a href="#"><span class="on1">About Us</span></a>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSystemName" runat="server">
    About Us
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSystemContent" runat="server">
    <asp:Repeater ID="RepeaterContent" runat="server">
        <ItemTemplate>
            <div class="box3">
                <h4><%#Eval("Title").ToString() %></h4>
                <p>
                    <img src="<%#Eval("ImagePath").ToString() %>" alt="&quot;&quot;" width="274" height="192" />
                </p>
                <%#Eval("Content").ToString().Replace("<p>","").Replace("</p>","") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
