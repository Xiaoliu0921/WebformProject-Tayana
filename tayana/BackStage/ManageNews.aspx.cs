using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Razor.Tokenizer;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using tayana.ForeStage;

namespace tayana.BackStage
{
    public partial class ManageNews : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";
        Random rand = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowGvNews();
            }

        }

        public void ShowGvNews()
        {
            sqlSentence = "Select ROW_NUMBER() over(Order by IsTop Desc,NewsDate Desc) as 'Row',N.Id,N.Title,NI.ImagePath,N.NewsDate,N.IsTop From News as N Left Join NewsImage as NI On N.CoverId=NI.Id Where N.IsDelete=0 Order by IsTop Desc,NewsDate Desc";
            GridViewNews.DataSource = db.SearchDB(sqlSentence);
            GridViewNews.DataBind();
            db.CloseDB();
        }

        public void ShowGvFile()
        {
            string NewsId = HiddenFieldNewsId.Value;
            sqlSentence = "Select ROW_NUMBER() over(Order by Id ASC) as 'Row',Id,FileName From NewsFile Where NewsId=@NewsId And IsDelete=0";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            GridViewFiles.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewFiles.DataBind();
            db.CloseDB();
        }

        public void ShowGvImg()
        {
            string NewsId = HiddenFieldNewsId.Value;
            sqlSentence = "Select ROW_NUMBER() over(Order by Id ASC) as 'Row',Id,ImagePath From NewsImage Where NewsId=@NewsId And IsDelete=0";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            GridViewImages.DataSource = db.SearchDB(sqlSentence, dict);
            GridViewImages.DataBind();
            db.CloseDB();

        }


        protected void BtnCallAddNews_Click(object sender, EventArgs e)
        {
            PanelEdit.Visible = true;
            LblPanelTitle.Text = "Add a News";
            ButtonSubmit.Text = "確認新增";
            TextBoxDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }

        //News的文章確認新增&確認修改
        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            bool HasFile = FileUploadFile.HasFile;
            bool HasImg = FileUploadImage.HasFile;
            if (LblPanelTitle.Text == "Add a News" && ButtonSubmit.Text == "確認新增")
            {
                //先判斷是否有標題(是否為空字串)  ->有選圖片的話確認是不是圖片檔
                if (!(TextBoxTitle.Text.Trim() == ""))
                {
                    if (HasImg)
                    {
                        //有選擇上傳圖片的話，判斷選擇的檔案有沒有非圖片檔
                        bool IsImage = true;
                        foreach (var postedFile in FileUploadImage.PostedFiles)
                        {
                            string FileExtension = Path.GetExtension(postedFile.FileName).ToLower();
                            if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                            {
                                Response.Write("<script>alert('上傳圖片的選擇檔案有非圖片檔！')</script>");
                                IsImage = false;
                                break;
                            }
                        }


                        if (IsImage)
                        {
                            string title = TextBoxTitle.Text;
                            DateTime newsDate = Convert.ToDateTime(TextBoxDate.Text);
                            string content = CKEditorContent.Text;
                            sqlSentence = "Insert Into News(Title,NewsDate,[Content],HasFile,HasImage) Values (@Title,@NewsDate,@Content,@HasFile,@HasImage)";
                            dict.Clear();
                            dict["@Title"] = title;
                            dict["@NewsDate"] = newsDate;
                            dict["@Content"] = content;
                            dict["@HasFile"] = HasFile;
                            dict["@HasImage"] = HasImg;
                            if (db.NonQueryDB(sqlSentence, dict) == 1)
                            {
                                db.CloseDB();
                                //新增新聞成功之後取得新聞ID來做檔案跟圖片的db存取
                                sqlSentence = "Select Top 1 Id From News Order by Id Desc;";
                                SqlDataReader rd = db.SearchDB(sqlSentence);
                                rd.Read();
                                string NewsId = rd.GetInt32(rd.GetOrdinal("Id")).ToString();
                                db.CloseDB();

                                //每個News都創建一個資料夾存這篇新聞的圖片跟檔案
                                string NewsFolderPath = Server.MapPath($"~/BackStage/NewsFiles/News_{NewsId}");
                                if (!Directory.Exists(NewsFolderPath))
                                {
                                    Directory.CreateDirectory(NewsFolderPath);
                                }

                                int countImages = 0;
                                int countFiles = 0;

                                //檔案有選擇就做檔案的上傳
                                if (HasFile)
                                {
                                    sqlSentence = "Insert Into NewsFile([NewsId],[FileName],[FilePath]) Values (@NewsId,@FileName,@FilePath);";
                                    foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                                    {
                                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                        string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                        //while (File.Exists(FilePath))
                                        //{
                                        //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                        //    FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                                        //}

                                        dict.Clear();
                                        dict["@NewsId"] = NewsId;
                                        dict["@FileName"] = FileName;
                                        dict["@FilePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                                        {
                                            countFiles++;
                                        }
                                        db.CloseDB();
                                        postedFile.SaveAs(FilePath);

                                    }
                                }

                                //圖片有選擇就做圖片的上傳
                                if (HasImg)
                                {
                                    sqlSentence = "Insert Into NewsImage([NewsId],[ImageName],[ImagePath]) Values (@NewsId,@ImageName,@ImagePath)";
                                    foreach (HttpPostedFile postedFile in FileUploadImage.PostedFiles)
                                    {
                                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                        string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                        //while (File.Exists(FilePath))
                                        //{
                                        //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                        //    FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                                        //}


                                        dict.Clear();
                                        dict["@NewsId"] = NewsId;
                                        dict["@ImageName"] = FileName;
                                        dict["@ImagePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                                        {
                                            countImages++;
                                        }
                                        db.CloseDB();
                                        postedFile.SaveAs(FilePath);
                                    }
                                    //圖片上傳後來設定封面(上傳傳時的第一張)

                                    //先取得第一張的照片ID
                                    sqlSentence = "Select Id From (Select ROW_NUMBER() Over(Order by Id DESC) as [Rank],Id From NewsImage )as subQ Where [Rank]=@CountImage";
                                    dict.Clear();
                                    dict["@CountImage"] = countImages;
                                    string CoverId = db.SearchDBscalar(sqlSentence, dict).ToString();
                                    HiddenCoverID.Value = CoverId;
                                    db.CloseDB();
                                    //取得ID後來設定進新聞的CoverID
                                    sqlSentence = $"Update News Set CoverId={CoverId} Where Id=@NewsId";
                                    dict.Clear();
                                    dict["@NewsId"] = NewsId;
                                    db.NonQueryDB(sqlSentence, dict);
                                    db.CloseDB();
                                }

                                Response.Write($"<script>alert('新增成功！共新增了{countImages}張相片及{countFiles}個檔案')</script>");
                                //新增成功後回到News後台主頁並將編輯頁文字重置，別忘了刷新主頁GridView
                                ResetEditPanel();
                                ShowGvNews();
                            }
                            else //新增News失敗!!!!
                            {
                                db.CloseDB();
                            }
                        }
                        else //有選擇上傳圖片的話，有上傳非圖片檔
                        {
                            //剛剛已經有跳錯，就不做動作了
                        }


                    }
                    else //未上傳圖片的狀況，封面會是預設值
                    {
                        string title = TextBoxTitle.Text;
                        DateTime newsDate = Convert.ToDateTime(TextBoxDate.Text);
                        string content = CKEditorContent.Text;
                        sqlSentence = "Insert Into News(Title,NewsDate,[Content],HasFile,HasImage) Values (@Title,@NewsDate,@Content,@HasFile,@HasImage)";
                        dict.Clear();
                        dict["@Title"] = title;
                        dict["@NewsDate"] = newsDate;
                        dict["@Content"] = content;
                        dict["@HasFile"] = HasFile;
                        dict["@HasImage"] = HasImg;
                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            db.CloseDB();
                            //新增新聞成功之後取得新聞ID來做檔案跟圖片的db存取
                            sqlSentence = "Select Top 1 Id From News Order by Id Desc;";
                            SqlDataReader rd = db.SearchDB(sqlSentence);
                            rd.Read();
                            string NewsId = rd.GetInt32(rd.GetOrdinal("Id")).ToString();
                            db.CloseDB();

                            //每個News都創建一個資料夾存這篇新聞的圖片跟檔案
                            string NewsFolderPath = Server.MapPath($"~/BackStage/NewsFiles/News_{NewsId}");
                            if (!Directory.Exists(NewsFolderPath))
                            {
                                Directory.CreateDirectory(NewsFolderPath);
                            }

                            int countImages = 0;
                            int countFiles = 0;

                            //檔案有選擇就做檔案的上傳
                            if (HasFile)
                            {
                                sqlSentence = "Insert Into NewsFile([NewsId],[FileName],[FilePath]) Values (@NewsId,@FileName,@FilePath);";
                                foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                                {
                                    string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                    string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                    //while (File.Exists(FilePath))
                                    //{
                                    //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                    //}
                                    //FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                    dict.Clear();
                                    dict["@NewsId"] = NewsId;
                                    dict["@FileName"] = FileName;
                                    dict["@FilePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                    if (db.NonQueryDB(sqlSentence, dict) == 1)
                                    {
                                        countFiles++;
                                    }
                                    db.CloseDB();
                                    postedFile.SaveAs(FilePath);
                                }
                            }
                            Response.Write($"<script>alert('新增成功！共新增了{countImages}張相片及{countFiles}個檔案')</script>");
                            //新增成功後回到News後台主頁並將編輯頁文字重置，別忘了刷新主頁GridView
                            ResetEditPanel();
                            ShowGvNews();
                        }
                        else //新增News失敗!!!!
                        {
                            db.CloseDB();
                        }
                    }

                }
                else //未輸入標題的else
                {
                    Response.Write($"<script>alert('未輸入Title')</script>");
                }
            }
            else if (LblPanelTitle.Text == "Edit a News" && ButtonSubmit.Text == "確認修改")
            {

                //先判斷是否有標題(是否為空字串)  ->有選圖片的話確認是不是圖片檔
                if (!(TextBoxTitle.Text.Trim() == ""))
                {
                    if (HasImg)
                    {
                        //有選擇上傳圖片的話，判斷選擇的檔案有沒有非圖片檔
                        bool IsImage = true;
                        foreach (var postedFile in FileUploadImage.PostedFiles)
                        {
                            string FileExtension = Path.GetExtension(postedFile.FileName).ToLower();
                            if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                            {
                                Response.Write("<script>alert('上傳圖片的選擇檔案有非圖片檔！')</script>");
                                IsImage = false;
                                break;
                            }
                        }


                        if (IsImage)
                        {
                            //因為要判斷HasFile跟HasImage是否有變化，先處理完檔案/圖片新增後再來編輯News的db
                            string NewsId = HiddenFieldNewsId.Value;

                            //每個News都有一個資料夾存這篇新聞的圖片跟檔案，先取得路徑
                            string NewsFolderPath = Server.MapPath($"~/BackStage/NewsFiles/News_{NewsId}");
                            if (!Directory.Exists(NewsFolderPath))
                            {
                                Directory.CreateDirectory(NewsFolderPath);
                            }

                            int countImages = 0;
                            int countFiles = 0;

                            //檔案有選擇就做檔案的上傳
                            if (HasFile)
                            {
                                sqlSentence = "Insert Into NewsFile([NewsId],[FileName],[FilePath]) Values (@NewsId,@FileName,@FilePath);";
                                foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                                {
                                    string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                    string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                    //while (File.Exists(FilePath))
                                    //{
                                    //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                    //    FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                                    //}

                                    dict.Clear();
                                    dict["@NewsId"] = NewsId;
                                    dict["@FileName"] = FileName;
                                    dict["@FilePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                    if (db.NonQueryDB(sqlSentence, dict) == 1)
                                    {
                                        countFiles++;
                                    }
                                    db.CloseDB();
                                    postedFile.SaveAs(FilePath);
                                }
                            }

                            //圖片有選擇就做圖片的上傳
                            if (HasImg)
                            {
                                sqlSentence = "Insert Into NewsImage([NewsId],[ImageName],[ImagePath]) Values (@NewsId,@ImageName,@ImagePath)";
                                foreach (HttpPostedFile postedFile in FileUploadImage.PostedFiles)
                                {
                                    string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                    string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                    //while (File.Exists(FilePath))
                                    //{
                                    //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                    //    FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                                    //}


                                    dict.Clear();
                                    dict["@NewsId"] = NewsId;
                                    dict["@ImageName"] = FileName;
                                    dict["@ImagePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                    if (db.NonQueryDB(sqlSentence, dict) == 1)
                                    {
                                        countImages++;
                                    }
                                    db.CloseDB();
                                    postedFile.SaveAs(FilePath);
                                }
                                //如果本來沒有放照片，上傳圖片後需要放照片
                                if (!Convert.ToBoolean(HiddenFieldHasImage.Value)) 
                                {
                                    sqlSentence = "Select Top 1 Id From NewsImage Where NewsId=@NewsId And IsDelete=0 Order by Id Asc";
                                    dict.Clear();
                                    dict.Add("@NewsId", HiddenFieldNewsId.Value);
                                    string newCoverId=db.SearchDBscalar(sqlSentence, dict).ToString();
                                    //直接修改進HiddenField裡
                                    HiddenCoverID.Value=newCoverId;
                                    db.CloseDB();
                                }


                            }

                            ///////////////////////////////////////////
                            string title = TextBoxTitle.Text;
                            DateTime newsDate = Convert.ToDateTime(TextBoxDate.Text);
                            string content = CKEditorContent.Text;
                            if (HasFile || Convert.ToBoolean(HiddenFieldHasFile.Value))
                            {
                                HasFile = true;
                            }

                            if (HasImg || Convert.ToBoolean(HiddenFieldHasImage.Value))
                            {
                                HasImg = true;
                            }


                            sqlSentence = "Update News Set Title=@Title,CoverId=@CoverId,NewsDate=@NewsDate,[Content]=@Content,HasFile=@HasFile,HasImage=@HasImage Where Id=@NewsId";
                            dict.Clear();
                            dict["@NewsId"] = NewsId;
                            dict["@Title"] = title;
                            dict["@NewsDate"] = newsDate;
                            dict["@CoverId"] = HiddenCoverID.Value;
                            dict["@Content"] = content;
                            dict["@HasFile"] = HasFile;
                            dict["@HasImage"] = HasImg;
                            db.NonQueryDB(sqlSentence, dict);
                            db.CloseDB();
                            ///////////////////////////////////////////
                            ///
                            Response.Write($"<script>alert('編輯成功！並且新增了{countImages}張相片及{countFiles}個檔案')</script>");
                            //新增成功後回到News後台主頁並將編輯頁文字重置，別忘了刷新主頁GridView
                            ResetEditPanel();
                            ShowGvNews();
                        }
                        else //有選擇上傳圖片的話，有上傳非圖片檔就要跳錯
                        {
                            //剛剛已經有跳錯誤訊息，就不做動作了
                        }
                    }
                    else //未上傳圖片的狀況，就處理編輯資料+檔案上傳
                    {
                        //因為要判斷HasFile跟HasImage是否有變化，先處理完檔案/圖片新增後再來編輯News的db
                        string NewsId = HiddenFieldNewsId.Value;

                        //每個News都有一個資料夾存這篇新聞的圖片跟檔案，先取得路徑
                        string NewsFolderPath = Server.MapPath($"~/BackStage/NewsFiles/News_{NewsId}");
                        if (!Directory.Exists(NewsFolderPath))
                        {
                            Directory.CreateDirectory(NewsFolderPath);
                        }

                        int countImages = 0;
                        int countFiles = 0;

                        //檔案有選擇就做檔案的上傳
                        if (HasFile)
                        {
                            sqlSentence = "Insert Into NewsFile([NewsId],[FileName],[FilePath]) Values (@NewsId,@FileName,@FilePath);";
                            foreach (HttpPostedFile postedFile in FileUploadFile.PostedFiles)
                            {
                                string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                                string FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                                //while (File.Exists(FilePath))
                                //{
                                //    FileName = Path.GetFileName(postedFile.FileName) + (rand.Next().ToString());
                                //    FilePath = Path.Combine(NewsFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                                //}

                                dict.Clear();
                                dict["@NewsId"] = NewsId;
                                dict["@FileName"] = FileName;
                                dict["@FilePath"] = $"/BackStage/NewsFiles/News_{NewsId}/" + FileName;
                                if (db.NonQueryDB(sqlSentence, dict) == 1)
                                {
                                    countFiles++;
                                }
                                db.CloseDB();
                                postedFile.SaveAs(FilePath);
                            }
                        }

                        ///////////////////////////////////////////
                        string title = TextBoxTitle.Text;
                        DateTime newsDate = Convert.ToDateTime(TextBoxDate.Text);
                        string content = CKEditorContent.Text;
                        if (HasFile || Convert.ToBoolean(HiddenFieldHasFile.Value))
                        {
                            HasFile = true;
                        }

                        if (HasImg || Convert.ToBoolean(HiddenFieldHasImage.Value))
                        {
                            HasImg = true;
                        }

                        sqlSentence = "Update News Set Title=@Title,NewsDate=@NewsDate,[Content]=@Content,HasFile=@HasFile,HasImage=@HasImage Where Id=@NewsId";
                        dict.Clear();
                        dict["@NewsId"] = NewsId;
                        dict["@Title"] = title;
                        dict["@NewsDate"] = newsDate;
                        dict["@Content"] = content;
                        dict["@HasFile"] = HasFile;
                        dict["@HasImage"] = HasImg;
                        db.NonQueryDB(sqlSentence, dict);
                        db.CloseDB();
                        ///////////////////////////////////////////

                        Response.Write($"<script>alert('編輯成功！並且新增了{countImages}張相片及{countFiles}個檔案')</script>");
                        //新增成功後回到News後台主頁並將編輯頁文字重置，別忘了刷新主頁GridView
                        ResetEditPanel();
                        ShowGvNews();
                    }
                }
                else
                {
                    Response.Write($"<script>alert('未輸入Title')</script>");
                }

            }
        }

        //關閉Panel視窗
        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            ResetEditPanel();
            ShowGvNews();
        }

        //關閉編輯Panel視窗時的Method
        public void ResetEditPanel()
        {
            LblPanelTitle.Text = "Add / Edit";
            ButtonSubmit.Text = "確認";
            TextBoxTitle.Text = null;
            TextBoxDate.Text = null;
            CKEditorContent.Text = null;
            GridViewImages.DataSource = null;
            GridViewImages.DataBind();
            GridViewFiles.DataSource = null;
            GridViewFiles.DataBind();
            HiddenFieldNewsId.Value = null;
            HiddenCoverID.Value = null;
            HiddenFieldHasFile.Value = null;
            HiddenFieldHasImage.Value = null;
            PanelEdit.Visible = false;
        }

        //呼叫新聞的編輯(會呼叫Panel)
        protected void GridViewNews_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //取得編輯行的NewsId
            int rowIndex = e.NewEditIndex;
            string newId = GridViewNews.DataKeys[rowIndex].Value.ToString();

            //取得該筆News的資料
            sqlSentence = "Select * From News Where Id=@Id";
            dict.Clear();
            dict["@Id"] = newId;
            DataTable dt = new DataTable();
            dt.Load(db.SearchDB(sqlSentence, dict));
            db.CloseDB();

            string Title = dt.Rows[0]["Title"].ToString();
            DateTime NewsDate = (DateTime)dt.Rows[0]["NewsDate"];
            string Content = dt.Rows[0]["Content"].ToString();
            string CoverId = dt.Rows[0]["CoverId"].ToString();
            bool HasImage = (bool)dt.Rows[0]["HasImage"];
            bool HasFile = (bool)dt.Rows[0]["HasFile"];


            //開啟Panel視窗，並將資料填入
            PanelEdit.Visible = true;
            LblPanelTitle.Text = "Edit a News";
            ButtonSubmit.Text = "確認修改";
            HiddenFieldNewsId.Value = newId;
            HiddenCoverID.Value = CoverId;
            HiddenFieldHasFile.Value = HasFile.ToString();
            HiddenFieldHasImage.Value = HasImage.ToString();


            TextBoxTitle.Text = Title;
            TextBoxDate.Text = NewsDate.ToString("yyyy-MM-dd");
            CKEditorContent.Text = Content;

            if (HasImage)
            {
                ShowGvImg();
            }

            if (HasFile)
            {
                ShowGvFile();
            }
        }

        //新聞的刪除
        protected void GridViewNews_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string newsId = GridViewNews.DataKeys[rowIndex].Value.ToString();
            sqlSentence = "Update News Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict.Add("@Id", newsId);
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            //刪除後要重新顯示GridView
            ShowGvNews();
        }

        //New資料繫結時，綁定置頂的文章們的CheckBox
        protected void GridViewNews_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //處理每列時要先判斷處理的列是不是資料列(如果是標題列或其他列會出錯)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //int rowIndex = e.Row.RowIndex;
                //string Id = GridViewImages.DataKeys[rowIndex].Value.ToString();
                //RadioButton radioBtn = (RadioButton)e.Row.FindControl("");
                CheckBox checkBox = (CheckBox)e.Row.FindControl("CheckBoxTop");
                checkBox.Checked = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "IsTop"));
                checkBox.AutoPostBack = true;
            }
        }

        //CheckBox被更改時，切換"是否置頂"
        protected void CheckBoxTop_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkBox1 = (CheckBox)sender;
            int rowIndex = ((GridViewRow)checkBox1.NamingContainer).RowIndex;
            int Id = Convert.ToInt32(GridViewNews.DataKeys[rowIndex].Value);
            if (checkBox1.Checked)
            {
                string sqlSentence = $"Update News Set IsTop=1 Where Id = {Id}";
                if (db.NonQueryDB(sqlSentence) == 1)
                {
                    Response.Write("<script>alert('新增置頂成功')</script>");

                }
                db.CloseDB();
            }
            else
            {
                string sqlSentence = $"Update News Set IsTop=0 Where Id = {Id}";
                if (db.NonQueryDB(sqlSentence) == 1)
                {
                    Response.Write("<script>alert('取消置頂成功')</script>");
                }
                db.CloseDB();
            }
            ShowGvNews();

        }

        //編輯News圖片時，資料繫結後給予目前封面的RadioBtn選擇
        protected void GridViewImages_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //處理每列列時要先判斷處理的列是不是資料列(如果是標題列或其他列會出錯)
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.RowIndex;
                string imageId = GridViewImages.DataKeys[rowIndex].Value.ToString();
                RadioButton radioBtn = (RadioButton)e.Row.FindControl("RadioButtonCover");
                radioBtn.AutoPostBack = true;
                radioBtn.GroupName = "IsCover";
                if (imageId == HiddenCoverID.Value)
                {
                    radioBtn.Checked = true;
                }
            }
        }

        //更換封面的操作(點選RadioBtn)
        protected void RadioButtonCover_CheckedChanged(object sender, EventArgs e)
        {
            RadioButton radioBtn = (RadioButton)sender;
            GridViewRow Row = (GridViewRow)radioBtn.NamingContainer;
            String ImageId = GridViewImages.DataKeys[Row.RowIndex].Value.ToString();
            HiddenCoverID.Value = ImageId;
            String NewsId = HiddenFieldNewsId.Value;
            sqlSentence = "Update News Set CoverId=@ImageId Where Id=@NewsId";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            dict["@ImageId"] = ImageId;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write("<script>alert('修改封面成功!')</script>");
            }
            db.CloseDB();

            ShowGvImg();
            //跳轉回編輯的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#NewsImageDiv'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);

        }

        //News圖片的刪除
        protected void GridViewImages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string ImageId = GridViewImages.DataKeys[rowIndex].Value.ToString();

            if (ImageId == HiddenCoverID.Value)
            {
                //刪除的是封面照片，一樣先刪除照片
                sqlSentence = "Update NewsImage Set IsDelete=1 Where Id=@Id;";
                dict.Clear();
                dict.Add("@Id", ImageId);
                db.NonQueryDB(sqlSentence, dict);
                db.CloseDB();
                //照片刪除完成，重新編輯封面
                //先找到該新聞的相片Id最小(當初上傳時先選擇的)的照片Id
                sqlSentence = "Select Top 1 Id From NewsImage Where NewsId=@NewsId And IsDelete=0 Order by Id Asc";
                dict.Clear();
                dict.Add("@NewsId", HiddenFieldNewsId.Value);
                DataTable dt= new DataTable();
                dt.Load(db.SearchDB(sqlSentence, dict));
                db.CloseDB();
                if(dt.Rows.Count>0)
                {
                    //有找到照片，更新封面為這張
                    sqlSentence = "Update News Set CoverId=@CoverId Where Id=@NewsId";
                    dict.Clear();
                    dict.Add("@NewsId", HiddenFieldNewsId.Value);
                    dict.Add("@CoverId", dt.Rows[0]["Id"].ToString());
                    HiddenCoverID.Value = dt.Rows[0]["Id"].ToString();
                }
                else
                {
                    //沒找到照片，代表此新聞已無圖片了，更新時也將HasImage改為0
                    sqlSentence = "Update News Set CoverId=@CoverId,HasImage=0 Where Id=@NewsId";
                    dict.Clear();
                    dict.Add("@NewsId", HiddenFieldNewsId.Value);
                    dict.Add("@CoverId", 18);
                }

                //設定好編輯News的CoverId(+HasImage)的句子以及係數後，執行編輯
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('刪除成功')</script>");
                }
                db.CloseDB();
            }
            else
            {
                sqlSentence = "Update NewsImage Set IsDelete=1 Where Id=@Id;";
                dict.Clear();
                dict.Add("@Id", ImageId);
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('刪除成功')</script>");
                }
                db.CloseDB();
            }

            //刪除後要重新顯示GridView
            ShowGvImg();
            //跳轉回編輯的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#NewsImageDiv'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);

        }

        //News檔案的刪除
        protected void GridViewFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //執行前先看一下現在這篇新聞有幾個檔案，
            //如果剩一個的話，代表是最後一個檔案
            //刪除後要將HasFile改成0

            //先檢查目前還剩幾個檔案
            sqlSentence = "Select count(*) as 'count' From NewsFIle Where IsDelete=0 And NewsId=@NewsId";
            dict.Clear();
            dict.Add("@NewsId", HiddenFieldNewsId.Value);
            int countFile=(int)db.SearchDBscalar(sqlSentence, dict);
            //取得剩餘檔案個數
            db.CloseDB();

            if(countFile==1)
            {
                sqlSentence = "Update News Set HasFile=0 Where Id=@NewsId";
                dict.Clear();
                dict.Add("@NewsId", HiddenFieldNewsId.Value);
                db.NonQueryDB(sqlSentence, dict);
                //更新HasFile=0
                db.CloseDB();
            }

            //刪除檔案步驟
            int rowIndex = e.RowIndex;
            string FileId = GridViewFiles.DataKeys[rowIndex].Value.ToString();
            sqlSentence = "Update NewsFile Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict.Add("@Id", FileId);
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
            //刪除後要重新顯示GridView
            ShowGvFile();
            //跳轉回編輯的y軸
            string script = "<script type=\"text/javascript\">window.onload = function() { location.hash = '#NewsImageDiv'; };</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "JumpToDiv", script);
        }


    }
}