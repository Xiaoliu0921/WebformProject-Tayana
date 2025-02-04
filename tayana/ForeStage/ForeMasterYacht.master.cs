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
    public partial class ForeMasterYacht : System.Web.UI.MasterPage
    {
        DbHelper db=new DbHelper();
        string sqlSentence = "";
        Dictionary<string,object> dict=new Dictionary<string,object>();

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowRpGallery();
            ShowRpLeftBarAndTitles();
        }

        public void ShowRpGallery()
        {
            string YachtId=GetYachtId();
            sqlSentence = "Select * From YachtAlbum Where IsDelete=0 And YachtId=@YachtId";
            dict.Clear();
            dict["@YachtId"] =YachtId;
            RepeaterGallery.DataSource = db.SearchDB(sqlSentence, dict);
            RepeaterGallery.DataBind();
            db.CloseDB();
        }

        public string GetYachtId()
        {
            if (Request.QueryString["YachtId"] ==null)
            {
                sqlSentence = "Select Top 1 Id From Yacht Where IsDelete=0 Order by Id DESC";
                string NewestYachtId=db.SearchDBscalar(sqlSentence).ToString();
                db.CloseDB();
                return NewestYachtId;
            }
            else
            {
                string getId = Request.QueryString["YachtId"];
                sqlSentence = "Select Top 1 Id From Yacht Where IsDelete=0 And Id= @YachtId Order by Id DESC";
                dict.Clear();
                dict["@YachtId"]=getId;
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

        public void ShowRpLeftBarAndTitles()
        {
            sqlSentence = "Select Id,Model+'  '+ModelLength+IIF(IsNewDesign=1,'  (New Design)','')+IIF(IsNewBuilding=1,'  (New Building)','') as'YachtName',Model+'  '+ModelLength as 'YachtTitle' From Yacht Where IsDelete=0 Order by Id Desc;";
            SqlDataReader rd=db.SearchDB(sqlSentence);
            RepeaterLeftBar.DataSource = rd;
            RepeaterLeftBar.DataBind();
            db.CloseDB();

            string YachtId = GetYachtId();
            sqlSentence = "Select Model+'  '+ModelLength as 'YachtTitle' From Yacht Where IsDelete=0 And Id=@YachtId;";
            dict.Clear();
            dict["@YachtId"] = YachtId;
            string YachtTitle = db.SearchDBscalar(sqlSentence,dict).ToString();
            db.CloseDB();
            LiteralYachtName1.Text = YachtTitle;
            LiteralYachtName2.Text = YachtTitle;

            LiteralSecondMenu.Text = "<ul>"+
                "<li class=\"menu_y00\">YACHTS</li>"+
        $"<li><a class=\"menu_yli01\" href=\"Yacht.aspx?YachtId={YachtId}\">Interior</a></li>" +
        $"<li><a class=\"menu_yli02\" href=\"Yacht_Layout.aspx?YachtId={YachtId}\">Layout & deck pla</a>n</li>"+
        $"<li><a class=\"menu_yli03\" href=\"Yachts_Specification.aspx?YachtId={YachtId}\">Specification</a></li>"+
        "</ul>";


        }



    }
}