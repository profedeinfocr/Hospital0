using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Hospital0
{
    public partial class FrmPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }
        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Paciente"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }//Fin de llenar grid

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
         {
             
         }
        protected void CleanForm() 
        {
            Tcedula.Text = "";
            Tnombre.Text = "";
            rf.Checked = false;
            rm.Checked = false;
            Tedad.Text = null;
            Dprovincia.Text = null;
            Dcanton.Text = null;
            Tdistrito.Text = "";
            TcodigoPais.Text = "";
            Ttelefono.Text = "";
            SeguroSi.Checked = false;





        }

        protected void BIngresarPaciente_Click(object sender, EventArgs e)
        {   
            Paciente.cedula = Tcedula.Text;
            Paciente.nombre = Tnombre.Text;

            if (rf.Checked)
                Paciente.sexo = 'F';
            else Paciente.sexo = 'M';

            
            Paciente.edad = int.Parse(Tedad.Text);
            Paciente.provincia = Dprovincia.Text;
            Paciente.canton = Dcanton.Text;
            Paciente.distrito= Tdistrito.Text;
            Paciente.nacionalidad = TcodigoPais.Text;
            Paciente.telefono = Ttelefono.Text;
            Paciente.seguro = SeguroSi.Checked;

            bool seguro = false;
            //string Distrito = "Distrito1";
            if (SeguroSi.Checked)
            {
                seguro = true;

            }

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" INSERT INTO Paciente VALUES(" + Paciente.cedula + ",'" + Paciente.nombre + "' ," +
                " '"+Paciente.sexo+"', '"+Paciente.edad+"','"+Paciente.provincia+"','"+Paciente.canton+"','"+Paciente.distrito+"'," +
                "'"+Paciente.nacionalidad+"',"+Paciente.telefono+",'"+seguro+"')", conexion);

            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();

            Tcedula.Text = "";
            Tnombre.Text = "";
            rf.Checked = false;
            rm.Checked = false;
            Tedad.Text = null;
            Dprovincia.Text = null;
            Dcanton.Text = null;
            Tdistrito.Text = "";
            TcodigoPais.Text = "";
            Ttelefono.Text = "";
            SeguroSi.Checked = false;




        }

        protected void Dgenero_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)/*Edad*/
        {

        }

        protected void Tnombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Bborrar_Click(object sender, EventArgs e)
        {
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" DELETE Paciente where cedula = '" + Tcedula.Text + "' ", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();
        }

        protected void Tdistrito_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextTest1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SeguroSi_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Ttelefono_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BConsultar_Click(object sender, EventArgs e)
        {

            string cedulaTemp = Tcedula.Text;
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();

            SqlCommand comando = new SqlCommand(" select nombre, edad, provincia, distrito, canton, pais, telefono, sexo, distrito from Paciente where cedula = '" + Tcedula.Text + "' ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            CleanForm();
            registro.Read();
            Tcedula.Text = cedulaTemp;
            Tnombre.Text = registro["nombre"].ToString();
            Tedad.Text = registro["edad"].ToString();
            Dprovincia.Text = registro["provincia"].ToString();
            Dcanton.Text = registro["canton"].ToString();
            Tdistrito.Text = registro["distrito"].ToString();
            TcodigoPais.Text = registro["pais"].ToString();
            Ttelefono.Text = registro["telefono"].ToString();

            if (registro["sexo"].ToString() == "F")
                rf.Checked = true;
            else rm.Checked = true;





            Label1.Text = " Datos del paciente seleccionado: \n" +
                "Nombre: " + registro["sexo"].ToString();

            
            conexion.Close();
            //LlenarGrid();

            

        }

        protected void Bporcentaje_Click(object sender, EventArgs e)
        {

            int cuentaHombres = 0; int cont = 0;
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select * from Paciente ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            while (registro.Read())
            {

                if (registro["sexo"].ToString() == "M") { cuentaHombres++; };


            cont++;
            
            }

            Label2.Text = " El "+ (cuentaHombres)*100/cont + "% de la población son hombres y " +
                "el " + (100-((cuentaHombres) * 100 / cont)) + " % son mujeres ";

        }

        protected void BallPacientes_Click(object sender, EventArgs e)
        {
            string nombres = " ";
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" select nombre from Paciente ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            CleanForm();
            
            while (registro.Read())
            {
                nombres = "\n" + nombres + registro["nombre"].ToString() + ", ";
                
            }

            Label1.Text = " Todos los nombres: \n" + nombres;
            conexion.Close();

        }

        protected void BPorcentajeSeguro_Click(object sender, EventArgs e)
        {
            int cuentaAsegurados = 0; int cont = 0;
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select * from Paciente ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            while (registro.Read())
            {

                if (registro["seguro"].ToString() == "True") { cuentaAsegurados++; };
                

                cont++;

            }

            LabelPorcentajeSeguro.Text = " El " + (cuentaAsegurados) * 100 / cont + "% de los pacientes estan asegurados";



        }

        protected void BPorcentajeEdad_Click(object sender, EventArgs e)
        {

            int cuentaNinos = 0; int cuentaAdultos = 0;  int cont = 0;
            String s = System.Configuration.ConfigurationManager.ConnectionStrings["Biblioteca0ConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand("select * from Paciente ", conexion);
            SqlDataReader registro = comando.ExecuteReader();

            while (registro.Read())
            {

                if (float.Parse( registro["edad"].ToString()) < 14) { cuentaNinos++; };
                if (float.Parse(registro["edad"].ToString()) > 30) { cuentaAdultos++; };

                cont++;

            }

            LabelPorcentajeEdad.Text = " El " + ((cuentaNinos) * 100 / cont) + "% de la población son ninos y " +
                "el " + (100 - ((cuentaNinos) * 100 / cont) - ((cuentaAdultos) * 100 / cont)) + " % son jovenes y el " + ((cuentaAdultos) * 100 / cont) + "% son adultos";




        }
    }

    
}


