<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="Compan1.aspx.cs" Inherits="tayana.ForeStage.Compan1" %>

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
    >> <a href="#"><span class="on1">Certificate</span></a>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSystemName" runat="server">
    Certificate
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSystemContent" runat="server">
    <div class="">
        <asp:Repeater ID="RepeaterContent" runat="server">
            <ItemTemplate>

                <%#Eval("Content").ToString().Replace("<p>","").Replace("</p>","") %>
            </ItemTemplate>
        </asp:Repeater>
        <div>
            <ul>
                <asp:Repeater ID="RepeaterImages" runat="server">
                    <ItemTemplate>
                        <li>
                            <p>
                                <img src="<%#Eval("ImagePath").ToString() %>" alt="Tayana " style="width: 600px">
                            </p>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</asp:Content>
