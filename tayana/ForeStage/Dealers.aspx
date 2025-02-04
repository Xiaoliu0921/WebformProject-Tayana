<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="Dealers.aspx.cs" Inherits="tayana.ForeStage.Dealers" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHoldermasks" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="../ForeMasterMaterial/images/banner02_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChangePhoto" runat="server">
    <asp:HiddenField ID="HiddenFieldCountryId" runat="server" />
    <asp:HiddenField ID="HiddenFieldCountryName" runat="server" />
    <ul>
        <li>
            <img src="../ForeMasterMaterial/images/newbanner.jpg" alt="Tayana Yachts" /></li>
    </ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeftBar" runat="server">
    <p><span>DEALERS</span></p>
    <ul>
        <asp:Repeater ID="RepeaterLeftBar" runat="server">
            <ItemTemplate>
                <li><a href="Dealers.aspx?Id=<%#Eval("Id").ToString() %>"><%#Eval("Country").ToString() %></a></li>
            </ItemTemplate>
        </asp:Repeater>
        
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSystemNamePath" runat="server">
    <a href="Index.aspx">Home</a>
    >> <a href="#">Dealers </a>
    >> <a href="#"><span class="on1">
        <asp:Literal ID="LiteralPathName" runat="server"></asp:Literal></span></a>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSystemName" runat="server">
    <asp:Literal ID="LiteralSystemName" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSystemContent" runat="server">
    <div class="box2_list">
        <ul>
            <asp:Repeater ID="RepeaterDealers" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="list02">
                            <ul>
                                <li class="list02li">
                                    <div>
                                        <p>
                                            <img style="width:209px;height:157px;" src="<%#Eval("ImagePath").ToString() %>" />>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <span><%#Eval("Area").ToString() %></span><br />
                                    <%#Eval("Name").ToString() %><br />
                                    <%#Eval("Content").ToString() %>

                                </li>
                            </ul>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</asp:Content>
