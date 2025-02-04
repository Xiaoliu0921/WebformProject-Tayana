<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TEST.aspx.cs" Inherits="tayana.TEST" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="TEST" />
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <br />
            <asp:PlaceHolder ID="phTextBoxes" runat="server"></asp:PlaceHolder>

            <asp:GridView ID="GridView1" runat="server"></asp:GridView>



        </div>
    </form>
</body>
</html>
