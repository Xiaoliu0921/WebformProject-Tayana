<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage/BackMaster.Master" AutoEventWireup="true" CodeBehind="ManageDealers.aspx.cs" Inherits="tayana.BackStage.BackDealers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPanel" runat="server">

    <asp:Panel ID="PanelCountry" runat="server" Visible="false">
        <div class="editModel">
            <div class="editModelContent">
                <asp:Label ID="LblPanelCountryTitle" runat="server" Text="Add / Edit Country" CssClass="editTitle"></asp:Label>

                <asp:GridView ID="GridViewCountry" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table table-hover" OnRowCancelingEdit="GridViewCountry_RowCancelingEdit" OnRowDeleting="GridViewCountry_RowDeleting" OnRowEditing="GridViewCountry_RowEditing" OnRowUpdating="GridViewCountry_RowUpdating">

                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Country" SortExpression="Country">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxCountry" CssClass="form-control" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreateTime" HeaderText="CreateTime" SortExpression="CreateTime" ReadOnly="True" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Panel ID="PanelAddCountry" runat="server" Visible="False">
                    <div class="editModel2">
                        <div class="editModelContent2">
                            新增Country：<asp:TextBox ID="TextBoxAddCountry" CssClass="form-control" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <div style="display: flex; justify-content: center;">
                                <asp:Button ID="ButtonSubmitAddCountry" runat="server" Text="確認新增" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmitAddCountry_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnCancelEditCountry" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="BtnCancelEditCountry_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div style="display: flex; justify-content: center;">
                    <asp:Button ID="BtnAddCountry" runat="server" Text="Add a Country" Width="150px" CssClass="btn btn-primary" OnClick="BtnAddCountry_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCancelEdit" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="BtnCancelEdit_Click" />
                </div>
                <br />
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelArea" runat="server" Visible="false">
        <div class="editModel">
            <div class="editModelContent">
                <asp:Label ID="LabelPanelAreaTitle" runat="server" Text="Add / Edit Area" CssClass="editTitle"></asp:Label>
                <br />
                選擇國家：<asp:DropDownList ID="DropDownListFilterCountry" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListFilterCountry_SelectedIndexChanged" Width="300px"></asp:DropDownList>
                <br />
                <br />
                <asp:GridView ID="GridViewArea" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table table-hover" OnRowCancelingEdit="GridViewArea_RowCancelingEdit" OnRowDeleting="GridViewArea_RowDeleting" OnRowEditing="GridViewArea_RowEditing" OnRowUpdating="GridViewArea_RowUpdating">

                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="Row" HeaderText="序號" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Country" SortExpression="Country">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListCountry_Area" CssClass="form-control" runat="server" Width="250px"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelCountry_Area" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Area" SortExpression="Area">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxArea" CssClass="form-control" runat="server" Text='<%# Bind("Area") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelArea" runat="server" Text='<%# Bind("Area") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CreateTime" HeaderText="CreateTime" SortExpression="CreateTime" ReadOnly="True" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick="return confirm('確認要刪除嗎？')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:Panel ID="PanelAddArea" runat="server" Visible="False">
                    <div class="editModel2">
                        <div class="editModelContent2">
                            所屬國家：<asp:DropDownList ID="DropDownListCountry_AddArea" CssClass="form-control" runat="server" Width="250px"></asp:DropDownList>
                            <br />
                            <br />
                            新增Area：<asp:TextBox ID="TextBoxAddArea" CssClass="form-control" runat="server" Width="250px"></asp:TextBox>
                            <br />
                            <br />
                            <div style="display: flex; justify-content: center;">
                                <asp:Button ID="ButtonSubmitAddArea" runat="server" Text="確認新增" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmitAddArea_Click" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="BtnCancelEditArea" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="BtnCancelEditArea_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div style="display: flex; justify-content: center;">
                    <asp:Button ID="Button3" runat="server" Text="Add a Area" Width="150px" CssClass="btn btn-primary" OnClick="BtnAddArea_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="BtnCancelEdit_Click" />
                </div>
                <br />
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="PanelDealer" runat="server" Visible="false">
        <div class="editModel">
            <div class="editModelContent">
                <asp:Label ID="LabelDealerTitle" runat="server" Text="Add / Edit Dealer" CssClass="editTitle"></asp:Label>
                <br />
                <div style="display: flex; justify-content: center;">
                    <asp:Image ID="ImageDealer" runat="server" ImageUrl="/BackStage/DealersImages/DefaultDealer.jpg" Width="300px" />
                </div>
                <br />
                <div style="display: flex; justify-content: center;font-size: 1.25rem;">
                    設定頭像：<asp:FileUpload ID="FileUploadDealerImage" CssClass="form-control" runat="server" />
                </div>
            <br />
            <br />
            <div style="font-size: 1.25rem;">
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Country：<asp:DropDownList ID="DropDownListDealerCountry" CssClass="form-control" runat="server" Width="300px" AutoPostBack="True" OnSelectedIndexChanged="DropDownListDealerCountry_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                    <div>
                        Area：<asp:DropDownList ID="DropDownListDealerArea" CssClass="form-control" runat="server" Width="300px"></asp:DropDownList>
                    </div>
                    <div></div>
                    <div></div>
                </div>
                <br />
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Name*：<asp:TextBox ID="TextBoxDealerName" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div>
                        Contact：<asp:TextBox ID="TextBoxDealerContact" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div></div>
                    <div></div>
                </div>
                <br />
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Address：<asp:TextBox ID="TextBoxDealerAddress" CssClass="form-control" runat="server" Width="900px"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Tel：<asp:TextBox ID="TextBoxDealerTel" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div>
                        Fax：<asp:TextBox ID="TextBoxDealerFax" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div></div>
                    <div></div>
                </div>
                <br />
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Cell：<asp:TextBox ID="TextBoxDealerCell" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div>
                        E-mail：<asp:TextBox ID="TextBoxDealerEmail" CssClass="form-control" runat="server" Width="300px"></asp:TextBox>
                    </div>
                    <div></div>
                    <div></div>
                </div>
                <br />
                <div style="display: flex; justify-content: space-between">
                    <div>
                        Link：<asp:TextBox ID="TextBoxDealerLink" CssClass="form-control" runat="server" Width="900px"></asp:TextBox>
                    </div>
                </div>
                <br />
            </div>

            <div style="display: flex; justify-content: center;">
                <asp:Button ID="ButtonSubmitDealer" runat="server" Text="確認" Width="150px" CssClass="btn btn-primary" OnClick="ButtonSubmitDealer_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonCancelDealer" runat="server" Text="取消" Width="150px" CssClass="btn btn-danger" OnClick="ButtonCancelDealer_Click" />
                <asp:HiddenField ID="HiddenFieldDealerId" runat="server" />
            </div>
            <br />
        </div>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderMainTitle" runat="server">
    <h4>Dealers</h4>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">

    <asp:Button ID="BtnCallPanelCountry" runat="server" Text="Add/Edit Country" CssClass="btn btn-success" OnClick="BtnCallPanelCountry_Click" />
    <asp:Button ID="BtnCallPanelArea" runat="server" Text="Add/Edit Area" CssClass="btn btn-success" OnClick="BtnCallPanelArea_Click" />
    <asp:Button ID="BtnCallPanelDealers" runat="server" Text="Add a Dealer" CssClass="btn btn-success" OnClick="BtnCallPanelDealers_Click" />
    <br />
    <br />
    選擇國家：<asp:DropDownList ID="DropDownListFilterDealer" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListFilterDealer_SelectedIndexChanged" Width="300px"></asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridViewDealer" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="GridViewDealer_RowDeleting" OnRowEditing="GridViewDealer_RowEditing">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Row" HeaderText="序號" InsertVisible="False" ReadOnly="True" SortExpression="Row" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" ReadOnly="True" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <img src="<%#Eval("ImagePath").ToString() %>" style="width:209px;height:157px;"/>
                </ItemTemplate>
            </asp:TemplateField>
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
</asp:Content>
