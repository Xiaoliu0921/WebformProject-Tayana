using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class News : System.Web.UI.Page
    {
        DbHelper db = new DbHelper();
        Dictionary<string, object> dict = new Dictionary<string, object>();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CountPageAndBuildPageBtn();
                ShowNews();
            }
        }

        public void CountPageAndBuildPageBtn()
        {
            sqlSentence = "Select count(*) as 'count' From News Where IsDelete=0";
            int countNews = (int)db.SearchDBscalar(sqlSentence);
            db.CloseDB();
            int countPage = (int)(countNews / 10) + 1;

            //獲取QueryString判斷現在是第幾頁，如果"無輸入"或"無法轉成整數"或"輸入超過總頁數"
            int nowPage;
            if (Request.QueryString["Page"] == null || !(int.TryParse(Request.QueryString["Page"], out int result)) || result > countPage)
            {
                nowPage = 1;
            }
            else
            {
                nowPage = result;
            }

            //產出Literal頁面按鈕
            //nowPage超過1的話，代表會有上一頁
            string pages = "";
            if (nowPage > 1 && countPage > 1)
            {
                pages += $"<a href=\"News.aspx?Page=1\">FirstPage</a> | ";
                pages += $"<a href=\"News.aspx?Page={nowPage - 1}\">PreviousPage</a>  ";
            }

            //每一頁Page的按鈕
            pages += "|";
            for (int i = 1; i <= countPage; i++)
            {
                if (i == nowPage)
                {
                    pages += $" <span>{i}</span> |";
                }
                else
                {
                    pages += $" <a href=\"News.aspx?Page={i}\">{i}</a> |";
                }
            }

            //Next Page
            if (countPage > 1 && nowPage < countPage)
            {
                pages += $"   <a href=\"News.aspx?Page={nowPage + 1}\">NextPage</a>  |";
                pages += $"   <a href=\"News.aspx?Page={countPage}\">LastPage</a>   ";
            }

            LiteralNowPages.Text = $"Items：<span>{countNews}</span>  |  Pages：<span>{nowPage}/{countPage}</span>";
            LiteralPages.Text = pages;
            HiddenFieldNowPage.Value = nowPage.ToString();

        }

        public void ShowNews()
        {
            int nowPage = Convert.ToInt32(HiddenFieldNowPage.Value);
            sqlSentence = $"Select N.Id,N.Title,N.Content,Format(NewsDate,'yyyy-MM-dd') as 'Release Date',NI.ImagePath,N.IsTop From News as N Join NewsImage as NI On N.CoverId=NI.Id Where N.IsDelete=0 Order by IsTop Desc,NewsDate DESC Offset {(nowPage - 1) * 10} Rows Fetch Next 10 Rows Only;";
            RepeaterNewsList.DataSource = db.SearchDB(sqlSentence);
            RepeaterNewsList.DataBind();
            db.CloseDB();
        }

        public string ShowTopTag(bool IsTop)
        {
            string output = "";

            if (IsTop)
            {
                output = "<!--TOP標籤-->" +
                    "<div class=\"newstop\" " +
                    "style=\"border:none;\">" +
                    "<img src=\"../ForeMasterMaterial/images/new_top01.png\" alt=\"&quot;&quot;\" />" +
                    "</div>" +
                    "<!--TOP標籤結束-->";
            }
            return output;
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

            if (shortContent.Length > 149)
            {
                shortContent = shortContent.Substring(0, 150);
            }
            else
            {
                shortContent = shortContent.Substring(0);

            }


            return shortContent;
        }


    }
}