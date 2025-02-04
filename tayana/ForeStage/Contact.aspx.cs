using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using MailKit.Net.Smtp;
using MimeKit;

namespace tayana.ForeStage
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
        }

        protected void ImageButtonSubmit_Click(object sender, ImageClickEventArgs e)
        {
            if (string.IsNullOrEmpty(RecaptchaWidget1.Response))
            {
                Response.Write("<script>alert('未通過\"我不是機器人驗證\"!')</script>");
            }
            else
            {
                var result = RecaptchaWidget1.Verify();
                if (result.Success)
                {
                    SendMail();
                    Response.Write("<script>alert('寄信成功')</script>");
                    TextBoxComments.Text = null;
                    TextBoxName.Text = null;
                    TextBoxPhone.Text = null;
                    TextBoxEmail.Text = null;
                    DropDownListBrochure.SelectedIndex = 0;
                    DropDownListCountry.SelectedIndex = 0;

                }
                else
                {
                    string error = "";
                    foreach (var err in result.ErrorCodes)
                    {
                        error += err;
                    }
                    Response.Write($"<script>alert('未通過\"我不是機器人驗證\"：{error}')</script>");
                }

            }
        }

        public void SendMail()
        {
            //宣告使用 MimeMessage
            var message = new MimeMessage();
            //設定發信地址 ("發信人", "發信 email")
            message.From.Add(new MailboxAddress("TayanaYacht", "*********@gmail.com"));
            //設定收信地址 ("收信人", "收信 email")
            message.To.Add(new MailboxAddress(TextBoxName.Text.Trim(), TextBoxEmail.Text.Trim()));
            //寄件副本email
            message.Bcc.Add(new MailboxAddress("Tayana管理員", "*********@gmail.com"));
            //設定優先權
            //message.Priority = MessagePriority.Normal;
            //信件標題
            message.Subject = "TayanaYacht Auto Email";
            //建立 html 郵件格式
            BodyBuilder bodyBuilder = new BodyBuilder();
            bodyBuilder.HtmlBody =
                "<h1>Thank you for contacting us!</h1>" +
                $"<h3>Name : {TextBoxName.Text.Trim()}</h3>" +
                $"<h3>Email : {TextBoxEmail.Text.Trim()}</h3>" +
                $"<h3>Phone : {TextBoxPhone.Text.Trim()}</h3>" +
                $"<h3>Country : {DropDownListCountry.SelectedItem}</h3>" +
                $"<h3>Type : {DropDownListBrochure.SelectedItem}</h3>" +
                $"<h3>Comments : </h3>" +
                $"<p>{TextBoxComments.Text.Trim()}</p>";
            //設定郵件內容
            message.Body = bodyBuilder.ToMessageBody(); //轉成郵件內容格式
            using (var client = new SmtpClient())
            {
                //有開防毒時需設定 false 關閉檢查
                client.CheckCertificateRevocation = false;
                //設定連線 gmail ("smtp Server", Port, SSL加密) 
                client.Connect("smtp.gmail.com", 587, false); // localhost 測試使用加密需先關閉 

                // Note: only needed if the SMTP server requires authentication
                client.Authenticate("**********@gmail.com", "****************");
                //發信
                client.Send(message);
                //結束連線
                client.Disconnect(true);
            }
        }
    }
}