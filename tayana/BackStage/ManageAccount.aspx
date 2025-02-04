<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage/BackMaster.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="tayana.BackStage.ManageAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPanel" runat="server">

    <asp:Panel ID="PanelEditAccount" runat="server" Visible="False">
        <div class="editModel2">
            <div class="editModelContent2">
                <asp:HiddenField ID="HiddenFieldAccountId" runat="server" />

                <asp:Label ID="LblPanelTitle" runat="server" Text="Add / Edit Account" CssClass="editTitle"></asp:Label>

                <div style="display: flex; justify-content: center;">

                    <div style="width:40%;margin-right:5%">
                        帳號：
                        <asp:TextBox ID="TextBoxAccount" runat="server" CssClass="form-control" Width="65%"></asp:TextBox>
                        <br />
                        <br />
                        姓名：
                        <asp:TextBox ID="TextBoxName" runat="server" CssClass="form-control" Width="65%"></asp:TextBox>
                        <br />
                        <br />
                        Email：
                        <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
                        <br /><br />
                    </div>

                    <div style="width:40%;margin-right:5%">
                        密碼：
                        <asp:TextBox ID="TextBoxPassword" runat="server" CssClass="form-control" Width="65%" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Literal ID="LiteralPasswordCheck" runat="server" Text="確認密碼："></asp:Literal>
                        <asp:TextBox ID="TextBoxPasswordCheck" runat="server" CssClass="form-control" Width="65%" TextMode="Password"></asp:TextBox>
                        <br />
                        <br />


                    </div>
                </div>


                <div style="display: flex; justify-content: center;">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="確認" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonCancel" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCancel_Click" />
                </div>

            </div>
        </div>


    </asp:Panel>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMainTitle" runat="server">
    <h4>Account</h4>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <asp:HiddenField ID="HiddenFieldLoginId" runat="server" />
    <asp:Button ID="BtnCallPanelAddUser" runat="server" Text="Add a User" CssClass="btn btn-success" OnClick="BtnCallPanelAddUser_Click" Visible="False" />
    <br />
    <br />
    <asp:GridView ID="GridViewAccount" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="GridViewAccount_RowDeleting" OnRowEditing="GridViewAccount_RowEditing" OnRowDataBound="GridViewAccount_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Row" HeaderText="序號"  ReadOnly="True" SortExpression="Id"  />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Account" SortExpression="Account">
                <ItemTemplate>
                    <asp:Label ID="LabelGvAccount" runat="server" Text='<%# Bind("Account") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" ReadOnly="True" />
            <asp:CheckBoxField DataField="MaxPower" HeaderText="MaxPower" SortExpression="MaxPower" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>
