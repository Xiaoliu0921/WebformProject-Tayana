<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMasterYacht.master" AutoEventWireup="true" CodeBehind="Yacht.aspx.cs" Inherits="tayana.ForeStage.Yacht" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">

    <asp:Repeater ID="RepeaterOverviewAndDimensionTitle" runat="server">
        <ItemTemplate>
            <div class="box1">
                <%#Eval("OverView").ToString() %>
            <br />
            <br />
            </div>
            <div class="box3">
                <h4><%#Eval("ModelLength").ToString() %> DIMENSION</h4>
        </ItemTemplate>
    </asp:Repeater>
    <table class="table02">
        <tr>
            <td class="table02td01">
                <table>
                    <asp:Repeater ID="RepeaterDimension" runat="server">
                        <ItemTemplate>
                            <tr>
                                <th><%#Eval("Item").ToString() %></th>
                                <td><%#Eval("Value").ToString() %></td>
                            </tr>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <tr class="tr003">
                                <th><%#Eval("Item").ToString() %></th>
                                <td><%#Eval("Value").ToString() %></td>
                            </tr>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                </table>
            </td>
            <td>
                <asp:Literal ID="LiteralDimensionImage" runat="server"></asp:Literal>

            </td>
        </tr>
    </table>
    </div>

                    <!--下載開始-->
    <asp:Repeater ID="RepeaterDownload" runat="server">
        <HeaderTemplate>
            <div class="downloads">
                <p>
                    <img src="../ForeMasterMaterial/images/downloads.gif" alt="&quot;&quot;" />
                </p>
                <ul>
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

    <p class="topbuttom">
        <a href="#"><img src="../ForeMasterMaterial/images/top.gif" alt="top" /></a>
    </p>


</asp:Content>
