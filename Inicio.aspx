<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Hospital0.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            PAGINA PRINCIPAL<br />
            <br />
&nbsp;<asp:Menu ID="Menu1" runat="server">
                <Items>
                    <asp:MenuItem NavigateUrl="~/FrmLibros.aspx" Text="Libros" Value="Libros"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/FrmPacientes.aspx" Text="Pacientes" Value="Pacientes"></asp:MenuItem>
                </Items>
            </asp:Menu>


        </div>
    </form>
</body>
</html>
