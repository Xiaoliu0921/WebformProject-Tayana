using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class Index : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            ShopRpChangePhoto();
            ShopRpNews();
        }

        public string ShowNewDesignOrBuilding(bool IsNewDesign,bool IsNewBuilding)
        {
            string output = "";

            if (IsNewBuilding)
            {
                output = "<div class=\"new\"><img src=\"../ForeMasterMaterial/images/newBuilding.png\" alt=\"new\" /></div>";
            }

            if (IsNewDesign)
            {
                output = "<div class=\"new\"><img src=\"../ForeMasterMaterial/images/newDesign.png\" alt=\"new\" /></div>";
            }
            return output;
        }

        public void ShopRpChangePhoto()
        {
            sqlSentence = "Select Top 6 Model,ModelLength,IsNewBuilding,IsNewDesign,YA.ImagePath From Yacht Y Join YachtAlbum YA on Y.CoverId=YA.Id Where Y.IsDelete=0 And YA.IsDelete=0 Order by Y.Id DESC;";
            RepeaterChangePhoto1.DataSource=db.SearchDB(sqlSentence);
            RepeaterChangePhoto1.DataBind();
            db.CloseDB();

            sqlSentence = "Select Top 6 YA.ImagePath From Yacht Y Join YachtAlbum YA on Y.CoverId=YA.Id Where Y.IsDelete=0 And YA.IsDelete=0 Order by Y.Id DESC;";
            RepeaterChangePhoto2.DataSource = db.SearchDB(sqlSentence);
            RepeaterChangePhoto2.DataBind();
            db.CloseDB();

        }

        protected void RepeaterChangePhoto1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal liter = (Literal)e.Item.FindControl("LiteralLiTag");
                if(e.Item.ItemIndex == 0)
                {
                    liter.Text = "<li class=\"info on\">";
                }
                else
                {
                    liter.Text = "<li class=\"info\">";

                }

            }

        }

        protected void RepeaterChangePhoto2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal liter = (Literal)e.Item.FindControl("LiteralLiTag");
                if (e.Item.ItemIndex == 0)
                {
                    liter.Text = "<li class=\"on\">";
                }
                else
                {
                    liter.Text = "<li>";
                }

            }
        }

        public string ReplaceHtml(string Content)
        {
            string shortContent = Content;
            shortContent = Regex.Replace(Content, "<.*?>", string.Empty);
            shortContent = shortContent.Replace("&nbsp;", " ")
                                        .Replace("&lt;", "<")
                                        .Replace("&gt;", ">")
                                        .Replace("&amp;", "&")
                                        .Replace("&quot;", "\"")
                                        .Replace("&apos;", "'");

            if (shortContent.Length > 99)
            {
                shortContent = shortContent.Substring(0, 100)+"...";
            }
            else
            {
                shortContent = shortContent.Substring(0);

            }


            return shortContent;
        }

        public string ShowNewsTopTag(bool IsTop)
        {
            string output = "";

            if (IsTop)
            {
                output = "<!--TOP標籤-->" +
                "<div class=\"newstop\">" +
                "<img src=\"../ForeMasterMaterial/images/new_top01.png\" " +
                "alt=\"&quot;&quot;\" />" +
                "</div>" +
                "<!--TOP標籤結束-->";
            }
            

            return output;
        }

        public void ShopRpNews()
        {
            sqlSentence = "";
            sqlSentence = $"Select Top 3 N.Id,N.Title,N.Content,NI.ImagePath,N.IsTop From News as N Join NewsImage as NI On N.CoverId=NI.Id Where N.IsDelete=0 Order by IsTop Desc,NewsDate DESC;";
            RepeaterNews.DataSource = db.SearchDB(sqlSentence);
            RepeaterNews.DataBind();
            db.CloseDB();


        }


    }
}