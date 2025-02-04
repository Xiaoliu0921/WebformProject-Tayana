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

namespace tayana.BackStage
{
    public partial class ManageCompany : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        string sqlSentence = "";
        Dictionary<string, object> dict = new Dictionary<string, object>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowAbout();
            }

        }

        public void ShowAbout()
        {
            sqlSentence = "Select Top 1 * From CompanyAbout Order By Id DESC";
            DataTable dt = new DataTable();
            dt.Load(db.SearchDB(sqlSentence));
            db.CloseDB();
            if (dt.Rows.Count > 0)
            {
                TextBoxAboutTitle.Text = dt.Rows[0]["Title"].ToString();
                CKEditorControlAboutUs.Text = dt.Rows[0]["Content"].ToString();
                ImageAbout.ImageUrl = dt.Rows[0]["ImagePath"].ToString();
            }
        }

        public void ShowCertificate()
        {
            sqlSentence = "Select Top 1 [Content] From CompanyCertificate Order by Id DESC";
            string certificateContent;
            SqlDataReader rd = db.SearchDB(sqlSentence);
            if (rd.Read())
            {
                certificateContent = rd.GetString(rd.GetOrdinal("Content"));
                CKEditorControlCertificate.Text = certificateContent;
            }
            db.CloseDB();
        }

        public void ShowGvImages()
        {
            sqlSentence = "Select * From CompanyImages Where IsDelete=0";
            GridViewCertificateImage.DataSource = db.SearchDB(sqlSentence);
            GridViewCertificateImage.DataBind();
            db.CloseDB();

        }

        protected void BtnCallPanelAboutUs_Click(object sender, EventArgs e)
        {
            PanelAboutUs.Visible = true;
            PanelCertificate.Visible = false;
            ShowAbout();
        }

        protected void BtnCallPanelCertificate_Click(object sender, EventArgs e)
        {
            PanelAboutUs.Visible = false;
            PanelCertificate.Visible = true;
            ShowCertificate();
            ShowGvImages();
        }

        protected void ButtonEditAbout_Click(object sender, EventArgs e)
        {
            string content = CKEditorControlAboutUs.Text;
            string title = TextBoxAboutTitle.Text;
            if (FileUploadAboutUs.HasFile)
            {
                string FileExtension = Path.GetExtension(FileUploadAboutUs.PostedFile.FileName).ToLower();
                if (FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg")
                {
                    string ImageFolderPath = Server.MapPath($"~/BackStage/CompanyImages");
                    if (!Directory.Exists(ImageFolderPath))
                    {
                        Directory.CreateDirectory(ImageFolderPath);
                    }
                    string FileName = Path.GetFileName(FileUploadAboutUs.PostedFile.FileName); // 取得 單一檔案 名稱變數
                    string FilePath = Path.Combine(ImageFolderPath, FileName);  // 取得 單一檔案 儲存路徑

                    sqlSentence = "Insert Into CompanyAbout([Title],[Content],[ImagePath]) Values (@Title,@Content,@ImagePath)";
                    dict.Clear();
                    dict["@Title"] = title;
                    dict["@Content"] = content;
                    dict["@ImagePath"] = "/BackStage/CompanyImages/" + FileName;
                    if (db.NonQueryDB(sqlSentence, dict) == 1)
                    {
                        Response.Write($"<script>alert('編輯成功')</script>");
                        //檔案存入路徑中
                        FileUploadAboutUs.PostedFile.SaveAs(FilePath);
                        //新增成功後將輸入的文字還有上傳的檔案都清掉
                        FileUploadAboutUs.Attributes.Clear();
                    }
                    db.CloseDB();
                    ShowAbout();
                }
                else
                {
                    Response.Write($"<script>alert('上傳檔案非jpg、png、jpeg格式，請重新選擇')</script>");
                }
            }
            else
            {
                //沒上傳檔案的處理(圖片路徑沿用)
                sqlSentence = "Insert Into CompanyAbout([Title],[Content],[ImagePath]) Values (@Title,@Content,@ImagePath)";
                dict.Clear();
                dict["@Title"] = title;
                dict["@Content"] = content;
                dict["@ImagePath"] = ImageAbout.ImageUrl;
                if (db.NonQueryDB(sqlSentence, dict) == 1)
                {
                    Response.Write($"<script>alert('編輯成功')</script>");
                }
                db.CloseDB();
                ShowAbout();
            }
        }


        protected void ButtonEditCertificate_Click(object sender, EventArgs e)
        {
            string content = CKEditorControlCertificate.Text;
            sqlSentence = "Insert Into CompanyCertificate([Content]) Values (@Content)";
            dict.Clear();
            dict["@Content"] = content;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('編輯成功')</script>");
            }
            db.CloseDB();
            ShowCertificate();
        }

        protected void ButtonAddImage_Click(object sender, EventArgs e)
        {
            if (FileUploadCertificate.HasFiles)
            {
                //先判斷檔案們有沒有非圖片檔
                bool IsImage = true;
                foreach (var postedFile in FileUploadCertificate.PostedFiles)
                {
                    string FileExtension = Path.GetExtension(postedFile.FileName).ToLower();
                    if (!(FileExtension == ".jpg" || FileExtension == ".png" || FileExtension == ".jpeg"))
                    {
                        Response.Write("<script>alert('上傳中檔案有非圖片檔')</script>");
                        IsImage = false;
                        break;
                    }
                }
                if (IsImage)
                {
                    string ImageFolderPath = Server.MapPath($"~/BackStage/CompanyImages");
                    if (!Directory.Exists(ImageFolderPath))
                    {
                        Directory.CreateDirectory(ImageFolderPath);
                    }


                    int count = 0;
                    foreach (HttpPostedFile postedFile in FileUploadCertificate.PostedFiles)
                    {
                        string FileName = Path.GetFileName(postedFile.FileName); // 取得 單一檔案 名稱變數
                        string FilePath = Path.Combine(ImageFolderPath, FileName);  // 取得 單一檔案 儲存路徑
                        string sqlSentence = $"Insert Into CompanyImages(ImageName,ImagePath) Values (@ImageName,@ImagePath);";
                        dict.Clear();
                        dict["@ImageName"] = FileName;
                        dict["@ImagePath"] = "/BackStage/CompanyImages/" + FileName;
                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            count++;
                        }
                        db.CloseDB();
                        postedFile.SaveAs(FilePath);
                    }
                    Response.Write($"<script>alert('已成功新增{count}張照片')</script>");
                    ShowGvImages();
                }
            }
            else
            {

                Response.Write("<script>alert('未選擇檔案。')</script>");

            }
        }

        protected void GridViewCertificateImage_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string imageId=GridViewCertificateImage.DataKeys[rowIndex].Value.ToString();
            sqlSentence = $"Update CompanyImages Set IsDelete=1 Where Id=@imageId";
            dict.Clear();
            dict["@imageId"]= imageId;
            if (db.NonQueryDB(sqlSentence,dict) == 1)
            {
                Response.Write("<script>alert('刪除成功!')</script>");
            }
            db.CloseDB();
            ShowGvImages();

        }
    }
}