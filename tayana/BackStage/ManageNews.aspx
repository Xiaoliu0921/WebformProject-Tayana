<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage/BackMaster.Master" AutoEventWireup="True" CodeBehind="ManageNews.aspx.cs" Inherits="tayana.BackStage.ManageNews" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPanel" runat="server">
    <asp:Panel ID="PanelEdit" runat="server" Visible="False">
        <div class="editModel">
            <div class="editModelContent">
                <asp:Label ID="LblPanelTitle" runat="server" Text="Add / Edit" CssClass="editTitle"></asp:Label>
                <div style="font-size: 1.25rem;">
                    Title：<asp:TextBox ID="TextBoxTitle" CssClass="form-control" runat="server" Width="800px"></asp:TextBox>
                    <br />
                    <br />
                    Release Date：<asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" TextMode="Date" Width="180px"></asp:TextBox>
                    <br />
                    <br />
                    Content：<br />
                    <CKEditor:CKEditorControl ID="CKEditorContent" runat="server" BasePath="/Scripts/ckeditor/" Width="900px" Height="400px"
                        Toolbar="|Source|-|Undo|Redo|-|/
                        |Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
                        NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
                        /
                        Styles|Format|Font|FontSize
                        TextColor|BGColor
                        Link|">
                    </CKEditor:CKEditorControl>
                    <div id="NewsImageDiv"></div>
                    <br />
                    <br />
                    <div style="display: flex;">
                        <div style="width: 48%">
                            上傳圖片：<asp:FileUpload ID="FileUploadImage" CssClass="form-control" runat="server" AllowMultiple="True" />
                            <br />
                            <br />
                            <asp:GridView ID="GridViewImages" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" Width="80%" OnRowDeleting="GridViewImages_RowDeleting" OnRowDataBound="GridViewImages_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Column1" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:TemplateField HeaderText="圖片" SortExpression="ImagePath">
                                        <ItemTemplate>
                                            <img src="<%# Eval("ImagePath") %>" style="width: 161px; height: 121px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="設定封面" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="RadioButtonCover" runat="server" GroupName="IsCover" OnCheckedChanged="RadioButtonCover_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="刪除" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonDelImg" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div style="width: 48%">
                            上傳檔案：<asp:FileUpload ID="FileUploadFile" CssClass="form-control" runat="server" AllowMultiple="True" />
                            <br />
                            <br />
                            <asp:GridView ID="GridViewFiles" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" Width="80%" OnRowDeleting="GridViewFiles_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:TemplateField HeaderText="檔案名稱" SortExpression="FileName">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonDelFile" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonSubmit" runat="server" Text="確認" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmit_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ButtonCancel" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCancel_Click" />
                        <asp:HiddenField ID="HiddenFieldNewsId" runat="server" />
                        <asp:HiddenField ID="HiddenCoverID" runat="server" />
                        <asp:HiddenField ID="HiddenFieldHasFile" runat="server" />
                        <asp:HiddenField ID="HiddenFieldHasImage" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMainTitle" runat="server">
    <h4>News</h4>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <asp:Button ID="BtnCallAddNews" runat="server" Text="Add a News" CssClass="btn btn-success" OnClick="BtnCallAddNews_Click" />
    <br />
    <br />
    <asp:GridView ID="GridViewNews" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="GridViewNews_RowDeleting" OnRowEditing="GridViewNews_RowEditing" OnRowDataBound="GridViewNews_RowDataBound">
        <Columns>
            <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ReadOnly="True" />
            <asp:TemplateField HeaderText="Thumbnail" SortExpression="ImagePath">
                <ItemTemplate>
                    <img src="<%# Eval("ImagePath").ToString() %>" style="width: 161px; height: 121px;" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否置頂">
                <ItemTemplate>
                    &nbsp;&nbsp&nbsp;&nbsp<asp:CheckBox ID="CheckBoxTop" runat="server" OnCheckedChanged="CheckBoxTop_CheckedChanged" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Release Date" SortExpression="NewsDate">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToDateTime(Eval("NewsDate")).ToString("yyyy-MM-dd") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonEditNews" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDeleteNews" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>

</asp:Content>
