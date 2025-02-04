using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class Yacht_Layout : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        string sqlSentence = "";
        Dictionary<string, object> dict = new Dictionary<string, object>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowRp();
            }
        }

        public string GetYachtId()
        {
            if (Request.QueryString["YachtId"] == null)
            {
                sqlSentence = "Select Top 1 Id From Yacht Where IsDelete=0 Order by Id DESC";
                string NewestYachtId = db.SearchDBscalar(sqlSentence).ToString();
                db.CloseDB();
                return NewestYachtId;
            }
            else
            {
                string getId = Request.QueryString["YachtId"];
                sqlSentence = "Select Top 1 Id From Yacht Where IsDelete=0 And Id= @YachtId Order by Id DESC";
                dict.Clear();
                dict["@YachtId"] = getId;
                var test = db.SearchDBscalar(sqlSentence, dict);
                db.CloseDB();

                string YachtId;
                if (test != null)
                {
                    YachtId = test.ToString();
                }
                else
                {
                    Response.Write($"<script>alert('This Yacht Doesn\\'t Exist！！');window.location='Yacht.aspx';</script>");
                    sqlSentence = "Select Top 1 Id From Yacht Where IsDelete=0 Order by Id DESC";
                    YachtId = db.SearchDBscalar(sqlSentence).ToString();
                    db.CloseDB();
                }
                return YachtId;
            }
        }

        public void ShowRp()
        {
            string YachtId = GetYachtId();
            sqlSentence = "Select * From YachtLayout Where IsDelete=0 And YachtId=@YachtId;";
            dict.Clear();
            dict["@YachtId"]= YachtId;
            RepeaterLayout.DataSource=db.SearchDB(sqlSentence, dict);
            RepeaterLayout.DataBind();
            db.CloseDB();
        }

    }
}