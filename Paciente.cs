using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hospital0
{
    public class Paciente
    {
        public static string cedula { get; set; }
        public static string nombre { get; set; }

        public static char sexo { get; set; }

        public static int edad { get; set; }

        public static string provincia { get; set; }

        public static string canton { get; set; }

        public static string distrito { get; set; }

        public static string nacionalidad { get; set; }

        public static string telefono { get; set; }

        public static Boolean seguro { get; set; }

        public Paciente()
        {

        }

    }
}