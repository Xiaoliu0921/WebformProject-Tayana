using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana.ForeStage
{
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowRP();
            }
        }

        public void ShowRP()
        {
            DbHelper db = new DbHelper();
            string sqlSentence = "Select Top 1 * From CompanyAbout Order By Id DESC";
            RepeaterContent.DataSource=db.SearchDB(sqlSentence);
            RepeaterContent.DataBind();
            db.CloseDB();
        }

    }
}