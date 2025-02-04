<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMasterYacht.master" AutoEventWireup="true" CodeBehind="Yacht_Layout.aspx.cs" Inherits="tayana.ForeStage.Yacht_Layout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

    <asp:Repeater ID="RepeaterLayout" runat="server">
        <HeaderTemplate>
            <div class="box6">
                <p>Layout & deck plan</p>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <img style="width: 609px;" src="<%#Eval("ImagePath").ToString() %>" alt="&quot;&quot;" /></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <p class="topbuttom">
        <a href="#">
            <img src="../ForeMasterMaterial/images/top.gif" alt="top" /></a>
    </p>
</asp:Content>
