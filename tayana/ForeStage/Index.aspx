<%@ Page Title="" Language="C#" MasterPageFile="~/ForeStage/ForeMaster.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="tayana.ForeStage.Index" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(function () {

            // 先取得 #abgne-block-20110111 , 必要參數及輪播間隔
            var $block = $('#abgne-block-20110111'),
                timrt, speed = 4000;


            // 幫 #abgne-block-20110111 .title ul li 加上 hover() 事件
            var $li = $('.title ul li', $block).hover(function () {
                // 當滑鼠移上時加上 .over 樣式
                $(this).addClass('over').siblings('.over').removeClass('over');
            }, function () {
                // 當滑鼠移出時移除 .over 樣式
                $(this).removeClass('over');
            }).click(function () {
                // 當滑鼠點擊時, 顯示相對應的 div.info
                // 並加上 .on 樣式

                $(this).addClass('on').siblings('.on').removeClass('on');
                $('#abgne-block-20110111 .bd .banner ul:eq(0)').children().hide().eq($(this).index()).fadeIn(1000);
            });

            // 幫 $block 加上 hover() 事件
            $block.hover(function () {
                // 當滑鼠移上時停止計時器
                clearTimeout(timer);
            }, function () {
                // 當滑鼠移出時啟動計時器
                timer = setTimeout(move, speed);
            });

            // 控制輪播
            function move() {
                var _index = $('.title ul li.on', $block).index();
                _index = (_index + 1) % $li.length;
                $li.eq(_index).click();

                timer = setTimeout(move, speed);
            }

            // 啟動計時器
            timer = setTimeout(move, speed);

        });
    </script>
    <link href="../ForeMasterMaterial/css/style.css" rel="stylesheet" type="text/css" />

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHoldermasks" runat="server">
    <!--遮罩-->
    <div class="bannermasks">
        <img src="../ForeMasterMaterial/images/banner00_masks.png" alt="&quot;&quot;" />
    </div>
    <!--遮罩結束-->
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderIndexChangePhoto" runat="server">

    <div id="abgne-block-20110111">
        <div class="bd">
            <div class="banner">

                <ul>
                    <asp:Repeater ID="RepeaterChangePhoto1" runat="server" OnItemDataBound="RepeaterChangePhoto1_ItemDataBound">
                        <ItemTemplate>
                            <asp:Literal ID="LiteralLiTag" runat="server"></asp:Literal>
                            <%--<li class="info on">--%>
                            <a href="#">
                                <img style="width: 966px; height: 424px;" src="<%#Eval("ImagePath").ToString() %>" /></a><!--文字開始--><div class="wordtitle">
                                    <%#Eval("Model").ToString() %> <span><%#Eval("ModelLength").ToString() %></span><br />
                                    <p>SPECIFICATION SHEET</p>

                                </div>
                            <!--文字結束-->
                            <!--新船型開始  54型才出現其於隱藏 -->
                            <%# ShowNewDesignOrBuilding(Convert.ToBoolean(Eval("IsNewDesign")),Convert.ToBoolean(Eval("IsNewBuilding"))) %>

                            <!--新船型結束-->
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>


                <!--小圖開始-->
                <div class="bannerimg title">
                    <ul>
                        <asp:Repeater ID="RepeaterChangePhoto2" runat="server" OnItemDataBound="RepeaterChangePhoto2_ItemDataBound">
                            <ItemTemplate>
                                <asp:Literal ID="LiteralLiTag" runat="server"></asp:Literal>
                                <%--<li class="on">--%>
                                <div>
                                    <p class="bannerimg_p">
                                        <img style="width: 99px; height: 59px" src="<%#Eval("ImagePath").ToString() %>" alt="&quot;&quot;" />
                                    </p>
                                </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <!--小圖結束-->
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div class="news">
        <div class="newstitle">
            <p class="newstitlep1">
                <img src="../ForeMasterMaterial/images/news.gif" alt="news" />
            </p>
            <p class="newstitlep2"><a href="News.aspx">More>></a></p>
        </div>
        <ul>
            <asp:Repeater ID="RepeaterNews" runat="server">
                <ItemTemplate>
                    <!--一則消息-->
                    <li>
                        <div class="news01">
                            
                            <%# ShowNewsTopTag(Convert.ToBoolean(Eval("IsTop"))) %>

                            <div class="news02p1">
                                <p class="news02p1img">
                                    <img style="width:95px;height:95px;" src="<%#Eval("ImagePath").ToString() %>" alt="&quot;&quot;" /></p>
                            </div>
                            <p class="news02p2"><a href="NewsContent.aspx?NewsId=<%#Eval("Id").ToString() %>"><span><%#Eval("Title").ToString() %></span> <%#ReplaceHtml(Eval("Content").ToString())%></a></p>
                        </div>
                    </li>
                    <!--一則消息-->
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</asp:Content>
