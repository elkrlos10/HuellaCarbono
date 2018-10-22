using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Modelo.DTO
{
    public class UsuarioDTO
    {
        public int IdUsuario { get; set; }

        public int IdEmpresa { get; set; }

        public string NombreUsuario { get; set; }

        public string Password { get; set; }

        public int TipoUsuario { get; set; }

        public int TipoEmpresa { get; set; }

        public bool Proyectos  { get; set; }

        public string NombreEmpresa { get; set; }
    }
}
