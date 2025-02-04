using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tayana
{
    public partial class TEST : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // 創建新的 TextBox 控制項
            TextBox txtKey = new TextBox();
            txtKey.ID = "txtKey" + phTextBoxes.Controls.Count; // 設定唯一的 ID

            TextBox txtValue = new TextBox();
            txtValue.ID = "txtValue" + phTextBoxes.Controls.Count; // 設定唯一的 ID

            // 將新的 TextBox 添加到 PlaceHolder
            phTextBoxes.Controls.Add(txtKey);
            phTextBoxes.Controls.Add(new LiteralControl(" ")); // 添加一個空白空間
            phTextBoxes.Controls.Add(txtValue);
            phTextBoxes.Controls.Add(new LiteralControl("<br />")); // 添加一個換行
        }

        protected override void LoadViewState(object savedState)
        {
            base.LoadViewState(savedState);

            // 檢查是否有儲存動態 TextBox 的數量
            if (ViewState["DynamicTextBoxCount"] is int textBoxCount)
            {
                for (int i = 0; i < textBoxCount; i++)
                {
                    TextBox txtKey = new TextBox();
                    txtKey.ID = "txtKey" + i;

                    TextBox txtValue = new TextBox();
                    txtValue.ID = "txtValue" + i;

                    phTextBoxes.Controls.Add(txtKey);
                    phTextBoxes.Controls.Add(new LiteralControl(" "));
                    phTextBoxes.Controls.Add(txtValue);
                    phTextBoxes.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }


        protected override object SaveViewState()
        {
            ViewState["DynamicTextBoxCount"] = phTextBoxes.Controls.Count / 4; // 每組有四個控制項，包括兩個 LiteralControl
            return base.SaveViewState();
        }

    }
}