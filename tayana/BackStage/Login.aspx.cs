using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.DynamicData;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Konscious.Security.Cryptography;

namespace tayana.BackStage
{
    public partial class Login : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("CheckAccount.ashx"); 
            }
        }


        // Argon2 驗證加密密碼
        // Hash 處理加鹽的密碼功能
        private byte[] HashPassword(string password, byte[] salt)
        {
            var argon2 = new Argon2id(Encoding.UTF8.GetBytes(password));

            //底下這些數字會影響運算時間，而且驗證時要用一樣的值
            argon2.Salt = salt;
            argon2.DegreeOfParallelism = 8; // 4 核心就設成 8
            argon2.Iterations = 4; //迭代運算次數
            argon2.MemorySize = 1024 * 1024; // 1 GB

            return argon2.GetBytes(16);
        }


        //驗證
        private bool VerifyHash(string password, byte[] salt, byte[] hash)
        {
            var newHash = HashPassword(password, salt);
            return hash.SequenceEqual(newHash); // LINEQ
        }


        //設定驗證票
        private void SetAuthenTicket(string userData, string userId)
        {
            //宣告一個驗證票 //需額外引入 using System.Web.Security;
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            1,                    //票證的版本號碼, 用於未來可能的版本控制
            userId,                   //與票證相關的使用者名稱, 會被用來辨識是哪一個使用者的票證
            DateTime.Now,             //核發此票證時的本機日期和時間, 票證的開始時間      
            DateTime.Now.AddHours(3), //票證到期的本機日期和時間, 票證何時失效
            false,                    //是否將票證持續存放於Cookie中
                                      //如果設為 true，即使使用者關閉瀏覽器，票證也會保存在Cookie中直到到期時間。如果設為 false，票證會在瀏覽器關閉時失效。
            userData                  //要與票證一起存放的使用者特定資料
            );
            //加密驗證票
            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            //建立 Cookie
            HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            //將 Cookie 寫入回應
            Response.Cookies.Add(authenticationCookie);
        }

        //取消登入的按鈕，就回到首頁
        protected void btnIndex_Click(object sender, EventArgs e)
        {
            Response.Redirect("../ForeStage/Index.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string password = TextBoxPassword.Text;

            //從資料庫中取得該帳號的密碼(加密後)
            sqlSentence = "Select * From Account Where Account=@Account And IsDelete=0";
            dict.Clear();
            dict["@Account"] = TextBoxUsername.Text;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);

            if (rd.Read())
            {
                //將字串轉回 byte
                byte[] hash = Convert.FromBase64String(rd.GetString(rd.GetOrdinal("Password")));
                byte[] salt = Convert.FromBase64String(rd.GetString(rd.GetOrdinal("Salt")));

                //驗證密碼
                bool success = VerifyHash(password, salt, hash);
                if (success)
                {

                    //宣告驗證票要夾帶的資料 (用;區隔)
                    string userData = rd.GetBoolean(rd.GetOrdinal("MaxPower")).ToString() + ";"
                        + rd.GetString(rd.GetOrdinal("Account")) + ";"
                        + rd.GetString(rd.GetOrdinal("Name")) + ";"
                        + rd.GetString(rd.GetOrdinal("Email")) + ";"
                        + rd.GetInt32(rd.GetOrdinal("Id")).ToString()
                        ;
                    db.CloseDB();
                    //設定驗證票(夾帶資料，cookie 命名) // 需額外引入using System.Web.Configuration;
                    SetAuthenTicket(userData, TextBoxUsername.Text);
                    //導頁至權限分流頁
                    Response.Write($"<script>alert('登入成功！！');window.location='CheckAccount.ashx';</script>");
                }
                else
                {
                    //資料庫裡找不到相同資料時，表示帳號有誤!
                    db.CloseDB();
                    Response.Write($"<script>alert('帳號密碼輸入錯誤，登入失敗！')</script>");
                }
            }
            else
            {
                db.CloseDB();
                Response.Write($"<script>alert('帳號密碼輸入錯誤，登入失敗！')</script>");
            }

        }

    }
}