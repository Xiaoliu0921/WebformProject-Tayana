<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="tayana.ForeStage.News" %>

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
    <div class="box2_list">
        <ul>

            <asp:Repeater ID="RepeaterNewsList" runat="server">

                <ItemTemplate>
                    <li>
                        <div class="list01">
                            <ul>
                                <li>
                                    <div style="position:relative;">
                                        <p>
                                            <img style="width: 187px; height: 121px;" src="<%#Eval("ImagePath").ToString() %>" alt="&quot;&quot;" />
                                        </p>
                                        <%#ShowTopTag(Convert.ToBoolean(Eval("IsTop"))) %>
                                    </div>
                                </li>
                                <li>
                                    <span><%#Eval("Release Date").ToString() %></span>
                                    <br />
                                    <a href="NewsContent.aspx?NewsId=<%#Eval("Id").ToString() %>"><%#Eval("Title").ToString() %></a>
                                </li>
                                <br />
                                <li><%#ReplaceHtml(Eval("Content").ToString())%></li>
                            </ul>
                        </div>
                    </li>
                </ItemTemplate>

            </asp:Repeater>
        </ul>
        <br />

        <div class="pagenumber">
            <asp:Literal ID="LiteralPages" runat="server"></asp:Literal>
        </div>
        <div class="pagenumber1">
            <asp:Literal ID="LiteralNowPages" runat="server"></asp:Literal>
        </div>


    </div>
</asp:Content>
