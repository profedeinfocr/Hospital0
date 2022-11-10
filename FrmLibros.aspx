<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLibros.aspx.cs" Inherits="Hospital0.FrmLibros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 466px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            width: 367px;
            height: 265px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="2">LIBROS<br />
                    <br />
                    <img class="auto-style4" src="Imagenes/Imagen_Libro.png" /></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <br />
                    Codigo:&nbsp;
                    <asp:TextBox ID="tCodigo" runat="server" OnTextChanged="tCodigo_TextChanged"></asp:TextBox>
                    <br />
                    <br />
                    Titulo:&nbsp;
                    <asp:TextBox ID="tTitulo" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Autor:&nbsp;
                    <asp:TextBox ID="tAutor" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    Precio:&nbsp;
                    <asp:TextBox ID="tPrecio" runat="server"></asp:TextBox>
                    <br />
                    <br />
                </td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlLibros" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="codigo" HeaderText="codigo" SortExpression="codigo" />
                            <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                            <asp:BoundField DataField="autor" HeaderText="autor" SortExpression="autor" />
                            <asp:BoundField DataField="precio" HeaderText="precio" SortExpression="precio" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlLibros" runat="server" ConnectionString="<%$ ConnectionStrings:Biblioteca0ConnectionString %>" DeleteCommand="delete Libro where codigo = @codigo" InsertCommand="Insert into Libro values (@codigo, @titulo, @autor, @precio)" SelectCommand="SELECT * FROM [Libro]" UpdateCommand="update Libro set titulo = @titulo, autor = @autor, precio = @precio where codigo = @codigo">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="tCodigo" Name="codigo" PropertyName="Text" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="tCodigo" Name="codigo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tTitulo" Name="titulo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tAutor" Name="autor" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tPrecio" Name="precio" PropertyName="Text" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="tCodigo" Name="codigo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tTitulo" Name="titulo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tAutor" Name="autor" PropertyName="Text" />
                            <asp:ControlParameter ControlID="tPrecio" Name="precio" PropertyName="Text" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="BIngresar" runat="server" Text="Ingresar" OnClick="Button1_Click" />
&nbsp;
                    <asp:Button ID="BBorrar" runat="server" Text="Borrar" OnClick="Button2_Click" />
&nbsp;
                    <asp:Button ID="BModificar" runat="server" Text="Modificar" OnClick="Button3_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
