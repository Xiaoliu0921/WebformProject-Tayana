<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage/BackMaster.Master" AutoEventWireup="true" CodeBehind="ManageCompany.aspx.cs" Inherits="tayana.BackStage.ManageCompany" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPanel" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMainTitle" runat="server">
    <h4>Company</h4>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <asp:Button ID="BtnCallPanelAboutUs" runat="server" Text="About us" CssClass="btn btn-success" OnClick="BtnCallPanelAboutUs_Click" />
    <asp:Button ID="BtnCallPanelCertificate" runat="server" Text="Certificate" CssClass="btn btn-success" OnClick="BtnCallPanelCertificate_Click" />
    <br />
    <br />
    <asp:Panel ID="PanelAboutUs" runat="server">
        <h4>【About us】</h4>
        <br />
        標題：<asp:TextBox ID="TextBoxAboutTitle" CssClass="form-control" runat="server" Width="500px"></asp:TextBox>
        <br />
        <br />
        內容：
        <CKEditor:CKEditorControl ID="CKEditorControlAboutUs" runat="server" BasePath="/Scripts/ckeditor/" Width="80%" Height="400px"
            Toolbar="|Source|-|Undo|Redo|-|/
            |Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
        /
        Styles|Format|Font|FontSize
        TextColor|BGColor
        Link|">
        </CKEditor:CKEditorControl>
        <br />
        <br />
        目前顯示圖片：<asp:Image ID="ImageAbout" runat="server" Height="300px" />
        <br />
        <br />
        更換圖片：
        <asp:FileUpload ID="FileUploadAboutUs" CssClass="form-control" runat="server" />
        <br />
        <br />
        <asp:Button ID="ButtonEditAbout" CssClass="btn btn-info" runat="server" Text="確認編輯" OnClick="ButtonEditAbout_Click" />
        <br />
        <br />
    </asp:Panel>


    <asp:Panel ID="PanelCertificate" runat="server" Visible="False">
        <h4>【Certificate】</h4>
        <br />
        內容：
        <CKEditor:CKEditorControl ID="CKEditorControlCertificate" runat="server" BasePath="/Scripts/ckeditor/" Width="80%" Height="400px"
            Toolbar="|Source|-|Undo|Redo|-|/
            |Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
            NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
            /
            Styles|Format|Font|FontSize
            TextColor|BGColor
            Link|">
        </CKEditor:CKEditorControl>
        <br />
        <asp:Button ID="ButtonEditCertificate" CssClass="btn btn-info" runat="server" Text="確認修改文章" OnClick="ButtonEditCertificate_Click" />
        <br />
        <br />
        圖片：
        <asp:GridView ID="GridViewCertificateImage" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" ShowHeader="False" Width="80%" OnRowDeleting="GridViewCertificateImage_RowDeleting">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:TemplateField HeaderText="ImagePath" SortExpression="ImagePath">
                    <ItemTemplate>
                        <p style="text-align: center;">
                            <img style="height: 400px;" src="<%# Eval("ImagePath") %>" />
                        </p>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <h4>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                        </h4>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        新增圖片：
        <asp:FileUpload ID="FileUploadCertificate" CssClass="form-control" runat="server" AllowMultiple="True" />
        <asp:Button ID="ButtonAddImage" CssClass="btn btn-info" runat="server" Text="確認新增圖片" OnClick="ButtonAddImage_Click" />

    </asp:Panel>

</asp:Content>
