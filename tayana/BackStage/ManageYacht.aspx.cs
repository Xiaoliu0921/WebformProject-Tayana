using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Razor.Tokenizer;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json.Linq;
using tayana.ForeStage;

namespace tayana.BackStage
{
    public partial class ManageYacht : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGvYacht();
            }

        }


        //-------------------------------主畫面的操作-------------------------------
        //-------------------------------主畫面的操作-------------------------------
        //-------------------------------主畫面的操作-------------------------------
        //-------------------------------主畫面的操作-------------------------------
        //-------------------------------主畫面的操作-------------------------------
        #region Yacht主畫面
        protected void BtnCallPanelAddYacht_Click(object sender, EventArgs e)
        {
            PanelEdit.Visible = true;
            PanelOverView.Visible = true;
            LabelEditPanelTitle.Text = "Add A Yacht";
            ButtonSubmitOverview.Text = "確認新增";
            TextBoxModel.Text = "";
            TextBoxModelLength.Text = "";
            CKEditorControlOverview.Text = "";
            CheckBoxNewBuilding.Checked = false;
            CheckBoxNewDesign.Checked= false;
            //編輯區塊的切換頁面按鈕都藏起來
            PanelEditHeader.Visible = false;
            PanelAddYachtAlbums.Visible = true;
            GridViewFiles.DataSource = null;
            GridViewFiles.DataBind();
        }

        #region Yacht的GV

        //Yacht GV的繫結
        public void ShowGvYacht()
        {
            sqlSentence = "Select ROW_NUMBER() Over (Order by Y.Id DESC) as 'Row',Y.Id,Model+' '+ModelLength as 'Yacht Name',IsNewBuilding,IsNewDesign,YA.ImagePath From Yacht as Y Join YachtAlbum as YA On YA.Id=Y.CoverId  Where Y.IsDelete =0;";
            GridViewYacht.DataSource = db.SearchDB(sqlSentence);
            GridViewYacht.DataBind();
            db.CloseDB();
        }

        //Yacht GV進編輯模式
        protected void GridViewYacht_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = e.NewEditIndex;
            string YachtId = GridViewYacht.DataKeys[rowIndex].Value.ToString();
            GridViewYacht.EditIndex = -1;

            PanelEdit.Visible = true;
            HiddenFieldYachtId.Value = YachtId;
            LabelEditPanelTitle.Text = "Edit A Yacht";
            OpenPanelEditOverView();
            ButtonSubmitOverview.Text = "確認修改";
        }

        //Yacht GV的刪除
        protected void GridViewYacht_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string YachtId = GridViewYacht.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update Yacht Set IsDelete=1 Where Id=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGvYacht();
        }
        #endregion Yacht的GV結束

        #endregion Yacht主畫面結束




        //-------------------------------編輯視窗的各項換頁與結束視窗操作-------------------------------
        //-------------------------------編輯視窗的各項換頁與結束視窗操作-------------------------------
        //-------------------------------編輯視窗的各項換頁與結束視窗操作-------------------------------
        //-------------------------------編輯視窗的各項換頁與結束視窗操作-------------------------------
        //-------------------------------編輯視窗的各項換頁與結束視窗操作-------------------------------
        #region 打開/關閉不同EditPanel的函數/按鈕(編輯模式)

        //---------------編輯的視窗的全部關閉---------------
        public void CloseEditPanel()
        {
            if (PanelEditHeader.Visible == false)
            {
                PanelEditHeader.Visible = true;
            }

            if (PanelAddYachtAlbums.Visible == true)
            {
                PanelAddYachtAlbums.Visible = false;
            }


            if (PanelOverView.Visible == true)
            {
                TextBoxModel.Text = null;
                TextBoxModelLength.Text = null;
                CKEditorControlOverview.Text = null;
                CheckBoxNewBuilding.Checked = false;
                CheckBoxNewDesign.Checked = false;
                PanelOverView.Visible = false;
            }

            if (PanelAddADimensionItem.Visible == true)
            {
                TextBoxAddDimesionItem.Text = null;
                TextBoxAddDimesionValue.Text = null;
                PanelAddADimensionItem.Visible = false;
            }

            if (PanelDimension.Visible == true)
            {
                ImageDimensionImage.ImageUrl = null;
                PanelDimension.Visible = false;
            }

            if (PanelAddYachtDimension.Visible == true)
            {
                PanelAddYachtDimension.Visible = false;
            }

            if (PanelAlbum.Visible == true)
            {
                PanelAlbum.Visible = false;
            }

            if (PanelLayout.Visible == true)
            {
                PanelLayout.Visible = false;
            }

            if (PanelSpecificationDetails.Visible == true)
            {
                PanelSpecificationDetails.Visible = false;
            }

            if (PanelSpecificationDetailTitle.Visible == true)
            {
                PanelSpecificationDetailTitle.Visible = false;
            }

            if (PanelSpecification.Visible == true)
            {
                PanelSpecification.Visible = false;
            }

        }

        //---------------開啟的函數們---------------
        public void OpenPanelEditOverView()
        {
            CloseEditPanel();
            PanelOverView.Visible = true;
            sqlSentence = "Select * From Yacht Where Id=@YachtId";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);
            if (rd.Read())
            {
                TextBoxModel.Text = rd.GetString(rd.GetOrdinal("Model"));
                TextBoxModelLength.Text = rd.GetString(rd.GetOrdinal("ModelLength"));
                HiddenFieldYachtModel.Value = TextBoxModel.Text;
                HiddenFieldYachtModelLength.Value = TextBoxModelLength.Text;
                HiddenFieldCoverId.Value = rd.GetInt32(rd.GetOrdinal("CoverId")).ToString();
                CheckBoxNewBuilding.Checked = rd.GetBoolean(rd.GetOrdinal("IsNewBuilding"));
                CheckBoxNewDesign.Checked = rd.GetBoolean(rd.GetOrdinal("IsNewDesign"));
                CKEditorControlOverview.Text = rd.GetString(rd.GetOrdinal("Overview"));
            }
            db.CloseDB();
            ShowGvYachtFile();
        }

        public void OpenPanelEditDimension()
        {
            PanelDimension.Visible = true;
            LabelDimensionTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";
            ShowGvDimension();

            //Dimension Image要抓一下
            sqlSentence = "Select [DimensionsImagePath] From Yacht Where Id=@YachtId";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            string ImageUrl = db.SearchDBscalar(sqlSentence, dict).ToString();
            db.CloseDB();
            ImageDimensionImage.ImageUrl = ImageUrl;

        }

        public void OpenPanelEditAlbum()
        {
            PanelAlbum.Visible = true;
            LabelAlbumTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";
            ShowGvAlbum();
        }

        public void OpenPanelEditLayout()
        {
            PanelLayout.Visible = true;
            LabelLayoutTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";
            ShowGvLayout();
        }

        public void OpenPanelEditSpecification()
        {
            PanelSpecification.Visible = true;
            LabelSpecificationTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";
            ShowDropSpecificationDetails();
            ShowGvSpecificationDetails();

        }

        //---------------按鈕們---------------

        protected void ButtonCallOverView_Click(object sender, EventArgs e)
        {
            CloseEditPanel();
            OpenPanelEditOverView();
        }

        protected void ButtonCallOverViewDimension_Click(object sender, EventArgs e)
        {
            CloseEditPanel();
            OpenPanelEditDimension();
        }

        protected void ButtonCallAlbum_Click(object sender, EventArgs e)
        {
            CloseEditPanel();
            OpenPanelEditAlbum();
        }

        protected void ButtonCallLayout_Click(object sender, EventArgs e)
        {
            CloseEditPanel();
            OpenPanelEditLayout();
        }


        protected void ButtonCallSpecification_Click(object sender, EventArgs e)
        {
            CloseEditPanel();
            OpenPanelEditSpecification();
        }

        //------關閉整個編輯區塊回到Yacht的函數跟按鈕

        //每個編輯區塊基本上都有"關閉" "取消"的按鈕，按了直接回到YACHT首頁
        public void CloseEditWindow()
        {
            CloseEditPanel();
            HiddenFieldYachtId.Value = null;
            HiddenFieldYachtModel.Value = null;
            HiddenFieldYachtModelLength.Value = null;
            HiddenFieldCoverId.Value = null;
            PanelEdit.Visible = false;
            ShowGvYacht();
        }

        //Overview編輯頁面的取消按鈕
        protected void ButtonOverviewCancel_Click(object sender, EventArgs e)
        {
            CloseEditWindow();
        }

        //Specification的關閉按鈕，回到Yacht
        protected void ButtonSpecificationCancel_Click(object sender, EventArgs e)
        {
            CloseEditWindow();
        }

        //Dimension的關閉按鈕，回到Yacht
        protected void ButtonCloseDimension_Click(object sender, EventArgs e)
        {
            CloseEditWindow();
        }

        //Album的關閉按鈕，回到Yacht
        protected void ButtonCloseAlbum_Click(object sender, EventArgs e)
        {
            CloseEditWindow();
        }

        //Layout的關閉按鈕，回到Yacht
        protected void ButtonCloseLayout_Click(object sender, EventArgs e)
        {
            CloseEditWindow();
        }


        #endregion


        //-------------------------------Overview視窗的各項操作-------------------------------
        //-------------------------------Overview視窗的各項操作-------------------------------
        //-------------------------------Overview視窗的各項操作-------------------------------
        //-------------------------------Overview視窗的各項操作-------------------------------
        //-------------------------------Overview視窗的各項操作-------------------------------
        #region Overview的CRUD

        //Overview的提交按鈕(編輯)/Yacht新增的第一步
        protected void ButtonSubmitOverview_Click(object sender, EventArgs e)
        {
            //檢查第一關：確認型號有沒有未填寫
            if (TextBoxModel.Text.Trim() == "")
            {
                Response.Write($"<script>alert('未填寫Yacht型號')</script>");
            }
            else
            {
                //做Yacht的新增
                if (LabelEditPanelTitle.Text == "Add A Yacht" && ButtonSubmitOverview.Text == "確認新增")
                {
                    bool IsImage = true;
                    //檢查第二關，如果Album、Layout沒新增檔案，不給過！
                    if (!FileUploadAddYachtAlbum.HasFiles || !FileUploadAddYachtLayout.HasFiles)
                    {
                        Response.Write("<script>alert('請上傳檔案至Album及Layout！')</script>");
                        IsImage = false;
                    }

                    //檢查第三關看是否有檔案上傳 (File、Album、Layout)，有的話就做先檢查Album跟Layout有沒有非圖片檔
                    if (FileUploadAddYachtAlbum.HasFiles)
                    {
                        if (IsImage)
                        {
                            foreach (HttpPostedFile file in FileUploadAddYachtAlbum.PostedFiles)
                            {
                                string FileExtension = Path.GetExtension(file.FileName).ToLower();
                                if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                                {
                                    Response.Write("<script>alert('上傳Album或Layout的選擇檔案有非圖片檔！')</script>");
                                    IsImage = false;
                                    break;
                                }
                            }
                        }

                    } //檢查完Album的Upload是否有非圖片檔

                    if (FileUploadAddYachtLayout.HasFiles)
                    {
                        //如果IsImage是true，代表Album沒上傳照片或是上傳的沒問題，false的話就不用檢查Layout了
                        if (IsImage)
                        {
                            foreach (HttpPostedFile file in FileUploadAddYachtLayout.PostedFiles)
                            {
                                string FileExtension = Path.GetExtension(file.FileName).ToLower();
                                if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                                {
                                    Response.Write("<script>alert('上傳Album或Layout的選擇檔案有非圖片檔！')</script>");
                                    IsImage = false;
                                    break;
                                }
                            }
                        }
                    }//false的話就不用檢查Layout了



                    //確認第二關檢查結果，true代表沒問題，false代表使用者傳了非照片進了album跟layout
                    if (IsImage)
                    {
                        //先新增部分基本資料->新增檔案->新增相簿->新增Layout
                        sqlSentence = "Insert Yacht (Model,ModelLength,IsNewBuilding,IsNewDesign,OverView) Values (@Model,@ModelLength,@IsNewBuilding,@IsNewDesign,@OverView)";
                        dict.Clear();
                        dict["@Model"] = TextBoxModel.Text;
                        dict["@ModelLength"] = TextBoxModelLength.Text;
                        dict["@IsNewBuilding"] = CheckBoxNewBuilding.Checked;
                        dict["@IsNewDesign"] = CheckBoxNewDesign.Checked;
                        dict["@OverView"] = CKEditorControlOverview.Text;
                        db.NonQueryDB(sqlSentence, dict);
                        db.CloseDB();

                        //新增完後取得最新一筆的YachtId，並存入HiddenFieldId以便編輯使用
                        sqlSentence = "Select Top 1 Id From Yacht Order by Id Desc;";
                        string YachtId = db.SearchDBscalar(sqlSentence).ToString();
                        HiddenFieldYachtId.Value = YachtId;
                        db.CloseDB();
                        //順便把Yacht型號也存進去，在編輯分頁都可以顯示
                        HiddenFieldYachtModel.Value = TextBoxModel.Text;
                        HiddenFieldYachtModelLength.Value = TextBoxModelLength.Text;

                        //每個Yacht都建一個資料夾，然後裡面再分File、Album、Layout、Dimension副資料夾
                        string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                        //先建立這個Yacht的資料夾
                        if (!Directory.Exists(FolderPath))
                        {
                            Directory.CreateDirectory(FolderPath);
                        }
                        //再建立這個Yacht資料夾裡的四個副資料夾(File、Album、Layout、Dimension)
                        string FileFolderPath = FolderPath + "/Files";
                        if (!Directory.Exists(FileFolderPath)) { Directory.CreateDirectory(FileFolderPath); }
                        string AlbumFolderPath = FolderPath + "/Album";
                        if (!Directory.Exists(AlbumFolderPath)) { Directory.CreateDirectory(AlbumFolderPath); }
                        string LayoutFolderPath = FolderPath + "/Layout";
                        if (!Directory.Exists(LayoutFolderPath)) { Directory.CreateDirectory(LayoutFolderPath); }
                        string DimensionFolderPath = FolderPath + "/Dimension";
                        if (!Directory.Exists(DimensionFolderPath)) { Directory.CreateDirectory(DimensionFolderPath); }

                        //宣告計算File、Layout、Album檔案上傳數量用的整數
                        int countFile = 0;
                        int countLayout = 0;
                        int countAlbum = 0;


                        //建立完資料夾之後開始來做上傳檔案的新增&進資料庫
                        //File的新增
                        if (FileUploadFile.HasFiles)
                        {
                            foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                            {
                                string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                string FilePath = Path.Combine(FileFolderPath, FileName);  // 取得 單一檔案 儲存路徑


                                sqlSentence = "Insert YachtFile (YachtId,FileName,FilePath) Values (@YachtId,@FileName,@FilePath)";
                                dict.Clear();
                                dict["@YachtId"] = YachtId;
                                dict["@FileName"] = FileName;
                                dict["@FilePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Files/" + FileName;
                                if (db.NonQueryDB(sqlSentence, dict) == 1)
                                {
                                    countFile++;
                                }
                                db.CloseDB();
                                postedFile.SaveAs(FilePath);
                            }
                        }//File的新增結束

                        //Album的新增
                        if (FileUploadAddYachtAlbum.HasFiles)
                        {
                            foreach (HttpPostedFile postedFile in FileUploadAddYachtAlbum.PostedFiles)
                            {
                                string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                string FilePath = Path.Combine(AlbumFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                sqlSentence = "Insert YachtAlbum (YachtId,ImageName,ImagePath) Values (@YachtId,@ImageName,@ImagePath)";
                                dict.Clear();
                                dict["@YachtId"] = YachtId;
                                dict["@ImageName"] = FileName;
                                dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Album/" + FileName;
                                if (db.NonQueryDB(sqlSentence, dict) == 1)
                                {
                                    countAlbum++;
                                }
                                db.CloseDB();
                                postedFile.SaveAs(FilePath);
                            }
                            //照片新增完要來設定封面
                            sqlSentence = "Select Top 1 Id From YachtAlbum Where YachtId=@YachtId";
                            dict.Clear();
                            dict["@YachtId"] = YachtId;
                            string coverId = db.SearchDBscalar(sqlSentence, dict).ToString();
                            //封面Id順便存入HiddenField中，後續編輯模式會用到
                            HiddenFieldCoverId.Value = coverId;
                            db.CloseDB();
                            //抓到照片ID之後來更新Yacht的CoverId資料行
                            sqlSentence = "Update Yacht Set CoverId=@CoverId Where Id=@YachtId";
                            dict.Clear();
                            dict["@YachtId"] = YachtId;
                            dict["@CoverId"] = coverId;
                            db.NonQueryDB(sqlSentence, dict);
                            db.CloseDB();

                        }//Album的新增結束



                        //Layout的新增
                        if (FileUploadAddYachtLayout.HasFiles)
                        {
                            foreach (HttpPostedFile postedFile in FileUploadAddYachtLayout.PostedFiles)
                            {
                                string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                string FilePath = Path.Combine(LayoutFolderPath, FileName);  // 取得 單一檔案 儲存路徑


                                sqlSentence = "Insert YachtLayout (YachtId,ImageName,ImagePath) Values (@YachtId,@ImageName,@ImagePath)";
                                dict.Clear();
                                dict["@YachtId"] = YachtId;
                                dict["@ImageName"] = FileName;
                                dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Layout/" + FileName;
                                if (db.NonQueryDB(sqlSentence, dict) == 1)
                                {
                                    countLayout++;
                                }
                                db.CloseDB();
                                postedFile.SaveAs(FilePath);
                            }
                        }//Layout的新增結束

                        //新增後就變成都是編輯了，跳轉到Dimension
                        Response.Write($"<script>alert('新增Yacht成功！！！！\\n\\n" +
                            $"並新增了{countFile}個檔案、{countAlbum}張照片、{countLayout}張Layout&Deck Plan照片，\\n" +
                            $"下一步請新增Dimension資訊。')</script>");
                        PanelAddYachtAlbums.Visible = false;
                        PanelOverView.Visible = false;
                        PanelAddYachtDimension.Visible = true;
                        TextBoxDimensionItem1.Text = "Hull length";
                        TextBoxDimensionValue1.Text = "";
                        TextBoxDimensionItem2.Text = "L.W.L.";
                        TextBoxDimensionValue2.Text = "";
                        TextBoxDimensionItem3.Text = "B. MAX";
                        TextBoxDimensionValue3.Text = "";
                        TextBoxDimensionItem4.Text = "Ballast";
                        TextBoxDimensionValue4.Text = "";
                        TextBoxDimensionItem5.Text = "Displacement";
                        TextBoxDimensionValue5.Text = "";
                        TextBoxDimensionItem6.Text = "Engine diesel";
                        TextBoxDimensionValue6.Text = "";
                        TextBoxDimensionItem7.Text = "";
                        TextBoxDimensionValue7.Text = "";
                        TextBoxDimensionItem8.Text = "";
                        TextBoxDimensionValue8.Text = "";
                        LabelAddYachtDimensionTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";
                    }
                }//首次新增Yacht結束，else的部分是Yacht的OverView編輯
                else if (LabelEditPanelTitle.Text == "Edit A Yacht" && ButtonSubmitOverview.Text == "確認修改")
                {
                    string YachtId = HiddenFieldYachtId.Value;
                    sqlSentence = "Update Yacht Set Model=@Model,ModelLength=@ModelLength,IsNewBuilding=@IsNewBuilding,IsNewDesign=@IsNewDesign,OverView=@OverView Where Id=@YachtId";
                    dict.Clear();
                    dict["@YachtId"] = YachtId;
                    dict["@Model"] = TextBoxModel.Text;
                    dict["@ModelLength"] = TextBoxModelLength.Text;
                    dict["@IsNewBuilding"] = CheckBoxNewBuilding.Checked;
                    dict["@IsNewDesign"] = CheckBoxNewDesign.Checked;
                    dict["@OverView"] = CKEditorControlOverview.Text;
                    db.NonQueryDB(sqlSentence, dict);
                    db.CloseDB();

                    //編輯完後要更新HiddenField的型號資訊
                    //順便把Yacht型號也存進去，在編輯分頁都可以顯示
                    HiddenFieldYachtModel.Value = TextBoxModel.Text;
                    HiddenFieldYachtModelLength.Value = TextBoxModelLength.Text;


                    //每個Yacht都有一個資料夾存這篇新聞的圖片跟檔案，先取得路徑
                    string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                    //照慣例核對這個Yacht的資料夾
                    if (!Directory.Exists(FolderPath))
                    {
                        Directory.CreateDirectory(FolderPath);
                    }
                    //再核對這個Yacht資料夾裡的file副資料夾
                    string FileFolderPath = FolderPath + "/Files";
                    if (!Directory.Exists(FileFolderPath)) { Directory.CreateDirectory(FileFolderPath); }

                    int countFile = 0;

                    //File的新增
                    if (FileUploadFile.HasFiles)
                    {
                        foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                        {
                            string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                            string FilePath = Path.Combine(FileFolderPath, FileName);  // 取得 單一檔案 儲存路徑


                            sqlSentence = "Insert YachtFile (YachtId,FileName,FilePath) Values (@YachtId,@FileName,@FilePath)";
                            dict.Clear();
                            dict["@YachtId"] = YachtId;
                            dict["@FileName"] = FileName;
                            dict["@FilePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Files/" + FileName;
                            if (db.NonQueryDB(sqlSentence, dict) == 1)
                            {
                                countFile++;
                            }
                            db.CloseDB();
                            postedFile.SaveAs(FilePath);
                        }
                    }//File的新增結束

                    if (countFile == 0)
                    {
                        Response.Write($"<script>alert('編輯成功!!')</script>");
                    }
                    else
                    {
                        Response.Write($"<script>alert('編輯成功!!\\n並新增了{countFile}個Files')</script>");
                    }

                    ShowGvYachtFile();

                }//Yacht的OverView完成編輯
            }
        }


        //Yacht新增的第二步，Dimension資訊的新增
        protected void ButtonAddYachtDimension_Click(object sender, EventArgs e)
        {
            bool IsImage = true;



            if (FileUploadAddDimensionsImage.HasFiles)
            {
                foreach (HttpPostedFile file in FileUploadAddDimensionsImage.PostedFiles)
                {
                    string FileExtension = Path.GetExtension(file.FileName).ToLower();
                    if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                    {
                        Response.Write("<script>alert('選擇的圖片檔案有非圖片檔！')</script>");
                        IsImage = false;
                        break;
                    }
                }
            }
            else
            {
                IsImage = false;
                Response.Write("<script>alert('請上傳Dimension圖片！！')</script>");

            }

            //圖片檔沒問題之後就可以來新增DimensionItems了，有問題的話就不會進到if內。
            if (IsImage)
            {
                bool IsAllEmpty = true;
                for (int i = 1; i <= 8; i++)
                {
                    TextBox keyTextBox = (TextBox)PanelAddYachtDimension.FindControl("TextBoxDimensionItem" + i);
                    TextBox valueTextBox = (TextBox)PanelAddYachtDimension.FindControl("TextBoxDimensionValue" + i);

                    if (keyTextBox.Text.Trim() != "" && valueTextBox.Text.Trim() != "")
                    {
                        IsAllEmpty = false;
                        break;
                    }
                }

                if (IsAllEmpty)
                {
                    Response.Write("<script>alert('請至少輸入一個鍵值')</script>");
                }
                else
                {
                    string YachtId = HiddenFieldYachtId.Value;

                    //圖片的上傳
                    if (FileUploadAddDimensionsImage.HasFiles)
                    {

                        //照慣例檢查資料夾
                        string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                        if (!Directory.Exists(FolderPath))
                        {
                            Directory.CreateDirectory(FolderPath);
                        }
                        string DimensionFolderPath = FolderPath + "/Dimension";
                        if (!Directory.Exists(DimensionFolderPath)) { Directory.CreateDirectory(DimensionFolderPath); }

                        foreach (HttpPostedFile postedFile in FileUploadAddDimensionsImage.PostedFiles)
                        {
                            string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                            string FilePath = Path.Combine(DimensionFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                            sqlSentence = "Update Yacht Set [DimensionsImagePath]=@ImagePath Where Id=@YachtId";
                            dict.Clear();
                            dict["@YachtId"] = YachtId;
                            dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Dimension/" + FileName;
                            db.NonQueryDB(sqlSentence, dict);
                            db.CloseDB();
                            postedFile.SaveAs(FilePath);
                        }

                        //新增Dimension鍵值
                        Dictionary<string, string> dictDimension = new Dictionary<string, string>();
                        for (int i = 1; i <= 8; i++)
                        {
                            TextBox keyTextBox = (TextBox)PanelAddYachtDimension.FindControl($"TextBoxDimensionItem{i}");
                            TextBox valueTextBox = (TextBox)PanelAddYachtDimension.FindControl($"TextBoxDimensionValue{i}");

                            if (keyTextBox.Text.Trim() != "" && valueTextBox.Text.Trim() != "")
                            {
                                dictDimension.Add(keyTextBox.Text, valueTextBox.Text);
                            }
                        }

                        foreach (var item in dictDimension)
                        {
                            string key = item.Key;
                            string value = item.Value;
                            sqlSentence = "Insert Into [YachtDimension] ([YachtId],[Item],[Value]) Values (@YachtId,@Key,@Value);";
                            dict.Clear();
                            dict["@YachtId"] = YachtId;
                            dict["@Key"] = key;
                            dict["@Value"] = value;
                            db.NonQueryDB(sqlSentence, dict);
                            db.CloseDB();
                        }

                        //新增完成後就跳轉到Specification頁面
                        Response.Write($"<script>alert('設定Dimension成功，\\n" +
                            $"下一步請設定Specification。')</script>");

                        //文字方塊重設回初始狀態
                        string[] resetAddDimension = { "Hull length", "L.W.L.", "B. MAX", "Ballast", "Displacement", null, null, null };
                        for (int i = 0; i < 7; i++)
                        {
                            TextBox keyTextBox = (TextBox)PanelAddYachtDimension.FindControl($"TextBoxDimensionItem{i + 1}");
                            TextBox valueTextBox = (TextBox)PanelAddYachtDimension.FindControl($"TextBoxDimensionValue{i + 1}");

                            keyTextBox.Text = resetAddDimension[i];
                            valueTextBox.Text = null;
                        }

                        PanelAddYachtDimension.Visible = false;
                        PanelEditHeader.Visible = true;
                        PanelSpecification.Visible = true;
                        LabelSpecificationTitle.Text = $"Yacht：{HiddenFieldYachtModel.Value} {HiddenFieldYachtModelLength.Value}";

                    }//圖片上傳結束 

                }

            }
        }


        #region 檔案的GvFile

        //Yacht Overview裡的file GV的繫結
        public void ShowGvYachtFile()
        {
            sqlSentence = "Select ROW_NUMBER() Over (Order by Id) as 'Row',Id,FileName From YachtFile Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            GridViewFiles.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewFiles.DataBind();
            db.CloseDB();
        }
        protected void GridViewFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string FileId = GridViewFiles.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update YachtFile Set IsDelete=1 Where Id=@FileId;";
            dict.Clear();
            dict["@FileId"] = FileId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGvYachtFile();
            //跳轉到檔案的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#OverviewPanelFile'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);
        }

        protected void GridViewFiles_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewFiles.EditIndex = -1;
            ShowGvYachtFile();
            //跳轉到檔案的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#OverviewPanelFile'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);
        }

        protected void GridViewFiles_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewFiles.EditIndex = e.NewEditIndex;
            ShowGvYachtFile();
            //跳轉到檔案的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#OverviewPanelFile'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);
        }

        protected void GridViewFiles_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string FileId = GridViewFiles.DataKeys[rowIndex].Value.ToString();

            string newFileName = ((TextBox)GridViewFiles.Rows[rowIndex].FindControl("TextBoxFileName")).Text;

            sqlSentence = "Update YachtFile Set FileName=@FileName Where Id=@FileId;";
            dict.Clear();
            dict["@FileId"] = FileId;
            dict["@FileName"] = newFileName;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            GridViewFiles.EditIndex = -1;
            ShowGvYachtFile();
            //跳轉到檔案的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#OverviewPanelFile'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);

        }
        #endregion 檔案的GvFile結束

        #endregion Overview的CRUD


        //-------------------------------Dimension視窗的各項操作-------------------------------
        //-------------------------------Dimension視窗的各項操作-------------------------------
        //-------------------------------Dimension視窗的各項操作-------------------------------
        //-------------------------------Dimension視窗的各項操作-------------------------------
        //-------------------------------Dimension視窗的各項操作-------------------------------
        #region Dimension的CRUD


        #region Dimension的Gv操作
        //Dimension Gv的繫結
        public void ShowGvDimension()
        {
            sqlSentence = "Select ROW_NUMBER() Over (Order by Id) as 'Row',Id,Item,[Value] From YachtDimension Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            GridViewDimension.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewDimension.DataBind();
            db.CloseDB();

        }

        //Dimension Gv的刪除
        protected void GridViewDimension_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string DimensionId = GridViewDimension.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update YachtDimension Set IsDelete=1 Where Id=@DimensionId;";
            dict.Clear();
            dict["@DimensionId"] = DimensionId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGvDimension();
        }

        //Dimension Gv的取消編輯
        protected void GridViewDimension_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewDimension.EditIndex = -1;
            ShowGvDimension();
        }

        //Dimension Gv的進入編輯模式
        protected void GridViewDimension_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewDimension.EditIndex = e.NewEditIndex;
            ShowGvDimension();
        }

        //Dimension Gv的更新
        protected void GridViewDimension_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string DimensionId = GridViewDimension.DataKeys[rowIndex].Value.ToString();

            TextBox tbxItem = (TextBox)GridViewDimension.Rows[rowIndex].FindControl("TextBoxGvDimensionItem");
            TextBox tbxValue = (TextBox)GridViewDimension.Rows[rowIndex].FindControl("TextBoxGvDimensionValue");

            if (tbxItem.Text.Trim() != "" && tbxValue.Text.Trim() != "")
            {
                sqlSentence = "Update YachtDimension Set Item=@Item,[Value]=@Value Where Id=@DimensionId;";
                dict.Clear();
                dict["@DimensionId"] = DimensionId;
                dict["@Item"] = tbxItem.Text;
                dict["@Value"] = tbxValue.Text;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('編輯成功')</script>");
                }
                db.CloseDB();
                GridViewDimension.EditIndex = -1;
                ShowGvDimension();
            }
            else
            {
                Response.Write($"<script>alert('鍵值不可為空！')</script>");
            }

        }

        #endregion Dimension的Gv操作


        #region AddDimension的視窗呼喚/視窗關閉/新增。
        //開啟AddADimension的視窗的按鈕
        protected void ButtonCallAddDimensionItem_Click(object sender, EventArgs e)
        {
            PanelAddADimensionItem.Visible = true;
        }

        //在AddADimension，確認新增的按鈕
        protected void ButtonAddADimension_Click(object sender, EventArgs e)
        {
            if (TextBoxAddDimesionItem.Text.Trim() != "" && TextBoxAddDimesionValue.Text.Trim() != "")
            {
                string YachtId = HiddenFieldYachtId.Value;
                string item = TextBoxAddDimesionItem.Text;
                string value = TextBoxAddDimesionValue.Text;

                sqlSentence = "Insert YachtDimension (YachtId,Item,[Value]) Values (@YachtId,@Item,@Value);";
                dict.Clear();
                dict["@YachtId"] = YachtId;
                dict["@Item"] = item;
                dict["@Value"] = value;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('新增成功')</script>");
                }
                db.CloseDB();
                //新增完就清除文字方塊內容，不關閉視窗讓他可以繼續新增
                TextBoxAddDimesionItem.Text = null;
                TextBoxAddDimesionValue.Text = null;
                ShowGvDimension(); //因為下面會露出來看的到 所以還是要ShowGv
            }
            else
            {
                Response.Write($"<script>alert('鍵值不可為空！')</script>");
            }
        }

        //關閉AddADimension的視窗的按鈕
        protected void ButtonCloseAddADimension_Click(object sender, EventArgs e)
        {
            TextBoxAddDimesionItem.Text = null;
            TextBoxAddDimesionValue.Text = null;
            PanelAddADimensionItem.Visible = false;
            ShowGvDimension();
        }

        #endregion AddDimension的視窗呼喚/視窗關閉/新增。

        //Dimension視窗中，更換Image的按鈕
        protected void ButtonChangeDimensionImage_Click(object sender, EventArgs e)
        {
            if (FileUploadDimensionImage.HasFile)
            {
                bool IsImage = true;

                foreach (HttpPostedFile file in FileUploadDimensionImage.PostedFiles)
                {
                    string FileExtension = Path.GetExtension(file.FileName).ToLower();
                    if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                    {
                        Response.Write("<script>alert('上傳Album或Layout的選擇檔案有非圖片檔！')</script>");
                        IsImage = false;
                        break;
                    }
                }

                if (IsImage)
                {
                    string YachtId = HiddenFieldYachtId.Value;
                    //照慣例確認這個Yacht的資料夾，以及裡面的Dimension副資料夾
                    string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                    //先建立這個Yacht的資料夾
                    if (!Directory.Exists(FolderPath)) { Directory.CreateDirectory(FolderPath); }
                    string DimensionFolderPath = FolderPath + "/Dimension";
                    if (!Directory.Exists(DimensionFolderPath)) { Directory.CreateDirectory(DimensionFolderPath); }

                    foreach (HttpPostedFile postedFile in FileUploadDimensionImage.PostedFiles)
                    {
                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                        string FilePath = Path.Combine(DimensionFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                        sqlSentence = "Update Yacht Set [DimensionsImagePath]=@ImagePath Where Id=@YachtId";
                        dict.Clear();
                        dict["@YachtId"] = YachtId;
                        dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Dimension/" + FileName;
                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            Response.Write($"<script>alert('新增成功')</script>");
                        }
                        db.CloseDB();
                        postedFile.SaveAs(FilePath);
                        ImageDimensionImage.ImageUrl = $"/BackStage/YachtFiles/Yacht_{YachtId}/Dimension/" + FileName;

                    }
                }

            }
            else
            {
                Response.Write($"<script>alert('未選擇檔案')</script>");
            }
        }



        #endregion Dimension的CRUD



        //-------------------------------Album視窗的各項操作-------------------------------
        //-------------------------------Album視窗的各項操作-------------------------------
        //-------------------------------Album視窗的各項操作-------------------------------
        //-------------------------------Album視窗的各項操作-------------------------------
        //-------------------------------Album視窗的各項操作-------------------------------
        #region Album的CRUD

        //Album Panel中 新增Image的按鈕
        protected void ButtonAddAlbumImage_Click(object sender, EventArgs e)
        {
            if (FileUploadAddAlbumImages.HasFiles)
            {
                bool IsImage = true;

                foreach (HttpPostedFile file in FileUploadAddAlbumImages.PostedFiles)
                {
                    string FileExtension = Path.GetExtension(file.FileName).ToLower();
                    if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                    {
                        Response.Write("<script>alert('選擇的檔案中有非圖片檔！')</script>");
                        IsImage = false;
                        break;
                    }
                }

                if (IsImage)
                {
                    string YachtId = HiddenFieldYachtId.Value;
                    //照慣例確認這個Yacht的資料夾，以及裡面的Album副資料夾
                    string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                    if (!Directory.Exists(FolderPath)) { Directory.CreateDirectory(FolderPath); }
                    string AlbumFolderPath = FolderPath + "/Album";
                    if (!Directory.Exists(AlbumFolderPath)) { Directory.CreateDirectory(AlbumFolderPath); }

                    int count = 0;

                    foreach (HttpPostedFile postedFile in FileUploadAddAlbumImages.PostedFiles)
                    {
                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                        string FilePath = Path.Combine(AlbumFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                        sqlSentence = "Insert Into YachtAlbum (YachtId,ImageName,ImagePath) Values (@YachtId,@ImageName,@ImagePath);";
                        dict.Clear();
                        dict["@YachtId"] = YachtId;
                        dict["@ImageName"] = FileName;
                        dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Album/" + FileName;
                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            count++;
                        }
                        db.CloseDB();
                        postedFile.SaveAs(FilePath);
                    }
                    Response.Write($"<script>alert('新增Album Image成功，\\n共新增了{count}張Image')</script>");
                    ShowGvAlbum();
                }

            }
            else
            {
                Response.Write($"<script>alert('未選擇檔案')</script>");
            }
        }


        #region Album Gv的操作

        //Album的GV 繫結
        public void ShowGvAlbum()
        {
            string yachtId = HiddenFieldYachtId.Value;

            sqlSentence = "Select Row_Number() Over (Order by Id) as 'Row',Id,ImagePath From YachtAlbum Where IsDelete=0 And YachtId=@YachtID;";
            dict.Clear();
            dict["@YachtId"] = yachtId;
            GridViewAlbum.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewAlbum.DataBind();
            db.CloseDB();
        }

        //Album的GV 繫結後綁定封面的Radio button
        protected void GridViewAlbum_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RadioButton radiobtn = (RadioButton)e.Row.FindControl("RadioButtonCover");
                radiobtn.GroupName = "AlbumCover";

                string Id = GridViewAlbum.DataKeys[e.Row.RowIndex].Value.ToString();
                if (Id == HiddenFieldCoverId.Value)
                {
                    radiobtn.Checked = true;
                }
            }
        }

        //Album的GV裡的封面的Radio button被選擇的時候，切換封面
        protected void RadioButtonCover_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioBtn = (RadioButton)sender;
            GridViewRow Row = (GridViewRow)radioBtn.NamingContainer;
            String NewCoverId = GridViewAlbum.DataKeys[Row.RowIndex].Value.ToString();
            HiddenFieldCoverId.Value = NewCoverId;
            String YachtId = HiddenFieldYachtId.Value;
            sqlSentence = "Update Yacht Set CoverId=@NewCoverId Where Id=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            dict["@NewCoverId"] = NewCoverId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write("<script>alert('修改封面成功!')</script>");
            }
            db.CloseDB();
            ShowGvAlbum();
        }

        //Album的GV 刪除 (刪除時要注意是不是封面)
        protected void GridViewAlbum_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //先計算照片是不是最後一張，是的話不給刪！！
            sqlSentence = "Select count(*) From YachtAlbum Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["YachtId"] = HiddenFieldYachtId.Value;
            string count = db.SearchDBscalar(sqlSentence, dict).ToString();
            db.CloseDB();
            if (count == "1")
            {
                Response.Write($"<script>alert('不可刪除最後一張照片')</script>");
            }
            else
            {
                //不是最後一張 所以給刪
                //先抓要刪除的照片ID
                int rowIndex = e.RowIndex;
                string ImageId = GridViewAlbum.DataKeys[rowIndex].Value.ToString();

                //刪除照片，如果照片是封面的話，待會要更改封面
                sqlSentence = "Update YachtAlbum Set IsDelete=1 Where Id=@ImageId;";
                dict.Clear();
                dict["@ImageId"] = ImageId;
                db.NonQueryDB(sqlSentence, dict);
                db.CloseDB();

                //判斷要刪除的照片是不是現在封面，是的話要先改封面再來刪除，不是的話就直接刪除
                if (ImageId == HiddenFieldCoverId.Value)
                {
                    sqlSentence = "Select Top 1 Id From YachtAlbum Where IsDelete=0 And YachtId=@YachtId;";
                    dict.Clear();
                    dict["@YachtId"] = HiddenFieldYachtId.Value;
                    string newCoverId = db.SearchDBscalar(sqlSentence, dict).ToString();
                    HiddenFieldCoverId.Value = newCoverId;
                    db.CloseDB();
                    sqlSentence = "Update Yacht Set CoverId=@NewCoverId Where Id=@YachtId;";
                    dict.Clear();
                    dict["@YachtId"] = HiddenFieldYachtId.Value;
                    dict["@NewCoverId"] = newCoverId;
                    db.NonQueryDB(sqlSentence, dict);
                    db.CloseDB();

                }

                Response.Write("<script>alert('刪除成功!')</script>");
                ShowGvAlbum();
            }
        }

        #endregion


        #endregion Album的CRUD



        //-------------------------------Layout視窗的各項操作-------------------------------
        //-------------------------------Layout視窗的各項操作-------------------------------
        //-------------------------------Layout視窗的各項操作-------------------------------
        //-------------------------------Layout視窗的各項操作-------------------------------
        //-------------------------------Layout視窗的各項操作-------------------------------
        #region Layout的CRUD


        public void ShowGvLayout()
        {
            sqlSentence = "Select Row_Number() Over (Order by Id) as 'Row',Id,ImagePath From YachtLayout Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            GridViewLayout.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewLayout.DataBind();
            db.CloseDB();

        }

        //Layou Gv的刪除
        protected void GridViewLayout_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //先計算照片是不是最後一張，是的話不給刪！！
            sqlSentence = "Select count(*) From YachtLayout Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["YachtId"] = HiddenFieldYachtId.Value;
            string count = db.SearchDBscalar(sqlSentence, dict).ToString();
            db.CloseDB();
            if (count == "1")
            {
                Response.Write($"<script>alert('不可刪除最後一張照片')</script>");
            }
            else
            {
                //不是最後一張 所以給刪

                //先抓要刪除的照片ID
                int rowIndex = e.RowIndex;
                string ImageId = GridViewLayout.DataKeys[rowIndex].Value.ToString();

                //刪除照片
                sqlSentence = "Update YachtLayout Set IsDelete=1 Where Id=@ImageId;";
                dict.Clear();
                dict["@ImageId"] = ImageId;
                db.NonQueryDB(sqlSentence, dict);
                db.CloseDB();

                Response.Write("<script>alert('刪除成功!')</script>");
                ShowGvLayout();
            }
        }

        //Layou視窗的新增Layout Images的按鈕
        protected void ButtonAddLayout_Click(object sender, EventArgs e)
        {
            if (FileUploadAddLayout.HasFiles)
            {

                bool IsImage = true;

                foreach (HttpPostedFile file in FileUploadAddLayout.PostedFiles)
                {
                    string FileExtension = Path.GetExtension(file.FileName).ToLower();
                    if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                    {
                        Response.Write("<script>alert('選擇的檔案中有非圖片檔！')</script>");
                        IsImage = false;
                        break;
                    }
                }

                if (IsImage)
                {
                    string YachtId = HiddenFieldYachtId.Value;
                    //照慣例確認這個Yacht的資料夾，以及裡面的Layout副資料夾
                    string FolderPath = Server.MapPath($"~/BackStage/YachtFiles/Yacht_{YachtId}");
                    if (!Directory.Exists(FolderPath)) { Directory.CreateDirectory(FolderPath); }
                    string LayoutFolderPath = FolderPath + "/Layout";
                    if (!Directory.Exists(LayoutFolderPath)) { Directory.CreateDirectory(LayoutFolderPath); }

                    int count = 0;

                    foreach (HttpPostedFile postedFile in FileUploadAddLayout.PostedFiles)
                    {
                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                        string FilePath = Path.Combine(LayoutFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                        sqlSentence = "Insert Into YachtLayout (YachtId,ImageName,ImagePath) Values (@YachtId,@ImageName,@ImagePath);";
                        dict.Clear();
                        dict["@YachtId"] = YachtId;
                        dict["@ImageName"] = FileName;
                        dict["@ImagePath"] = $"/BackStage/YachtFiles/Yacht_{YachtId}/Layout/" + FileName;
                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            count++;
                        }
                        db.CloseDB();
                        postedFile.SaveAs(FilePath);
                    }
                    Response.Write($"<script>alert('新增Layout Image成功，\\n共新增了{count}張Image')</script>");
                    ShowGvLayout();
                }
            }
            else
            {
                Response.Write($"<script>alert('未選擇檔案')</script>");
            }
        }



        #endregion Layout的CRUD


        //-------------------------------Specification視窗的各項操作-------------------------------
        //-------------------------------Specification視窗的各項操作-------------------------------
        //-------------------------------Specification視窗的各項操作-------------------------------
        //-------------------------------Specification視窗的各項操作-------------------------------
        //-------------------------------Specification視窗的各項操作-------------------------------
        #region Specification的CRUD


        #region Details的各項操作與GV操作

        //在編輯Yacht的Specification畫面，下拉式選單更改不同類型時的GV更新
        protected void DropDownListSpecificationTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowGvSpecificationDetails();
        }

        //Specification Details的ShowDrop
        public void ShowDropSpecificationDetails()
        {
            string YachtId = HiddenFieldYachtId.Value;
            sqlSentence = "Select * From YachtSpecification Where YachtId=@YachtId And IsDelete=0;";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            DropDownListSpecificationTitle.DataTextField = "Name";
            DropDownListSpecificationTitle.DataValueField = "Id";
            DropDownListSpecificationTitle.DataSource = db.SearchDB(sqlSentence, dict);
            DropDownListSpecificationTitle.DataBind();
            //DropDownListSpecificationTitle.Items.Insert(0, new ListItem("未選擇", "-1"));
            db.CloseDB();
        }

        //Specification Details的ShowGV
        public void ShowGvSpecificationDetails()
        {
            string titleId = DropDownListSpecificationTitle.SelectedValue;
            sqlSentence = "Select ROW_NUMBER() over(Order by Id) as 'Row',* From YachtSpecificationItem Where YachtSpecificationId=@YachtSpecificationId  And IsDelete=0;";
            dict.Clear();
            dict["@YachtSpecificationId"] = titleId;
            GridViewSpecification.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewSpecification.DataBind();
            db.CloseDB();
        }

        //Specification的Details GV 刪除
        protected void GridViewSpecification_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string itemId = GridViewSpecification.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update YachtSpecificationItem Set IsDelete=1 Where Id =@ItemId;";
            dict.Clear();
            dict["@ItemId"] = itemId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGvSpecificationDetails();   // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        //Specification的Details GV 進入編輯模式
        protected void GridViewSpecification_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewSpecification.EditIndex = e.NewEditIndex; // 將資料行轉換為：編輯模式
            ShowGvSpecificationDetails();   // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        //Specification的Details GV 更新
        protected void GridViewSpecification_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string itemId = GridViewSpecification.DataKeys[rowIndex].Value.ToString();

            string newItemName = ((TextBox)GridViewSpecification.Rows[rowIndex].FindControl("TextBoxItem")).Text;

            sqlSentence = "Update YachtSpecificationItem Set Item=@NewItemName Where Id =@ItemId;";
            dict.Clear();
            dict["@ItemId"] = itemId;
            dict["@newItemName"] = newItemName;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            GridViewSpecification.EditIndex = -1;  // 將資料行取消：編輯模式
            ShowGvSpecificationDetails();  // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        //Specification的Details GV
        protected void GridViewSpecification_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewSpecification.EditIndex = -1;  // 將資料行取消：編輯模式
            ShowGvSpecificationDetails();   // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        #endregion Details的操作結束


        #region Title視窗的呼喚與關閉

        //Specification的呼喚Detail Title視窗
        protected void ButtonCallAddDetailTitle_Click(object sender, EventArgs e)
        {
            PanelSpecificationDetailTitle.Visible = true;
            ShowGvSpecificationDetailTitle();
        }

        //Specification的Detail Title新增
        protected void ButtonSubmitAddDetailTitle_Click(object sender, EventArgs e)
        {
            if (!TextBoxAddDetailTitle.Text.IsNullOrWhiteSpace())
            {
                string YachtId = HiddenFieldYachtId.Value;
                sqlSentence = "Insert Into YachtSpecification (YachtId,[Name]) Values (@YachtId,@Title);";
                dict.Clear();
                dict["@YachtId"] = YachtId;
                dict["@Title"] = TextBoxAddDetailTitle.Text;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('新增成功！')</script>");
                }
                db.CloseDB();
                TextBoxAddDetailTitle.Text = null;
                ShowGvSpecificationDetailTitle();
            }
            else
            {
                Response.Write($"<script>alert('未輸入Titie內容')</script>");
            }
        }

        //Title視窗關閉
        protected void ButtonCloseSpecificationDetailTitle_Click(object sender, EventArgs e)
        {
            TextBoxAddDetailTitle.Text = null;
            PanelSpecificationDetailTitle.Visible = false;
            ShowDropSpecificationDetails();
            ShowGvSpecificationDetails();
        }

        #region  Detail Title GV操作

        //Specification的Detail Title的GV呈現
        public void ShowGvSpecificationDetailTitle()
        {
            string YachtId = HiddenFieldYachtId.Value;
            sqlSentence = "Select ROW_NUMBER() over(Order by Id ASC) as 'Row',* From YachtSpecification Where YachtId=@YachtId  And IsDelete=0;";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            GridViewDetailTitle.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewDetailTitle.DataBind();
            db.CloseDB();
        }

        //DetailTitle的GV進入編輯模式
        protected void GridViewDetailTitle_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewDetailTitle.EditIndex = e.NewEditIndex;  // 將資料行轉換為：編輯模式
            ShowGvSpecificationDetailTitle();  // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        //DetailTitle的GV 取消編輯
        protected void GridViewDetailTitle_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewDetailTitle.EditIndex = -1;  // 將資料行取消：編輯模式
            ShowGvSpecificationDetailTitle();  // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯
        }

        //DetailTitle的GV 刪除
        protected void GridViewDetailTitle_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string titleId = GridViewDetailTitle.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update YachtSpecification Set IsDelete=1 Where Id =@TitleId;";
            dict.Clear();
            dict["@TitleId"] = titleId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            ShowGvSpecificationDetailTitle();  // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯

        }

        //DetailTitle的GV 編輯完成

        protected void GridViewDetailTitle_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string titleId = GridViewDetailTitle.DataKeys[rowIndex].Value.ToString();

            string newTitleName = ((TextBox)GridViewDetailTitle.Rows[rowIndex].FindControl("TextBoxTitleName")).Text;

            sqlSentence = "Update YachtSpecification Set Name=@NewTitleName Where Id =@TitleId;";
            dict.Clear();
            dict["@TitleId"] = titleId;
            dict["@newTitleName"] = newTitleName;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            GridViewDetailTitle.EditIndex = -1;  // 將資料行取消：編輯模式
            ShowGvSpecificationDetailTitle();  // 記得呼叫讀取Griview的function，進行重新Binding，不然會出錯

        }



        #endregion Detail Title GV結束

        #endregion


        #region Add Details Item的視窗呼喚與確認新增按鈕&關閉按鈕

        //Specification的呼喚Add Details視窗
        protected void ButtonCallAddDetails_Click(object sender, EventArgs e)
        {

            PanelSpecificationDetails.Visible = true;
            //叫出視窗後，要渲染下拉式選單，選新增的Items的類型。
            sqlSentence = "Select * From YachtSpecification Where YachtId=@YachtId And IsDelete=0;";
            dict.Clear();
            dict["@YachtId"] = HiddenFieldYachtId.Value;
            DropDownListAddDetailsSelectTitle.DataTextField = "Name";
            DropDownListAddDetailsSelectTitle.DataValueField = "Id";
            DropDownListAddDetailsSelectTitle.DataSource = db.SearchDB(sqlSentence, dict);
            DropDownListAddDetailsSelectTitle.DataBind();
            DropDownListSpecificationTitle.SelectedIndex = DropDownListSpecificationTitle.SelectedIndex;
        }

        //編輯Yacht的Specification->Add Details的確認新增按鈕 新增Details Items。
        protected void Button1SubmitAddDetails_Click(object sender, EventArgs e)
        {
            bool IsAllEmpty = true;
            for (int i = 1; i <= 10; i++)
            {
                TextBox TextBoxAddDetails = (TextBox)PanelSpecificationDetails.FindControl("TextBoxAddDetails" + i);


                if (TextBoxAddDetails.Text.Trim() != "")
                {
                    IsAllEmpty = false;
                    break;
                }
            }

            if (IsAllEmpty)
            {
                Response.Write("<script>alert('請至少輸入一個Item')</script>");
            }
            else
            {
                int countDetails = 0;
                string YachtSpecificationId = DropDownListAddDetailsSelectTitle.SelectedValue;
                //至少有填一個的話就開始新增
                for (int i = 1; i <= 10; i++)
                {
                    TextBox TextBoxAddDetails = (TextBox)PanelSpecificationDetails.FindControl("TextBoxAddDetails" + i);

                    if (TextBoxAddDetails.Text.Trim() != "")
                    {
                        sqlSentence = "Insert Into YachtSpecificationItem (YachtSpecificationId,Item) Values (@YachtSpecificationId,@Item)";
                        dict.Clear();
                        dict["@YachtSpecificationId"] = YachtSpecificationId;
                        dict["@Item"] = TextBoxAddDetails.Text;
                        db.NonQueryDB(sqlSentence, dict);
                        db.CloseDB();
                        countDetails++;
                    }
                }
                Response.Write($"<script>alert('新增成功\\n一共新增了{countDetails}個Item。')</script>");
                //新增完後清空文字方塊
                ClearDetailsAddTxbContents();
            }
        }


        //Add Details視窗的關閉前的文字方塊清空
        public void ClearDetailsAddTxbContents()
        {
            for (int i = 1; i <= 10; i++)
            {
                TextBox TextBoxAddDetails = (TextBox)PanelSpecificationDetails.FindControl("TextBoxAddDetails" + i);

                TextBoxAddDetails.Text = null;
            }
            ShowGvSpecificationDetails();
        }


        //關閉Add Details視窗的按鈕
        protected void ButtonCloseAddDetails_Click(object sender, EventArgs e)
        {
            ClearDetailsAddTxbContents();
            PanelSpecificationDetails.Visible = false;
        }

        #endregion



        #endregion


    }
}