using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using Konscious.Security.Cryptography;
using Microsoft.Ajax.Utilities;
using System.Web.Security;

namespace tayana.BackStage
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                    string[] ticketUserDataArr = ticketUserData.Split(';');
                    HiddenFieldLoginId.Value = ticketUserDataArr[4];

                    if (ticketUserDataArr[0] == "True")
                    {
                        BtnCallPanelAddUser.Visible = true;
                    }
                    else
                    {
                        BtnCallPanelAddUser.Visible = false;

                    }
                }
                

            }
            ShowGvAccount();

        }

        protected void ShowGvAccount()
        {
            sqlSentence = "SELECT ROW_NUMBER() Over (Order By Id) as 'Row',Id,Account,[Name],Email,MaxPower FROM [Account] Where IsDelete=0";
            GridViewAccount.DataSource = db.SearchDB(sqlSentence);
            GridViewAccount.DataBind();
            db.CloseDB();
        }




        protected void GridViewAccount_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string Id = GridViewAccount.DataKeys[rowIndex].Value.ToString();

            sqlSentence = "Update Account Set IsDelete=1 Where Id=@Id;";
            dict.Clear();
            dict["@Id"] = Id;
            if (db.NonQueryDB(sqlSentence, dict) == 1)
            {
                Response.Write($"<script>alert('刪除成功')</script>");
            }
            db.CloseDB();
        }

        protected void GridViewAccount_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewAccount.EditIndex = -1;
            int rowIndex = e.NewEditIndex;
            string Id = GridViewAccount.DataKeys[rowIndex].Value.ToString();

            PanelEditAccount.Visible = true;
            TextBoxAccount.Enabled = false;
            TextBoxPassword.Text = null;
            TextBoxPasswordCheck.Text = null;
            LblPanelTitle.Text = "Edit An Account";
            ButtonSubmit.Text = "確認編輯";

            sqlSentence = "Select * From Account Where Id=@Id";
            dict.Clear();
            dict["@Id"] = Id;
            HiddenFieldAccountId.Value = Id;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);
            rd.Read();
            TextBoxAccount.Text = rd.GetString(rd.GetOrdinal("Account"));
            TextBoxName.Text = rd.GetString(rd.GetOrdinal("Name"));
            TextBoxEmail.Text = rd.GetString(rd.GetOrdinal("Email"));
            db.CloseDB();

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            HiddenFieldAccountId.Value = null;
            TextBoxAccount.Text = null;
            TextBoxEmail.Text = null;
            TextBoxName.Text = null;
            TextBoxPassword.Text = null;
            TextBoxPasswordCheck.Text = null;
            LblPanelTitle.Text = "Account";
            ButtonSubmit.Text = "確認";
            PanelEditAccount.Visible = false;
            ShowGvAccount();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (LblPanelTitle.Text == "Add an Account" && ButtonSubmit.Text == "確認新增")
            {
                if (TextBoxAccount.Text.IsNullOrWhiteSpace())
                {
                    Response.Write($"<script>alert('帳號不可以為空')</script>");
                }
                else if (TextBoxPassword.Text.IsNullOrWhiteSpace() ||
                        TextBoxPasswordCheck.Text.IsNullOrWhiteSpace())
                {
                    Response.Write($"<script>alert('密碼不可以為空')</script>");
                }
                else if (TextBoxPassword.Text != TextBoxPasswordCheck.Text)
                {
                    Response.Write($"<script>alert('輸入的密碼與確認密碼不相符！！')</script>");
                }
                else
                {
                    //先檢查帳號是否有重複
                    bool haveSameAccount = false;

                    sqlSentence = "Select * From Account Where Account=@Account";
                    dict.Clear();
                    dict["@Account"] = TextBoxAccount.Text;
                    SqlDataReader rd = db.SearchDB(sqlSentence, dict);
                    if (rd.Read())
                    {
                        haveSameAccount = true; //可以讀下一筆資料=有重複帳號
                        Response.Write($"<script>alert('此帳號已有人申請')</script>");
                    }
                    db.CloseDB();

                    if (!haveSameAccount)
                    {
                        //Hash 加鹽加密
                        string password = TextBoxPassword.Text;
                        var salt = CreateSalt();
                        string saltStr = Convert.ToBase64String(salt); //將 byte 改回字串存回資料表
                        var hash = HashPassword(password, salt);
                        string hashPassword = Convert.ToBase64String(hash);

                        sqlSentence = "Insert Into Account (Account,[Password],Salt,Email,[Name]) Values (@Account,@Password,@Salt,@Email,@Name);";
                        dict.Clear();
                        dict["@Account"] = TextBoxAccount.Text;
                        dict["@Password"] = hashPassword;
                        dict["@Salt"] = saltStr;
                        dict["@Email"] = TextBoxEmail.Text;
                        dict["@Name"] = TextBoxName.Text;

                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            Response.Write($"<script>alert('新增成功')</script>");
                        }
                        db.CloseDB();

                        HiddenFieldAccountId.Value = null;
                        TextBoxAccount.Text = null;
                        TextBoxEmail.Text = null;
                        TextBoxName.Text = null;
                        TextBoxPassword.Text = null;
                        TextBoxPasswordCheck.Text = null;
                        LblPanelTitle.Text = "Account";
                        ButtonSubmit.Text = "確認";
                        PanelEditAccount.Visible = false;
                        ShowGvAccount();

                    }
                }

            }
            else if (LblPanelTitle.Text == "Edit An Account" && ButtonSubmit.Text == "確認編輯")
            {
                if (!TextBoxPassword.Text.IsNullOrWhiteSpace() || !TextBoxPassword.Text.IsNullOrWhiteSpace())
                {
                    if (TextBoxPassword.Text != TextBoxPasswordCheck.Text)
                    {
                        Response.Write($"<script>alert('輸入的密碼與確認密碼不相符！！')</script>");
                    }
                    else
                    {
                        //Hash 加鹽加密
                        string password = TextBoxPassword.Text;
                        var salt = CreateSalt();
                        string saltStr = Convert.ToBase64String(salt); //將 byte 改回字串存回資料表
                        var hash = HashPassword(password, salt);
                        string hashPassword = Convert.ToBase64String(hash);

                        sqlSentence = "Update Account Set [Password]=@Password,Salt=@Salt,Email=@Email,[Name]=@Name Where Id=@Id;";
                        dict.Clear();
                        dict["@Id"] = HiddenFieldAccountId.Value;
                        dict["@Password"] = hashPassword;
                        dict["@Salt"] = saltStr;
                        dict["@Email"] = TextBoxEmail.Text;
                        dict["@Name"] = TextBoxName.Text;

                        if (db.NonQueryDB(sqlSentence, dict) == 1)
                        {
                            Response.Write($"<script>alert('編輯成功')</script>");
                            HiddenFieldAccountId.Value = null;
                            TextBoxAccount.Text = null;
                            TextBoxEmail.Text = null;
                            TextBoxName.Text = null;
                            TextBoxPassword.Text = null;
                            TextBoxPasswordCheck.Text = null;
                            LblPanelTitle.Text = "Account";
                            ButtonSubmit.Text = "確認";
                            PanelEditAccount.Visible = false;
                            ShowGvAccount();
                        }
                        db.CloseDB();
                    }
                }
                else
                {
                    sqlSentence = "Update Account Set Email=@Email,[Name]=@Name Where Id=@Id;";
                    dict.Clear();
                    dict["@Id"] = HiddenFieldAccountId.Value;
                    dict["@Email"] = TextBoxEmail.Text;
                    dict["@Name"] = TextBoxName.Text;

                    if (db.NonQueryDB(sqlSentence, dict) == 1)
                    {
                        Response.Write($"<script>alert('編輯成功')</script>");
                        HiddenFieldAccountId.Value = null;
                        TextBoxAccount.Text = null;
                        TextBoxEmail.Text = null;
                        TextBoxName.Text = null;
                        TextBoxPassword.Text = null;
                        TextBoxPasswordCheck.Text = null;
                        LblPanelTitle.Text = "Account";
                        ButtonSubmit.Text = "確認";
                        PanelEditAccount.Visible = false;
                        ShowGvAccount();
                    }
                    db.CloseDB();
                }
                //ShowGvAccount();
            }
        }

        protected void BtnCallPanelAddUser_Click(object sender, EventArgs e)
        {
            PanelEditAccount.Visible = true;
            HiddenFieldAccountId.Value = null;
            TextBoxAccount.Text = null;
            TextBoxAccount.Enabled = true;
            TextBoxPassword.Text = null;
            TextBoxPassword.Enabled = true;
            TextBoxPasswordCheck.Text = null;
            TextBoxPasswordCheck.Visible = true;
            TextBoxEmail.Text = null;
            TextBoxName.Text = null;
            TextBoxPassword.Text = null;
            LblPanelTitle.Text = "Add an Account";
            ButtonSubmit.Text = "確認新增";
        }


        // Argon2 加密
        //產生 Salt 功能
        private byte[] CreateSalt()
        {
            var buffer = new byte[16];
            var rng = new RNGCryptoServiceProvider();
            rng.GetBytes(buffer);
            return buffer;
        }
        // Hash 處理加鹽的密碼功能
        private byte[] HashPassword(string password, byte[] salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));

            //底下這些數字會影響運算時間，而且驗證時要用一樣的值
            argon2.Salt = salt;
            argon2.DegreeOfParallelism = 8; // 4 核心就設成 8
            argon2.Iterations = 4; // 迭代運算次數
            argon2.MemorySize = 1024 * 1024; // 1 GB

            return argon2.GetBytes(16);
        }

        protected void GridViewAccount_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string loginId = HiddenFieldLoginId.Value;


                if (loginId == "1")
                {
                    if (e.Row.RowIndex == 0)
                    {
                        e.Row.Cells[7].Controls.Clear();
                    }
                }
                else
                {
                    if (GridViewAccount.DataKeys[e.Row.RowIndex].Value.ToString()  == loginId)
                    {
                        e.Row.Cells[7].Controls.Clear();
                    }
                    else
                    {

                        e.Row.Cells[3].Controls.Clear();
                        e.Row.Cells[6].Controls.Clear();
                        e.Row.Cells[7].Controls.Clear();
                    }
                }
            }
        }
    }
}