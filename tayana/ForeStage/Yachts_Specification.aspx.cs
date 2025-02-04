using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class Yachts_Specification : System.Web.UI.Page
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
            sqlSentence = "Select YS.[Name],String_AGG('<li>'+YSI.Item,'</li> ') as 'Item' From YachtSpecification as YS Join YachtSpecificationItem as YSI On YSI.YachtSpecificationId=YS.Id  Where Ys.IsDelete=0 And YSI.IsDelete=0 And YS.YachtId=@YachtId Group by YS.[Name];";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            RepeaterSpecification.DataSource = db.SearchDB(sqlSentence, dict);
            RepeaterSpecification.DataBind();
            db.CloseDB();
        }

    }
}