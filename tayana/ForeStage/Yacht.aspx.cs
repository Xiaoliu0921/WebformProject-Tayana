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
    public partial class Yacht : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        string sqlSentence = "";
        Dictionary<string, object> dict = new Dictionary<string, object>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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

            //Part1 文章+Dimension標題+Dimension圖片
            sqlSentence = "Select OverView,ModelLength,DimensionsImagePath From Yacht Where IsDelete=0 And Id=@YachtId;";
            dict.Clear();
            dict["@YachtId"]= YachtId;
            SqlDataReader rd=db.SearchDB(sqlSentence,dict);
            DataTable dt=new DataTable();
            dt.Load(rd);
            db.CloseDB();
            RepeaterOverviewAndDimensionTitle.DataSource = dt;
            RepeaterOverviewAndDimensionTitle.DataBind();
            string ImagePath = dt.Rows[0]["DimensionsImagePath"].ToString();
            LiteralDimensionImage.Text = $"<img src=\"{ImagePath}\" alt=\"&quot;&quot;\" width=\"278\" height=\"345\" />";


            //Part2 Dimension內容
            sqlSentence = "Select * From YachtDimension Where IsDelete=0 And YachtId=@YachtId;";
            RepeaterDimension.DataSource =db.SearchDB(sqlSentence,dict);
            RepeaterDimension.DataBind();
            db.CloseDB();

            //Part 3 下載內容
            sqlSentence = "Select * From YachtFile Where IsDelete=0 And YachtId=@YachtId;";
            SqlDataReader rd2 = db.SearchDB(sqlSentence, dict);
            if(rd2.HasRows)
            {
                RepeaterDownload.DataSource = rd2;
                RepeaterDownload.DataBind();
            }
            db.CloseDB();

        }

    }
}