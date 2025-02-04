using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class NewsContent : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        string sqlSentence = "";
        Dictionary<string, object> dict = new Dictionary<string, object>();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["NewsId"] == null || !(int.TryParse(Request.QueryString["NewsId"], out int NewsId)))
                {
                    Response.Write($"<script>alert('此新聞不存在！');window.location='News.aspx';</script>");
                }
                else
                {
                    ShowContent(NewsId);
                }
            }
        }

        public void ShowContent(int NewsId)
        {
            sqlSentence = "Select * From News Where Id=@NewsId And IsDelete=0";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);
            DataTable dt = new DataTable();
            dt.Load(rd);
            db.CloseDB();
            RepeaterContent.DataSource = dt;
            RepeaterContent.DataBind();
            if (dt.Rows.Count > 0)
            {
                bool HasImage = (bool)dt.Rows[0]["HasImage"];
                if (HasImage) { ShowImage(NewsId); }
                bool HasFile = (bool)dt.Rows[0]["HasFile"];
                if (HasFile) { ShowFile(NewsId); }

            }
            else
            {
                Response.Write($"<script>alert('此新聞不存在！');window.location='News.aspx';</script>");
            }

        }

        public void ShowImage(int NewsId)
        {
            sqlSentence = "Select * From NewsImage Where NewsId=@NewsId And IsDelete=0";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);
            DataTable dt = new DataTable();
            dt.Load(rd);
            db.CloseDB();
            if (dt.Rows.Count > 0)
            {
                RepeaterImage.DataSource = dt;
                RepeaterImage.DataBind();
            }
        }

        public void ShowFile(int NewsId)
        {
            sqlSentence = "Select * From NewsFile Where NewsId=@NewsId And IsDelete=0";
            dict.Clear();
            dict["@NewsId"] = NewsId;
            SqlDataReader rd = db.SearchDB(sqlSentence, dict);
            DataTable dt = new DataTable();
            dt.Load(rd);
            db.CloseDB();
            if (dt.Rows.Count > 0)
            {
                RepeaterFile.DataSource = dt;
                RepeaterFile.DataBind();
            }
        }


    }
}