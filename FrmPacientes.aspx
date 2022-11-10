<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPacientes.aspx.cs" Inherits="Hospital0.FrmPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 828px;
        }
        .auto-style2 {
            height: 115px;
            text-align: center;
        }
        .auto-style3 {
            width: 418px;
            height: 253px;
        }
        .auto-style4 {
            width: 548px;
        }
        .auto-style5 {
            margin-left: 104px;
        }
        .auto-style6 {
            width: 548px;
            height: 382px;
        }
        .auto-style7 {
            height: 382px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" colspan="2">PACIENTES<br />
                <br />
                <img alt="" class="auto-style3" src="Imagenes/Imagen_Paciente.png" /></td>
        </tr>
        <tr>
            <td class="auto-style6">
                <br />
                <br />
                <asp:Button ID="BConsultar" runat="server" Text="Consultar por Cedula" OnClick="BConsultar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Button ID="Bporcentaje" runat="server" Text="% de hombres y mujeres" OnClick="Bporcentaje_Click" />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Haga clic en el boton de arriba para conocer el %"></asp:Label>
                &nbsp;<br />
                <br />
                Ingrese el número de cedula para realizar la consulta o ingrese un nuevo paciente.<br />
                <br />
                <br />
                <br />
                Cedula:&nbsp;
                <asp:TextBox ID="Tcedula" runat="server"></asp:TextBox>
                <br />
                <br />
                Nombre
                <asp:TextBox ID="Tnombre" runat="server" OnTextChanged="Tnombre_TextChanged"></asp:TextBox>
                <br />
                <br />

                Genero: <asp:RadioButton ID="rm" Text="Masculino" runat="server" /><asp:RadioButton ID="rf" Text="Femenino" runat="server" />

                <br />
                <br />
                Edad: <asp:TextBox ID="Tedad" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                <br />
                <br />
                Provincia:
                <asp:DropDownList ID="Dprovincia" runat="server">
                    <asp:ListItem>San Jose</asp:ListItem>
                    <asp:ListItem>Alajuela</asp:ListItem>
                    <asp:ListItem>Cartago</asp:ListItem>
                    <asp:ListItem>Heredia</asp:ListItem>
                    <asp:ListItem>Guanacaste</asp:ListItem>
                    <asp:ListItem>Puntarenas</asp:ListItem>
                    <asp:ListItem>Limon</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Canton:
                <asp:DropDownList ID="Dcanton" runat="server">
                    <asp:ListItem>Central</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Distrito: <asp:TextBox ID="Tdistrito" runat="server" OnTextChanged="Tdistrito_TextChanged"></asp:TextBox>
                <br />
                <br />
                Nacionalidad:
                <asp:TextBox ID="TcodigoPais" runat="server"></asp:TextBox>
                <br />
                <br />
                Telefono:
                <asp:TextBox ID="Ttelefono" runat="server" OnTextChanged="Ttelefono_TextChanged"></asp:TextBox>
                <br />
                <br />
                Si Seguro Marque:
                <asp:CheckBox ID="SeguroSi" runat="server" OnCheckedChanged="SeguroSi_CheckedChanged" />
                <br />
                <br />
            </td>
            <td class="auto-style7">
                <asp:Button ID="BallPacientes" runat="server" OnClick="BallPacientes_Click" Text="Nombres de Todos los Pacientes" />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Haga clic en boton de arriba para mostrar los nombres de todos los pacientes"></asp:Label>
                <br />
                <br />
                <asp:Button ID="BPorcentajeSeguro" runat="server" Text="% de Pacientes con seguro" OnClick="BPorcentajeSeguro_Click" />
                <br />
                <asp:Label ID="LabelPorcentajeSeguro" runat="server" Text="%"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="BPorcentajeEdad" runat="server" Text="Porcentaje de Pacientes por Edad" OnClick="BPorcentajeEdad_Click" />
                <br />
                <br />
                <asp:Label ID="LabelPorcentajeEdad" runat="server" Text="% por edad"></asp:Label>
                <br />
                </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Button ID="BIngresarPaciente" runat="server" OnClick="BIngresarPaciente_Click" Text="Ingresar" />
            &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Bborrar" runat="server" OnClick="Bborrar_Click" Text="Borrar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        <div>
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style5" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
