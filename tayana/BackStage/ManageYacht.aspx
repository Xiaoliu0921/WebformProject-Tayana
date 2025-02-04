<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage/BackMaster.Master" AutoEventWireup="true" CodeBehind="ManageYacht.aspx.cs" Inherits="tayana.BackStage.ManageYacht" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPanel" runat="server">
    <!--編輯區域的Panel-->
    <asp:Panel ID="PanelEdit" runat="server" Visible="False">
        <div class="editModel">
            <div class="editModelContent">
                <!--編輯區域的標題-->
                <asp:Label ID="LabelEditPanelTitle" CssClass="editTitle" runat="server" Text="Title"></asp:Label>
                <!--編輯區域的隱藏區塊拿來記錄YachtId的-->
                <asp:HiddenField ID="HiddenFieldYachtId" runat="server" />
                <!--編輯區域的隱藏區塊拿來記錄Yacht型號1的-->
                <asp:HiddenField ID="HiddenFieldYachtModel" runat="server" />
                <!--編輯區域的隱藏區塊拿來記錄Yacht型號2的-->
                <asp:HiddenField ID="HiddenFieldYachtModelLength" runat="server" />
                <!--編輯區域的隱藏區塊拿來記錄Yacht的封面ID(CoverId)的-->
                <asp:HiddenField ID="HiddenFieldCoverId" runat="server" />

                <!--編輯區域共同Header，切換Yacht的各個頁面用的-->
                <asp:Panel ID="PanelEditHeader" runat="server">
                    <asp:Button ID="ButtonCallOverView" runat="server" Text="OverView" CssClass="btn btn-success" OnClick="ButtonCallOverView_Click" />
                    <asp:Button ID="ButtonCallOverViewDimension" runat="server" Text="OverView-Dimension" CssClass="btn btn-success" OnClick="ButtonCallOverViewDimension_Click" />
                    <asp:Button ID="ButtonCallAlbum" runat="server" Text="Album" CssClass="btn btn-success" OnClick="ButtonCallAlbum_Click" />
                    <asp:Button ID="ButtonCallLayout" runat="server" Text="Layout & Deck plan" CssClass="btn btn-success" OnClick="ButtonCallLayout_Click" />
                    <asp:Button ID="ButtonCallSpecification" runat="server" Text="Specification" CssClass="btn btn-success" OnClick="ButtonCallSpecification_Click" />
                    <br />
                    <br />
                </asp:Panel>
                <!--編輯區域共同Header結束-->

                <!--OverView編輯區域-->
                <asp:Panel ID="PanelOverView" runat="server">
                    Yacht Model：
                    <asp:TextBox ID="TextBoxModel" placeholder="Model" CssClass="form-control" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBoxModelLength" placeholder="Length" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Is NewDesign or NewBuilding：
                    <asp:CheckBox ID="CheckBoxNewDesign" Text="New Design" runat="server" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBoxNewBuilding" Text="New Building" runat="server" />
                    <br />
                    <br />
                    OverView Content：<br />
                    <CKEditor:CKEditorControl ID="CKEditorControlOverview" runat="server" BasePath="/Scripts/ckeditor/" Width="80%" Height="400px"
                        Toolbar="|Source|-|Undo|Redo|-|/
                                |Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
                                NumberedList|BulletedList|-|Outdent|Indent|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
                                /
                                Styles|Format|Font|FontSize
                                TextColor|BGColor
                                Link|">
                    </CKEditor:CKEditorControl>

                    <br />
                    <div id="OverviewPanelFile"></div>
                    Download File：
                    <asp:FileUpload ID="FileUploadFile" CssClass="form-control" runat="server" AllowMultiple="True" />
                    <br />
                    <br />
                    <asp:GridView ID="GridViewFiles" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" Width="70%" OnRowCancelingEdit="GridViewFiles_RowCancelingEdit" OnRowDeleting="GridViewFiles_RowDeleting" OnRowEditing="GridViewFiles_RowEditing" OnRowUpdating="GridViewFiles_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:TemplateField HeaderText="FileName" SortExpression="FileName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxFileName" CssClass="form-control" runat="server" Text='<%# Bind("FileName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />

                    <!--首次新增Yacht時，可以選擇Album相片跟Layout相片  編輯Yacht時隱藏-->
                    <asp:Panel ID="PanelAddYachtAlbums" runat="server" Visible="False">
                        Yacht Album Images：
                        <asp:FileUpload ID="FileUploadAddYachtAlbum" CssClass="form-control" runat="server" AllowMultiple="True" />
                        <br />
                        <br />
                        Layout & Deck Plan Images：
                        <asp:FileUpload ID="FileUploadAddYachtLayout" CssClass="form-control" runat="server" AllowMultiple="True" />
                        <br />
                        <br />
                    </asp:Panel>
                    <!--新增Album相片跟Layout相片區塊結束-->

                    <!--確認新增按鈕與取消按鈕(非共通)-->
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonSubmitOverview" runat="server" Text="確認" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmitOverview_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ButtonOverviewCancel" runat="server" Text="關閉" Width="150px" CssClass="btn btn-danger" OnClick="ButtonOverviewCancel_Click" />
                    </div>
                    <!--確認新增按鈕與取消按鈕結束(非共通)-->

                </asp:Panel>
                <!--OverView編輯區域結束-->

                <!--Dimension編輯區域-->
                <asp:Panel ID="PanelDimension" runat="server" Visible="False">
                    <asp:Label ID="LabelDimensionTitle" CssClass="editTitle" runat="server" Text="Yacht："></asp:Label>
                    <div id="EditDimensions" style="width: 100%; display: flex;">
                        <!--Dimension Item-->
                        <div style="width: 59%; padding-top: 10px; padding-left: 1%; padding-right: 1%; border-right: dashed 0.5px gray;">
                            <p class="editTitle">Dimensions Items：</p>
                            <br />
                            <asp:Button ID="ButtonCallAddDimensionItem" runat="server" Text="Add an Dimension" CssClass="btn btn-success" OnClick="ButtonCallAddDimensionItem_Click" />
                            <br />
                            <br />
                            <asp:GridView ID="GridViewDimension" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridViewDimension_RowCancelingEdit" OnRowDeleting="GridViewDimension_RowDeleting" OnRowEditing="GridViewDimension_RowEditing" OnRowUpdating="GridViewDimension_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:TemplateField HeaderText="Item" SortExpression="Item">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxGvDimensionItem"  CssClass="form-control" runat="server" Text='<%# Bind("Item") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelGvDimensionItem" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Value" SortExpression="Value">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxGvDimensionValue" CssClass="form-control" runat="server" Text='<%# Bind("Value") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelGvDimensionValue" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="True" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <br />
                        </div>

                        <!--Dimension Image-->
                        <div style="width: 39%; padding-top: 10px; padding-left: 1%;">
                            <p class="editTitle">Dimensions Image：</p>
                            <br />
                            <asp:FileUpload ID="FileUploadDimensionImage" CssClass="form-control" runat="server"  Width="250px" />
                            <asp:Button ID="ButtonChangeDimensionImage" runat="server" Text="Change Image" CssClass="btn btn-success" OnClick="ButtonChangeDimensionImage_Click" />
                            <br />
                            <br />
                            <asp:Image ID="ImageDimensionImage" runat="server" Width="300px" />
                        </div>
                    </div>
                    <!--確認按鈕與取消按鈕(非共通)-->
                    <br />
                    <br />
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonCloseDimension" runat="server" Text="關閉" Width="200px" CssClass="btn btn-danger" OnClick="ButtonCloseDimension_Click" />
                    </div>
                    <!--確認按鈕與取消按鈕結束(非共通)-->


                    <!--新增Dimension的第二塊Panel-->
                    <asp:Panel ID="PanelAddADimensionItem" runat="server" Visible="false">
                        <div class="editModel2">
                            <div class="editModelContent2">
                                <p class="editTitle">Add a Dimension Item</p>
                                <br />
                                Item：<asp:TextBox ID="TextBoxAddDimesionItem" CssClass="form-control" runat="server"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Value：<asp:TextBox ID="TextBoxAddDimesionValue" CssClass="form-control" runat="server"></asp:TextBox>
                                <br />
                                <br />

                                <!--確認按鈕與取消按鈕(非共通)-->
                                <div style="display: flex; justify-content: center;">
                                    <asp:Button ID="ButtonAddADimension" runat="server" Text="新增" Width="150px" CssClass="btn btn-success" OnClick="ButtonAddADimension_Click" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="ButtonCloseAddADimension" runat="server" Text="關閉" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCloseAddADimension_Click" />
                                </div> <!--確認按鈕與取消按鈕結束(非共通)-->

                            </div>
                        </div>
                    </asp:Panel>

                </asp:Panel>
                <!--Dimension編輯區域結束-->

                <!--首次新增Yacht的Dimension編輯區域-->
                <asp:Panel ID="PanelAddYachtDimension" runat="server" Visible="False">
                    <asp:Label ID="LabelAddYachtDimensionTitle" CssClass="editTitle" runat="server" Text="Yacht："></asp:Label>
                    Dimension Item&Values：<br />
                    (若Item/Value有一項為空，則該項Item-Value組合不會新增)
                    <br />
                    <br />
                    <div style="display: flex;">
                        <!--Dimension Item-->
                        <div style="width: 48%; padding-top: 10px; padding-left: 1%; padding-right: 1%; border-right: dashed 0.5px gray;">
                            <table class="table table-hover">
                                <tr>
                                    <td>Item</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem1" placeholder="Item" Text="Hull length" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue1" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem2" placeholder="Item" Text="L.W.L." runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue2" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem3" placeholder="Item" Text="B. MAX" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue3" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem4" placeholder="Item" Text="Ballast" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue4" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem5" placeholder="Item" Text="Displacement" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue5" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem6" placeholder="Item" Text="Engine diesel" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue6" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem7" placeholder="Item" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue7" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionItem8" placeholder="Item" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBoxDimensionValue8" placeholder="Value" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </div>
                        <div style="width: 48%; padding-top: 10px; padding-left: 5%; padding-right: 1%;">
                            <table class="table table-hover">
                                <tr>
                                    <td>Upload Dimensions Image：</td>
                                </tr>
                            </table>
                            <asp:FileUpload ID="FileUploadAddDimensionsImage" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <br />
                    <div style="text-align: center;">
                        <asp:Button ID="ButtonAddYachtDimension" runat="server" Text="確認" Width="150px" CssClass="btn btn-primary" OnClick="ButtonAddYachtDimension_Click" />
                    </div>

                </asp:Panel>
                <!--首次新增Yacht的Dimension編輯區域結束-->

                <!--Album編輯區域-->
                <asp:Panel ID="PanelAlbum" runat="server" Visible="False">
                    <asp:Label ID="LabelAlbumTitle" CssClass="editTitle" runat="server" Text="Yacht："></asp:Label>
                    新增照片：
                    <asp:FileUpload ID="FileUploadAddAlbumImages" CssClass="form-control" runat="server" AllowMultiple="True" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonAddAlbumImage" runat="server" Text="Add Album Images" CssClass="btn btn-success" OnClick="ButtonAddAlbumImage_Click" />
                    <br /><br />
                    <asp:GridView ID="GridViewAlbum" Width="80%" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDataBound="GridViewAlbum_RowDataBound" OnRowDeleting="GridViewAlbum_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:TemplateField HeaderText="Image" SortExpression="ImagePath">
                                <ItemTemplate>
                                    <asp:Image ID="ImageAlbumImage" runat="server" Height="300px" ImageUrl='<%# Eval("ImagePath").ToString() %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="封面">
                                <ItemTemplate>
                                    <asp:RadioButton ID="RadioButtonCover" runat="server" AutoPostBack="True" GroupName="AlbumCover" OnCheckedChanged="RadioButtonCover_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonDeleteAlbumImage" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <!--確認按鈕與取消按鈕(非共通)-->
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonCloseAlbum" runat="server" Text="關閉" Width="200px" CssClass="btn btn-danger" OnClick="ButtonCloseAlbum_Click" />
                    </div>
                    <!--確認按鈕與取消按鈕結束(非共通)-->

                </asp:Panel>
                <!--Album編輯區域結束-->

                <!--Layout編輯區域-->
                <asp:Panel ID="PanelLayout" runat="server" Visible="False">
                    <asp:Label ID="LabelLayoutTitle" CssClass="editTitle" runat="server" Text="Yacht："></asp:Label>

                    <asp:FileUpload ID="FileUploadAddLayout" CssClass="form-control" runat="server" AllowMultiple="True" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonAddLayout" runat="server" Text="Add Layout & Deck Plan Images" CssClass="btn btn-success" OnClick="ButtonAddLayout_Click" />
                    <br /><br />
                    <asp:GridView ID="GridViewLayout" CssClass="table table-hover" Width="80%" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="GridViewLayout_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:TemplateField HeaderText="ImagePath" SortExpression="ImagePath" >
                                <ItemTemplate>
                                    <asp:Image ID="ImageLayoutImagePath" Width="350px" runat="server" ImageUrl='<%#Eval("ImagePath").ToString() %>'/>
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
                    <!--確認按鈕與取消按鈕(非共通)-->
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonCloseLayout" runat="server" Text="關閉" Width="200px" CssClass="btn btn-danger" OnClick="ButtonCloseLayout_Click" />
                    </div>
                    <!--確認按鈕與取消按鈕結束(非共通)-->

                </asp:Panel>
                <!--Layout編輯區域結束-->


                <!--Specification編輯區域-->
                <asp:Panel ID="PanelSpecification" runat="server" Visible="False">
                    <asp:Label ID="LabelSpecificationTitle" CssClass="editTitle" runat="server" Text="Yacht："></asp:Label>
                    <asp:Button ID="ButtonCallAddDetailTitle" runat="server" Text="Add/Edit A Detail Title" CssClass="btn btn-success" OnClick="ButtonCallAddDetailTitle_Click" />
                    <asp:Button ID="ButtonCallAddDetails" runat="server" Text="Add Details" CssClass="btn btn-success" OnClick="ButtonCallAddDetails_Click" />
                    <br />
                    <br />
                    Detail Title：<asp:DropDownList ID="DropDownListSpecificationTitle" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownListSpecificationTitle_SelectedIndexChanged" Width="250px"></asp:DropDownList>
                    <br />
                    <br />
                    <asp:GridView ID="GridViewSpecification" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridViewSpecification_RowCancelingEdit" OnRowDeleting="GridViewSpecification_RowDeleting" OnRowEditing="GridViewSpecification_RowEditing" OnRowUpdating="GridViewSpecification_RowUpdating" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:BoundField DataField="Row" HeaderText="Row" ReadOnly="True" SortExpression="Row" />
                            <asp:TemplateField HeaderText="Item" SortExpression="Item">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBoxItem" runat="server" Text='<%# Bind("Item") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="LabelItem" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButtonDeleteDetailItems" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>

                    </asp:GridView>
                    <!--確認按鈕與取消按鈕(非共通)-->
                    <div style="display: flex; justify-content: center;">
                        <asp:Button ID="ButtonSpecificationCancel" runat="server" Text="關閉" Width="150px" CssClass="btn btn-danger" OnClick="ButtonSpecificationCancel_Click" />
                    </div>
                    <!--確認按鈕與取消按鈕結束(非共通)-->

                </asp:Panel>

                <!--新增跟編輯DetailTitle的第二塊Panel-->
                <asp:Panel ID="PanelSpecificationDetailTitle" runat="server" Visible="False">
                    <div class="editModel2">
                        <div class="editModelContent2">
                            <asp:Label ID="Label1" CssClass="editTitle" runat="server" Text="Add/Edit Detail Title"></asp:Label>
                            新增Detail Title：<asp:TextBox ID="TextBoxAddDetailTitle" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                            &nbsp;&nbsp;
                            <asp:Button ID="ButtonSubmitAddDetailTitle" runat="server" Text="新增" CssClass="btn btn-success" OnClick="ButtonSubmitAddDetailTitle_Click" />
                            <br />
                            <br />
                            <!--DetailTitle的GridView-->
                            <asp:GridView ID="GridViewDetailTitle" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridViewDetailTitle_RowCancelingEdit" OnRowDeleting="GridViewDetailTitle_RowDeleting" OnRowEditing="GridViewDetailTitle_RowEditing" OnRowUpdating="GridViewDetailTitle_RowUpdating">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                                    <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" SortExpression="Row" />
                                    <asp:TemplateField HeaderText="Detail Title" SortExpression="Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBoxTitleName" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="LabelTitleName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButtonUpdateDetailTitle" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButtonCancelUpdateDetailTitle" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonUpdatingDetailTitle" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButtonDeleteUpdateDetailTitle" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <br />
                            <div style="display: flex; justify-content: center;">
                                <asp:Button ID="ButtonCloseSpecificationDetailTitle" runat="server" Text="關閉" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCloseSpecificationDetailTitle_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!--確認按鈕與取消按鈕結束(非共通)-->

                <!--新增Details的第二塊Panel-->
                <asp:Panel ID="PanelSpecificationDetails" runat="server" Visible="False">
                    <div class="editModel2">
                        <div class="editModelContent2">
                            所屬Details Title：
                            <asp:DropDownList ID="DropDownListAddDetailsSelectTitle" CssClass="form-control" runat="server" Width="300px"></asp:DropDownList>
                            <br />
                            <br />
                            新增Item(為空則不新增)：<br />
                            <asp:TextBox ID="TextBoxAddDetails1" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxAddDetails2" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxAddDetails3" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxAddDetails4" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxAddDetails5" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxAddDetails6" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxAddDetails7" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxAddDetails8" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxAddDetails9" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBoxAddDetails10" Width="350px" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <div style="display: flex; justify-content: center;">
                                <asp:Button ID="Button1SubmitAddDetails" runat="server" Text="新增" Width="150px" CssClass="btn btn-success" OnClick="Button1SubmitAddDetails_Click" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="ButtonCloseAddDetails" runat="server" Text="關閉" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCloseAddDetails_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <!--Specification編輯區域結束-->



            </div>
        </div>
    </asp:Panel>
    <!--編輯區域的Panel結束-->




</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMainTitle" runat="server">
    <h4>Yacht</h4>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <asp:Button ID="BtnCallPanelAddYacht" runat="server" Text="Add a Yacht" CssClass="btn btn-success" OnClick="BtnCallPanelAddYacht_Click" />
    <br />
    <br />


    <asp:GridView ID="GridViewYacht" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="GridViewYacht_RowDeleting" OnRowEditing="GridViewYacht_RowEditing">
        <Columns>
            <asp:BoundField DataField="Row" HeaderText="Row" ReadOnly="True" SortExpression="Row" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Yacht Name" HeaderText="Yacht Name" ReadOnly="True" SortExpression="Yacht Name" />
            <asp:TemplateField HeaderText="IsNewDesign" SortExpression="IsNewDesign">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="CheckBoxIsNewDesign" runat="server" Checked='<%# Bind("IsNewDesign") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IsNewBuilding" SortExpression="IsNewBuilding">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBoxIsNewBuilding" runat="server" Checked='<%# Bind("IsNewBuilding") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="封面(首頁展示)">
                <ItemTemplate>
                    <div style="text-align:center;">
                        <img style="width:198px;height:118px" src="<%#Eval("ImagePath").ToString() %>"/>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonEditYacht" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDeleteYacht" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


</asp:Content>
