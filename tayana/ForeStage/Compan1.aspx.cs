using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class Compan1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowRpContent();
                ShowRpImages();
            }
        }

        public void ShowRpContent()
        {
            DbHelper db = new DbHelper();
            string sqlSentence = "Select Top 1 * From CompanyCertificate Order By Id DESC";
            RepeaterContent.DataSource = db.SearchDB(sqlSentence);
            RepeaterContent.DataBind();
            db.CloseDB();
        }

        public void ShowRpImages()
        {
            DbHelper db = new DbHelper();
            string sqlSentence = "Select * From CompanyImages Where IsDelete=0";
            RepeaterImages.DataSource = db.SearchDB(sqlSentence);
            RepeaterImages.DataBind();
            db.CloseDB();
        }


    }
}