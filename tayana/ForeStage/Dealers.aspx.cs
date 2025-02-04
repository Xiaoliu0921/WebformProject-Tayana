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
    public partial class Dealers : System.Web.UI.Page
    {
        DbHelper db=new DbHelper();
        Dictionary<string,object> dict= new Dictionary<string,object>();
        string sqlSentence = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"]==null)
                {
                    ShowRepeaterLeft();
                    ShowRepeaterContent();
                    LiteralPathName.Text = HiddenFieldCountryName.Value;
                    LiteralSystemName.Text= HiddenFieldCountryName.Value;
                }
                else
                {
                    ShowRepeaterLeft();
                    HiddenFieldCountryId.Value = Request.QueryString["Id"];
                    ShowRepeaterContent();
                    LiteralPathName.Text = HiddenFieldCountryName.Value;
                    LiteralSystemName.Text = HiddenFieldCountryName.Value;
                }
            }
            else
            {
                if (Request.QueryString["Id"] == null)
                {
                    ShowRepeaterContent();
                    LiteralPathName.Text = HiddenFieldCountryName.Value;
                    LiteralSystemName.Text = HiddenFieldCountryName.Value;
                }
                else
                {
                    HiddenFieldCountryId.Value = Request.QueryString["Id"];
                    ShowRepeaterContent();
                    LiteralPathName.Text = HiddenFieldCountryName.Value;
                    LiteralSystemName.Text = HiddenFieldCountryName.Value;
                }
            }
        }

        public void ShowRepeaterLeft()
        {
            //sqlSentence = "Select * From DealerCountry Where IsDelete=0";
            sqlSentence = "Select Dc.Id,DC.Country From DealerCountry DC Join DealerArea Da On DA.CountryId=DC.Id Join Dealers D On D.AreaId=DA.Id  Where DC.IsDelete=0 And DA.IsDelete=0 And D.IsDelete=0 Group by DC.Country,DC.Id Order by DC.Id";
            SqlDataReader rd = db.SearchDB(sqlSentence);
            DataTable dataTable = new DataTable();
            dataTable.Load(rd);
            db.CloseDB();

            if (dataTable.Rows.Count > 0)
            {
                // 假設Id欄位名為"Id"
                HiddenFieldCountryId.Value = dataTable.Rows[0]["Id"].ToString();
                HiddenFieldCountryName.Value= dataTable.Rows[0]["Country"].ToString();
            }
            RepeaterLeftBar.DataSource= dataTable;
            RepeaterLeftBar.DataBind();

        }

        public void ShowRepeaterContent()
        {
            sqlSentence = "Select D.Id,DC.Country,DA.Area,D.ImagePath,D.[Name],\r\n\tCase When Contact='' Then '' Else 'Contact：'+Contact+'<br />' End +\r\n\tCase When [Address]='' Then '' Else 'Address：'+[Address]+'<br />' End +\r\n\tCase When Tel='' Then '' Else 'Tel：'+Tel+'<br />' End +\r\n\tCase When Fax='' Then '' Else 'Fax：'+Fax+'<br />' End +\r\n\tCase When Cell='' Then '' Else 'Cell：'+Cell+'<br />' End +\r\n\tCase When Email='' Then '' Else 'E-mail：'+Email+'<br />' End +\r\n\tCase When Link='' Then '' Else '<a href=\"'+Link+'\" target=\"_blank\">'+Link+'</a>' End as 'Content'\r\nFrom Dealers as D Join DealerArea as DA on DA.Id=D.AreaId Join DealerCountry as DC On DC.Id=DA.CountryId Where D.IsDelete=0 And DA.IsDelete=0 And DC.IsDelete=0 And DA.CountryId=@CountryId;";
            dict.Clear();
            dict["@CountryId"] = Convert.ToInt32(HiddenFieldCountryId.Value);
            SqlDataReader rd = db.SearchDB(sqlSentence,dict);
            DataTable dataTable = new DataTable();
            dataTable.Load(rd);
            db.CloseDB();

            if(dataTable.Rows.Count > 0) 
            {
                HiddenFieldCountryName.Value = dataTable.Rows[0]["Country"].ToString();
                RepeaterDealers.DataSource = dataTable;
                RepeaterDealers.DataBind();
            }
            
        }

    }
}