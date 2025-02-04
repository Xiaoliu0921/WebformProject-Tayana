using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace tayana.BackStage
{
    /// <summary>
    /// CheckAccount 的摘要描述
    /// </summary>
    public class CheckAccount : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            // ashx 裡的 Request/Response 都要加上 context
            string ticketUserData = ((FormsIdentity)(HttpContext.Current.User.Identity)).Ticket.UserData;
            string[] ticketUserDataArr = ticketUserData.Split(';');
            bool haveRight = HttpContext.Current.User.Identity.IsAuthenticated;

            if(haveRight)
            {
                context.Response.Redirect("ManageAccount.aspx");
            }
            else
            {
                context.Response.Redirect("Login.aspx"); //導回登入頁
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}