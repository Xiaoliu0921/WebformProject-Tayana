using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana
{
    public partial class BackMaster : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            //清除Cache，避免登出後按上一頁還會顯示Cache頁面
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                //導回登入頁
                Response.Write($"<script>alert('未登入不可操作後台！');window.location='Login.aspx';</script>");
            }
            else
            {
                //取得驗證票夾帶資訊
                string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
                string[] ticketUserDataArr = ticketUserData.Split(';');
                bool haveRight = HttpContext.Current.User.Identity.IsAuthenticated;
                //依管理權限導頁
                if (haveRight)
                {
                    if (ticketUserDataArr[0].Equals("True"))
                    {
                        ImageUserProfile.ImageUrl = "../BackMasterMaterial/assets/images/user/avatar-Admin.jpg";
                        PlaceHolderAdminSideBar.Visible = true;
                    }
                    else
                    {
                        ImageUserProfile.ImageUrl = "../BackMasterMaterial/assets/images/user/avatar-2.jpg";
                        PlaceHolderAdminSideBar.Visible = false;
                    }
                    LiteralUserAccount.Text= ticketUserDataArr[1];
                    LiteralUserName.Text = ticketUserDataArr[2];
                    LiteralUserEmail.Text = ticketUserDataArr[3];
                }
                else
                {
                    //導回登入頁
                    Response.Write($"<script>alert('未登入不可操作後台！');window.location='Login.aspx';</script>");
                }
            }


        }
    }
}