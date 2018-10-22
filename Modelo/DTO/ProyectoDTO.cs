using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.DTO
{
    public class ProyectoDTO
    {
        public int IdProyecto { get; set; }
 
        public DateTime FechaProyecto { get; set; }

        public int IdEmpresa { get; set; }

        public int Etapa { get; set; }

        public string NombreEmpresa { get; set; }

       
    }
}
