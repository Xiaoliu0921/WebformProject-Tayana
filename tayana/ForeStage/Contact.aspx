<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaterContent.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="tayana.ForeStage.Contact" %>

<%@ Register Assembly="Recaptcha.Web" Namespace="Recaptcha.Web.UI.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHoldermasks" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="../ForeMasterMaterial/images/banner02_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChangePhoto" runat="server">
    <ul>
        <li>
            <img src="../ForeMasterMaterial/images/newbanner.jpg" alt="Tayana Yachts" /></li>
    </ul>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeftBar" runat="server">
    <p><span>CONTACT</span></p>
    <ul>
        <li><a href="#">contacts</a></li>
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderSystemNamePath" runat="server">
    <a href="#">Home</a> >> <a href="#"><span class="on1">Contact</span></a>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderSystemName" runat="server">
    Contact
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolderSystemContent" runat="server">
    <div class="from01">
        <p>
            Please Enter your contact information<span class="span01">*Required</span>
        </p>
        <br />
        <table>
            <tr>
                <td class="from01td01">Name :</td>
                <td><span>*</span>
                    <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="from01td01">Email :</td>
                <td><span>*</span>
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="from01td01">Phone :</td>
                <td><span>*</span>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="from01td01">Country :</td>
                <td><span>*</span>
                    <asp:DropDownList ID="DropDownListCountry" runat="server" DataSourceID="SqlDataSource1" DataTextField="Country" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TayanaSQLconnectionString %>" SelectCommand="SELECT * FROM [DealerCountry] Where IsDelete=0"></asp:SqlDataSource>
            </tr>
            <tr>
                <td colspan="2"><span>*</span>
                    Brochure of interest  *Which Brochure would you like to view?</td>
            </tr>
            <tr>
                <td class="from01td01">&nbsp;</td>
                <td>
                    <asp:DropDownList ID="DropDownListBrochure" runat="server" DataSourceID="SqlDataSource2" DataTextField="YachtName" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TayanaSQLconnectionString %>" SelectCommand="SELECT  Id,Model + '  ' + ModelLength +IIF(IsNewDesign=1,' (New Design)','') +IIF(IsNewBuilding=1,' (New Building)','')as 'YachtName'
FROM    Yacht
Where IsDelete=0 Order by Id DESC"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="from01td01">Comments:</td>
                <td>
                    <asp:TextBox ID="TextBoxComments" runat="server" TextMode="MultiLine" Height="145px" Width="331px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="from01td01">&nbsp;</td>
                <td>
                    <%-------------放Google機器人驗證--------------%>
                    <cc1:RecaptchaApiScript ID="RecaptchaApiScript1" runat="server" />
                    <!-- Render recaptcha widget -->
                    <cc1:RecaptchaWidget ID="RecaptchaWidget1" runat="server" RenderApiScript="False" />
                </td>
            </tr>
            <tr>
                <td class="from01td01">&nbsp;</td>
                <td class="f_right">
                    <%-- 提交聯絡資訊的按鈕 --%>
                    <asp:ImageButton ID="ImageButtonSubmit" Width="59" Height="25" runat="server" ImageUrl="~/ForeMasterMaterial/images/buttom03.gif" OnClick="ImageButtonSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
    <!--表單-->

    <div class="box1">
        <span class="span02">Contact with us</span><br />
        Thanks for your enjoying our web site as an introduction to the Tayana world and our range of yachts.
As all the designs in our range are semi-custom built, we are glad to offer a personal service to all our potential customers. 
If you have any questions about our yachts or would like to take your interest a stage further, please feel free to contact us.
    </div>

    <div class="list03">
        <p>
            <span>TAYANA HEAD OFFICE</span><br />
            NO.60 Haichien Rd. Chungmen Village Linyuan Kaohsiung Hsien 832 Taiwan R.O.C<br />
            tel. +886(7)641 2422<br />
            fax. +886(7)642 3193<br />
            info@tayanaworld.com<br />
        </p>
    </div>


    <div class="list03">
        <p>
            <span>SALES DEPT.</span><br />
            +886(7)641 2422  ATTEN. Mr.Basil Lin<br />
            <br />
        </p>
    </div>

    <div class="box4">
        <h4>Location</h4>
        <p>
            <%--<iframe width="695" height="518" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=%E5%8F%B0%E7%81%A3%E9%AB%98%E9%9B%84%E5%B8%82%E5%B0%8F%E6%B8%AF%E5%8D%80%E4%B8%AD%E5%B1%B1%E5%9B%9B%E8%B7%AF%E9%AB%98%E9%9B%84%E5%B0%8F%E6%B8%AF%E6%A9%9F%E5%A0%B4&amp;daddr=%E5%8F%B0%E7%81%A3%E9%AB%98%E9%9B%84%E5%B8%82%E6%9E%97%E5%9C%92%E5%8D%80%E4%B8%AD%E9%96%80%E6%9D%91%E6%B5%B7%E5%A2%98%E8%B7%AF%EF%BC%96%EF%BC%90%E8%99%9F&amp;hl=zh-en&amp;geocode=FRthWAEdwlwsByGxkQ4S1t-ckinNS9aM0xxuNDELEXJZh6Soqg%3BFRRmVwEdMKssBym5azbzl-JxNDGd62mwtzGaDw&amp;aq=0&amp;oq=%E9%AB%98%E9%9B%84%E5%B0%8F%E6%B8%AF%E6%A9%9F&amp;sll=22.50498,120.36792&amp;sspn=0.008356,0.016512&amp;g=%E5%8F%B0%E7%81%A3%E9%AB%98%E9%9B%84%E5%B8%82%E6%9E%97%E5%9C%92%E5%8D%80%E4%B8%AD%E9%96%80%E6%9D%91%E6%B5%B7%E5%A2%98%E8%B7%AF%EF%BC%96%EF%BC%90%E8%99%9F&amp;mra=ls&amp;ie=UTF8&amp;t=m&amp;ll=22.537135,120.360718&amp;spn=0.08213,0.119133&amp;z=13&amp;output=embed"></iframe>--%>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3682.6906363357803!2d120.30792991093196!3d22.62802483085082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e0491b7febacd%3A0x24542bac2726199b!2z5a-25oiQ5LiW57SA5aSn5qiT!5e0!3m2!1szh-TW!2stw!4v1719972347931!5m2!1szh-TW!2stw" width="695" height="518" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
        </p>

    </div>
</asp:Content>
