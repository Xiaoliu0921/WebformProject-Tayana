using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Razor.Tokenizer;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

namespace tayana.BackStage
{
    public partial class BackDealers : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDropFilterDealer();
                ShowGVDealer();
            }
        }

        protected void BtnCancelEdit_Click(object sender, EventArgs e)
        {
            PanelArea.Visible = false;
            PanelCountry.Visible = false;
            PanelDealer.Visible = false;
            ShowDropFilterDealer();
            ShowGVDealer();
        }

        //<---------------------------------CountryPanel------------------------------>
        //<---------------------------------CountryPanel------------------------------>
        //<---------------------------------CountryPanel------------------------------>
        //<---------------------------------CountryPanel------------------------------>
        //<---------------------------------CountryPanel------------------------------>
        //<---------------------------------CountryPanel------------------------------>
        protected void BtnCallPanelCountry_Click(object sender, EventArgs e)
        {
            PanelCountry.Visible = true;
            ShowGVCountry();
        }

        public void ShowGVCountry()
        {
            sqlSentence = "SELECT ROW_NUMBER() over(Order by Id ASC) as 'Row',Id,Country,IsDelete,CreateTime FROM [DealerCountry] Where IsDelete=0;";
            GridViewCountry.DataSource = db.SearchDB(sqlSentence);
            GridViewCountry.DataBind();
            db.CloseDB();
        }

        protected void GridViewCountry_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCountry.EditIndex = -1; // 將資料行取消：編輯模式
            ShowGVCountry();
        }

        protected void GridViewCountry_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCountry.EditIndex = e.NewEditIndex;
            ShowGVCountry();
        }

        protected void GridViewCountry_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IndexRow = e.RowIndex;
            string Id = GridViewCountry.DataKeys[IndexRow].Value.ToString();

            sqlSentence = "Update DealerCountry Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict["@Id"] = Id;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGVCountry();
        }

        protected void GridViewCountry_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // 1. 找到特定表格行數 (Row)
            int IndexRow = e.RowIndex;
            // 2. 取得該行數的表格行數物件 (GridViewRow)
            GridViewRow TargetRow = GridViewCountry.Rows[IndexRow];
            // 3. 於該物件內部找到要修改的欄位 (Column) 物件
            TextBox UpdateLinkTxb = TargetRow.FindControl("TextBoxCountry") as TextBox;
            // 4. 找到該行數的 Key Value (ID)
            string Id = GridViewCountry.DataKeys[IndexRow].Value.ToString();

            dict.Clear();
            dict["@Country"] = UpdateLinkTxb.Text;
            dict["@Id"] = Id;
            sqlSentence = "Update DealerCountry Set Country =@Country Where Id=@Id;";
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            GridViewCountry.EditIndex = -1;
            ShowGVCountry();
        }

        protected void BtnAddCountry_Click(object sender, EventArgs e)
        {
            PanelAddCountry.Visible = true;
        }

        protected void ButtonSubmitAddCountry_Click(object sender, EventArgs e)
        {
            if (TextBoxAddCountry.Text.IsNullOrWhiteSpace())
            {
                Response.Write($"<script>alert('未填寫新增內容')</script>");
            }
            else
            {
                sqlSentence = "Insert DealerCountry(Country) Values (@Country)";
                dict.Clear();
                dict["@Country"] = TextBoxAddCountry.Text;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('新增成功')</script>");
                }
                db.CloseDB();
                TextBoxAddCountry.Text = null;
                PanelAddCountry.Visible = false;
                ShowGVCountry();
            }
        }

        protected void BtnCancelEditCountry_Click(object sender, EventArgs e)
        {
            TextBoxAddCountry.Text = null;
            PanelAddCountry.Visible = false;
        }

        //<---------------------------------AreaPanel------------------------------>
        //<---------------------------------AreaPanel------------------------------>
        //<---------------------------------AreaPanel------------------------------>
        //<---------------------------------AreaPanel------------------------------>
        //<---------------------------------AreaPanel------------------------------>
        protected void BtnCallPanelArea_Click(object sender, EventArgs e)
        {
            PanelArea.Visible = true;
            ShowGVArea();
            ShowDropFilterArea();
        }

        public void ShowGVArea()
        {
            sqlSentence = "Select Row_Number() Over(Order by DA.Id ASC) as 'Row',DA.Id,DC.Country,DA.CountryId,DA.Area,DA.CreateTime FROM [DealerArea] DA Join DealerCountry DC On DC.Id=DA.CountryId Where DA.IsDelete=0 AND DC.IsDelete=0;";
            GridViewArea.DataSource = db.SearchDB(sqlSentence);
            GridViewArea.DataBind();
            db.CloseDB();
        }

        public void ShowDropFilterArea()
        {
            DropDownListFilterCountry.DataTextField = "Country";
            DropDownListFilterCountry.DataValueField = "Id";
            sqlSentence = "Select * From DealerCountry Where IsDelete=0;";
            DropDownListFilterCountry.DataSource = db.SearchDB(sqlSentence);
            DropDownListFilterCountry.DataBind();
            DropDownListFilterCountry.Items.Insert(0, new ListItem("未選擇", "-1"));
            db.CloseDB();
        }

        protected void DropDownListFilterCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListFilterCountry.SelectedValue == "-1")
            {
                ShowGVArea();
            }
            else
            {
                string CountryId = DropDownListFilterCountry.SelectedValue;
                sqlSentence = "Select Row_Number() Over(Order by DA.Id ASC) as 'Row',DA.Id,DC.Country,DA.CountryId,DA.Area,DA.CreateTime FROM [DealerArea] DA Join DealerCountry DC On DC.Id=DA.CountryId Where DA.IsDelete=0 AND DC.IsDelete=0 And CountryId=@CountryId;";
                dict.Clear();
                dict["@CountryId"] = CountryId;
                GridViewArea.DataSource = db.SearchDB(sqlSentence, dict);
                GridViewArea.DataBind();
                db.CloseDB();
            }
        }

        protected void BtnAddArea_Click(object sender, EventArgs e)
        {
            PanelAddArea.Visible = true;
            ShowDropAddArea();
        }

        public void ShowDropAddArea()
        {
            DropDownListCountry_AddArea.DataTextField = "Country";
            DropDownListCountry_AddArea.DataValueField = "Id";
            sqlSentence = "Select * From DealerCountry Where IsDelete=0;";
            DropDownListCountry_AddArea.DataSource = db.SearchDB(sqlSentence);
            DropDownListCountry_AddArea.DataBind();
            db.CloseDB();
        }

        protected void GridViewArea_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IndexRow = e.RowIndex;
            string Id = GridViewArea.DataKeys[IndexRow].Value.ToString();

            sqlSentence = "Update DealerArea Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict["@Id"] = Id;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGVArea();
        }

        protected void GridViewArea_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int IndexRow = e.RowIndex;
            string Id = GridViewArea.DataKeys[IndexRow].Value.ToString();
            GridViewRow TargerRow = GridViewArea.Rows[IndexRow];

            TextBox txbArea = TargerRow.FindControl("TextBoxArea") as TextBox;
            DropDownList ddlCountry = TargerRow.FindControl("DropDownListCountry_Area") as DropDownList;

            string newAreaName = txbArea.Text.Trim();
            string newCountryId = ddlCountry.SelectedValue.ToString();

            sqlSentence = "Update DealerArea Set CountryId=@CountryId,Area=@Area Where Id=@Id";
            dict.Clear();
            dict["@Id"] = Id;
            dict["@Area"] = newAreaName;
            dict["@CountryId"] = newCountryId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            GridViewArea.EditIndex = -1;
            ShowGVArea();
        }

        protected void GridViewArea_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewArea.EditIndex = e.NewEditIndex;
            ShowGVArea();
            ShowDropEditArea(e.NewEditIndex);
        }

        public void ShowDropEditArea(int IndexRow)
        {
            GridViewRow TargerRow = GridViewArea.Rows[IndexRow];
            DropDownList ddlCountry = TargerRow.FindControl("DropDownListCountry_Area") as DropDownList;
            ddlCountry.DataTextField = "Country";
            ddlCountry.DataValueField = "Id";

            sqlSentence = "Select * From DealerCountry Where IsDelete=0;";
            ddlCountry.DataSource = db.SearchDB(sqlSentence);
            ddlCountry.DataBind();
            db.CloseDB();
        }

        protected void GridViewArea_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewArea.EditIndex = -1;
            ShowGVArea();
        }

        protected void BtnCancelEditArea_Click(object sender, EventArgs e)
        {
            TextBoxAddArea.Text = null;
            PanelAddArea.Visible = false;
        }

        protected void ButtonSubmitAddArea_Click(object sender, EventArgs e)
        {
            if (TextBoxAddArea.Text.IsNullOrWhiteSpace())
            {
                Response.Write($"<script>alert('未填寫新增內容')</script>");
            }
            else
            {
                sqlSentence = "Insert DealerArea(CountryId,Area) Values (@CountryId,@Area)";
                dict.Clear();
                dict["@Area"] = TextBoxAddArea.Text;
                dict["@CountryId"] = DropDownListCountry_AddArea.SelectedValue;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('新增成功')</script>");
                }
                db.CloseDB();
                TextBoxAddArea.Text = null;
                PanelAddArea.Visible = false;
                ShowGVArea();
            }
        }
        //<---------------------------------DealerPanel------------------------------>
        //<---------------------------------DealerPanel------------------------------>
        //<---------------------------------DealerPanel------------------------------>
        //<---------------------------------DealerPanel------------------------------>
        //<---------------------------------DealerPanel------------------------------>
        protected void BtnCallPanelDealers_Click(object sender, EventArgs e)
        {
            PanelDealer.Visible = true;
            ButtonSubmitDealer.Text = "確認新增";
            ShowDropsDealer();
        }

        public void ShowGVDealer()
        {
            if (DropDownListFilterDealer.SelectedValue == "" || DropDownListFilterDealer.SelectedValue == "-1")
            {
                sqlSentence = "Select ROW_NUMBER() over(Order by D.Id ASC) as 'Row',D.ImagePath,D.Id,DC.Country,DA.Area,D.Name,D.ImagePath From Dealers as D Join DealerArea as DA On DA.Id=D.AreaId Join DealerCountry as DC On DC.Id=DA.CountryId Where D.IsDelete=0 And DA.IsDelete=0 And DC.IsDelete=0;";
                GridViewDealer.DataSource = db.SearchDB(sqlSentence);
                GridViewDealer.DataBind();
                db.CloseDB();
            }
            else
            {
                sqlSentence = "Select ROW_NUMBER() over(Order by D.Id ASC) as 'Row',D.ImagePath,D.Id,DC.Country,DA.Area,D.Name,D.ImagePath From Dealers as D Join DealerArea as DA On DA.Id=D.AreaId Join DealerCountry as DC On DC.Id=DA.CountryId Where D.IsDelete=0 And DA.IsDelete=0 And DC.IsDelete=0 And DA.CountryId=@CountryId;";
                dict.Clear();
                dict["@CountryId"] = DropDownListFilterDealer.SelectedValue;
                GridViewDealer.DataSource = db.SearchDB(sqlSentence, dict);
                GridViewDealer.DataBind();
                db.CloseDB();
            }
        }

        public void ShowDropFilterDealer()
        {
            string selectedValue = DropDownListFilterDealer.SelectedValue;
            DropDownListFilterDealer.DataTextField = "Country";
            DropDownListFilterDealer.DataValueField = "Id";
            sqlSentence = "Select * From DealerCountry Where IsDelete=0;";
            DropDownListFilterDealer.DataSource = db.SearchDB(sqlSentence);
            DropDownListFilterDealer.DataBind();
            DropDownListFilterDealer.Items.Insert(0, new ListItem("未選擇", "-1"));
            db.CloseDB();
            if (selectedValue != "" && DropDownListFilterDealer.Items.FindByValue(selectedValue) != null)
            {
                DropDownListFilterDealer.ClearSelection();
                DropDownListFilterDealer.Items.FindByValue(selectedValue).Selected = true;
            }
        }

        protected void DropDownListFilterDealer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListFilterDealer.SelectedValue == "-1" || DropDownListFilterDealer.SelectedValue == "")
            {
                ShowGVDealer();
            }
            else
            {
                string CountryId = DropDownListFilterDealer.SelectedValue;
                sqlSentence = "Select ROW_NUMBER() over(Order by D.Id ASC) as 'Row',D.Id,DC.Country,DA.Area,D.Name,D.ImagePath From Dealers as D Join DealerArea as DA On DA.Id=D.AreaId Join DealerCountry as DC On DC.Id=DA.CountryId Where D.IsDelete=0 And DA.IsDelete=0 And DC.IsDelete=0 And DA.CountryId=@CountryId;";
                dict.Clear();
                dict["@CountryId"] = CountryId;
                GridViewDealer.DataSource = db.SearchDB(sqlSentence, dict);
                GridViewDealer.DataBind();
                db.CloseDB();
            }
        }

        public void ShowDropsDealer()
        {
            //Country下拉式選單的綁定
            DropDownListDealerCountry.DataTextField = "Country";
            DropDownListDealerCountry.DataValueField = "Id";
            sqlSentence = "Select * From DealerCountry Where IsDelete=0;";
            DropDownListDealerCountry.DataSource = db.SearchDB(sqlSentence);
            DropDownListDealerCountry.DataBind();
            db.CloseDB();
            //Area下拉式選單的綁定
            DropDownListDealerArea.DataTextField = "Area";
            DropDownListDealerArea.DataValueField = "Id";
            string CountryId = DropDownListDealerCountry.SelectedValue;
            sqlSentence = "Select * From DealerArea Where CountryId=@CountryId And IsDelete=0;;";
            dict.Clear();
            dict["@CountryId"] = CountryId;
            DropDownListDealerArea.DataSource = db.SearchDB(sqlSentence, dict);
            DropDownListDealerArea.DataBind();
            db.CloseDB();
        }



        public void ShowDropsDealer_Area()
        {
            //Area下拉式選單的綁定
            DropDownListDealerArea.DataTextField = "Area";
            DropDownListDealerArea.DataValueField = "Id";
            string CountryId = DropDownListDealerCountry.SelectedValue;
            sqlSentence = "Select * From DealerArea Where CountryId=@CountryId And IsDelete=0;";
            dict.Clear();
            dict["@CountryId"] = CountryId;
            DropDownListDealerArea.DataSource = db.SearchDB(sqlSentence, dict);
            DropDownListDealerArea.DataBind();
            db.CloseDB();
        }

        protected void DropDownListDealerCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Area下拉式選單的綁定
            DropDownListDealerArea.DataTextField = "Area";
            DropDownListDealerArea.DataValueField = "Id";
            string CountryId = DropDownListDealerCountry.SelectedValue;
            sqlSentence = "Select * From DealerArea Where CountryId=@CountryId And IsDelete=0;";
            dict.Clear();
            dict["@CountryId"] = CountryId;
            DropDownListDealerArea.DataSource = db.SearchDB(sqlSentence, dict);
            DropDownListDealerArea.DataBind();
            db.CloseDB();
        }

        protected void ButtonCancelDealer_Click(object sender, EventArgs e)
        {
            FileUploadDealerImage.Attributes.Clear();
            ImageDealer.ImageUrl = "";
            TextBoxDealerName.Text = null;
            TextBoxDealerContact.Text = null;
            TextBoxDealerAddress.Text = null;
            TextBoxDealerTel.Text = null;
            TextBoxDealerFax.Text = null;
            TextBoxDealerCell.Text = null;
            TextBoxDealerEmail.Text = null;
            TextBoxDealerLink.Text = null;
            HiddenFieldDealerId.Value = null;
            PanelDealer.Visible = false;
        }

        protected void ButtonSubmitDealer_Click(object sender, EventArgs e)
        {
            if (ButtonSubmitDealer.Text == "確認新增")
            {
                if (!string.IsNullOrWhiteSpace(TextBoxDealerName.Text))
                {
                    if (FileUploadDealerImage.HasFile)
                    {
                        string FileExtension = Path.GetExtension(FileUploadDealerImage.PostedFile.FileName).ToLower();
                        if (FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg")
                        {
                            string ImageFolderPath = Server.MapPath($"~/BackStage/DealersImages");
                            if (!Directory.Exists(ImageFolderPath))
                            {
                                Directory.CreateDirectory(ImageFolderPath);
                            }
                            string FileName = Path.GetFileName(FileUploadDealerImage.PostedFile.FileName); // 取得 單一檔案 名稱變數
                            string FilePath = Path.Combine(ImageFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                            string AreaId = DropDownListDealerArea.SelectedValue;
                            string Name = TextBoxDealerName.Text;
                            string Contact = TextBoxDealerContact.Text;
                            string Address = TextBoxDealerAddress.Text;
                            string Tel = TextBoxDealerTel.Text;
                            string Fax = TextBoxDealerFax.Text;
                            string Cell = TextBoxDealerCell.Text;
                            string Email = TextBoxDealerEmail.Text;
                            string Link = TextBoxDealerLink.Text;

                            sqlSentence = "Insert Dealers (AreaId,[Name],Contact,[Address],Tel,Fax,Cell,Email,Link,ImageName,ImagePath) values (@AreaId,@Name,@Contact,@Address,@Tel,@Fax,@Cell,@Email,@Link,(Case When @ImageName='' Then 'DefaultDealer.jpg' else @ImageName End),(Case When @ImagePath='' Then '/BackStage/DealersImages/DefaultDealer.jpg' else @ImagePath End));";
                            dict.Clear();
                            dict["@AreaId"] = AreaId;
                            dict["@Name"] = Name;
                            dict["@Contact"] = Contact;
                            dict["@Address"] = Address;
                            dict["@Tel"] = Tel;
                            dict["@Fax"] = Fax;
                            dict["@Cell"] = Cell;
                            dict["@Email"] = Email;
                            dict["@Link"] = Link;
                            dict["@ImageName"] = FileName;
                            dict["@ImagePath"] = "/BackStage/DealersImages/" + FileName;

                            if (db.NonQueryDB(sqlSentence, dict) == 1)
                            {
                                Response.Write($"<script>alert('新增成功')</script>");
                                //檔案存入路徑中
                                FileUploadDealerImage.PostedFile.SaveAs(FilePath);
                                //新增成功後將輸入的文字還有上傳的檔案都清掉
                                ImageDealer.ImageUrl = "";
                                FileUploadDealerImage.Attributes.Clear();
                                TextBoxDealerName.Text = null;
                                TextBoxDealerContact.Text = null;
                                TextBoxDealerAddress.Text = null;
                                TextBoxDealerTel.Text = null;
                                TextBoxDealerFax.Text = null;
                                TextBoxDealerCell.Text = null;
                                TextBoxDealerEmail.Text = null;
                                TextBoxDealerLink.Text = null;
                                HiddenFieldDealerId.Value = null;
                                PanelDealer.Visible = false;
                            }
                            db.CloseDB();
                            ShowGVDealer();
                        }
                        else
                        {
                            Response.Write($"<script>alert('上傳檔案非jpg、png、jpeg格式，請重新選擇')</script>");
                        }
                    }
                    else
                    {
                        Response.Write($"<script>alert('請上傳檔案')</script>");
                    }

                }
                else
                {
                    Response.Write($"<script>alert('未輸入Name!')</script>");
                }

            }
            else if (ButtonSubmitDealer.Text == "確認修改")
            {
                if (!string.IsNullOrWhiteSpace(TextBoxDealerName.Text))
                {
                    if (FileUploadDealerImage.HasFile)
                    {
                        string FileExtension = Path.GetExtension(FileUploadDealerImage.PostedFile.FileName).ToLower();
                        if (FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg")
                        {
                            string ImageFolderPath = Server.MapPath($"~/BackStage/DealersImages");
                            if (!Directory.Exists(ImageFolderPath))
                            {
                                Directory.CreateDirectory(ImageFolderPath);
                            }
                            string FileName = Path.GetFileName(FileUploadDealerImage.PostedFile.FileName); // 取得 單一檔案 名稱變數
                            string FilePath = Path.Combine(ImageFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                            string DealerId = HiddenFieldDealerId.Value;
                            string AreaId = DropDownListDealerArea.SelectedValue;
                            string Name = TextBoxDealerName.Text;
                            string Contact = TextBoxDealerContact.Text;
                            string Address = TextBoxDealerAddress.Text;
                            string Tel = TextBoxDealerTel.Text;
                            string Fax = TextBoxDealerFax.Text;
                            string Cell = TextBoxDealerCell.Text;
                            string Email = TextBoxDealerEmail.Text;
                            string Link = TextBoxDealerLink.Text;

                            sqlSentence = "Update Dealers Set AreaId=@AreaId,[Name]=@Name,Contact=@Contact,[Address]=@Address,Tel=@Tel,Fax=@Fax,Cell=@Cell,Email=@Email,Link=@Link,ImageName=(Case When @ImageName='' Then 'DefaultDealer.jpg' else @ImageName End),ImagePath=(Case When @ImagePath='' Then '/BackStage/DealersImages/DefaultDealer.jpg' else @ImagePath End) Where Id=@DealerId";
                            dict.Clear();
                            dict["@DealerId"] = DealerId;
                            dict["@AreaId"] = AreaId;
                            dict["@Name"] = Name;
                            dict["@Contact"] = Contact;
                            dict["@Address"] = Address;
                            dict["@Tel"] = Tel;
                            dict["@Fax"] = Fax;
                            dict["@Cell"] = Cell;
                            dict["@Email"] = Email;
                            dict["@Link"] = Link;
                            dict["@ImageName"] = FileName;
                            dict["@ImagePath"] = "/BackStage/DealersImages/" + FileName;

                            if (db.NonQueryDB(sqlSentence, dict) == 1)
                            {
                                Response.Write($"<script>alert('編輯成功')</script>");
                                //檔案存入路徑中
                                FileUploadDealerImage.PostedFile.SaveAs(FilePath);
                                //新增成功後將輸入的文字還有上傳的檔案都清掉
                                ImageDealer.ImageUrl = "";
                                FileUploadDealerImage.Attributes.Clear();
                                TextBoxDealerName.Text = null;
                                TextBoxDealerContact.Text = null;
                                TextBoxDealerAddress.Text = null;
                                TextBoxDealerTel.Text = null;
                                TextBoxDealerFax.Text = null;
                                TextBoxDealerCell.Text = null;
                                TextBoxDealerEmail.Text = null;
                                TextBoxDealerLink.Text = null;
                                HiddenFieldDealerId.Value = null;
                                PanelDealer.Visible = false;
                            }
                            db.CloseDB();
                            ShowGVDealer();

                        }
                        else
                        {
                            Response.Write($"<script>alert('上傳檔案非jpg、png、jpeg格式，請重新選擇')</script>");
                        }
                    }
                    else
                    {
                        string DealerId = HiddenFieldDealerId.Value;
                        string AreaId = DropDownListDealerArea.SelectedValue;
                        string Name = TextBoxDealerName.Text;
                        string Contact = TextBoxDealerContact.Text;
                        string Address = TextBoxDealerAddress.Text;
                        string Tel = TextBoxDealerTel.Text;
                        string Fax = TextBoxDealerFax.Text;
                        string Cell = TextBoxDealerCell.Text;
                        string Email = TextBoxDealerEmail.Text;
                        string Link = TextBoxDealerLink.Text;

                        sqlSentence = "Update Dealers Set AreaId=@AreaId,[Name]=@Name,Contact=@Contact,[Address]=@Address,Tel=@Tel,Fax=@Fax,Cell=@Cell,Email=@Email,Link=@Link Where Id=@DealerId";
                        dict.Clear();
                        dict["@DealerId"] = DealerId;
                        dict["@AreaId"] = AreaId;
                        dict["@Name"] = Name;
                        dict["@Contact"] = Contact;
                        dict["@Address"] = Address;
                        dict["@Tel"] = Tel;
                        dict["@Fax"] = Fax;
                        dict["@Cell"] = Cell;
                        dict["@Email"] = Email;
                        dict["@Link"] = Link;

                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            Response.Write($"<script>alert('編輯成功')</script>");
                            //新增成功後將輸入的文字還有上傳的檔案都清掉
                            ImageDealer.ImageUrl = "";
                            FileUploadDealerImage.Attributes.Clear();
                            TextBoxDealerName.Text = null;
                            TextBoxDealerContact.Text = null;
                            TextBoxDealerAddress.Text = null;
                            TextBoxDealerTel.Text = null;
                            TextBoxDealerFax.Text = null;
                            TextBoxDealerCell.Text = null;
                            TextBoxDealerEmail.Text = null;
                            TextBoxDealerLink.Text = null;
                            HiddenFieldDealerId.Value = null;
                            PanelDealer.Visible = false;
                        }
                        db.CloseDB();
                        ShowGVDealer();

                    }
                }
            }
        }

        protected void GridViewDealer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int IndexRow = e.RowIndex;
            string Id = GridViewDealer.DataKeys[IndexRow].Value.ToString();

            sqlSentence = "Update Dealers Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict["@Id"] = Id;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGVDealer();
        }

        protected void GridViewDealer_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int IndexRow = e.NewEditIndex;
            string DealerId = GridViewDealer.DataKeys[IndexRow].Value.ToString();
            HiddenFieldDealerId.Value = DealerId;
            PanelDealer.Visible = true;
            ShowDropsDealer();

            sqlSentence = "Select D.*,DA.CountryId From Dealers as D Join DealerArea as DA On DA.Id=D.AreaId Where D.Id = @DealerId;";
            dict.Clear();
            dict["@DealerId"] = DealerId;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);

            ButtonSubmitDealer.Text = "確認修改";
            if (rd.Read())
            {
                string CountryId = rd.GetInt32(rd.GetOrdinal("CountryId")).ToString();
                DropDownListDealerCountry.ClearSelection();
                DropDownListDealerCountry.Items.FindByValue(CountryId).Selected = true;
                string AreaId = rd.GetInt32(rd.GetOrdinal("AreaId")).ToString();
                //因為Area下拉式選單要再開一次資料庫，所以先抓ID，下面再處理
                ImageDealer.ImageUrl = rd.GetString(rd.GetOrdinal("ImagePath"));
                TextBoxDealerName.Text = rd.GetString(rd.GetOrdinal("Name"));
                TextBoxDealerContact.Text = rd.GetString(rd.GetOrdinal("Contact"));
                TextBoxDealerAddress.Text = rd.GetString(rd.GetOrdinal("Address"));
                TextBoxDealerTel.Text = rd.GetString(rd.GetOrdinal("Tel"));
                TextBoxDealerFax.Text = rd.GetString(rd.GetOrdinal("Fax"));
                TextBoxDealerCell.Text = rd.GetString(rd.GetOrdinal("Cell"));
                TextBoxDealerEmail.Text = rd.GetString(rd.GetOrdinal("Email"));
                TextBoxDealerLink.Text = rd.GetString(rd.GetOrdinal("Link"));
                //關閉資料庫後來處理Area下拉式選單
                db.CloseDB();
                ShowDropsDealer_Area(); //Method內就有CloseDB了，不用再關一次。
                DropDownListDealerArea.ClearSelection();
                DropDownListDealerArea.Items.FindByValue(AreaId).Selected = true;
            }
        }
    }
}
