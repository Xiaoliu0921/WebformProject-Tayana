<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMasterYacht.master" AutoEventWireup="true" CodeBehind="Yachts_Specification.aspx.cs" Inherits="tayana.ForeStage.Yachts_Specification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <asp:Repeater ID="RepeaterSpecification" runat="server">
        <HeaderTemplate>
            <div class="box5">
                <h4>DETAIL SPECIFICATION</h4>
        </HeaderTemplate>
        <ItemTemplate>
            <p><%#Eval("Name").ToString() %></p>
            <ul>
                <%#Eval("Item").ToString() %>
            </ul>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <p class="topbuttom">
        <a href="#">
            <img src="../ForeMasterMaterial/images/top.gif" alt="top" /></a>
    </p>
</asp:Content>
