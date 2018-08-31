using Modelo.Datos;
using Modelo.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicaNegocio.Logica
{
    public class UsuarioBl
    {
        Model1 entity = new Model1();

        public Task<Usuario> IniciarSesion()
        {
            //var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            PersonaDTO oPersonaDTO = new PersonaDTO();
            var Datos = (from i in entity.Usuario
                         select i).FirstOrDefault();

            if (Datos == null)
            {
                return null;
            }

            return Task.FromResult<Usuario>(Datos);
        }

        public Task<bool> RegistarEmpresa(EmpresaDTO oEmpresa)
        {
            //var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            Usuario usuario = new Usuario();
            usuario.NombreUsuario = oEmpresa.Email;
            usuario.Password = oEmpresa.Password;

            entity.Usuario.Add(usuario);
            entity.SaveChanges();

            var user = (from i in entity.Usuario
                        where i.NombreUsuario == oEmpresa.Email && oEmpresa.Password == oEmpresa.Password
                        select i).FirstOrDefault();

            Empresa empresa = new Empresa();
            empresa.NombreEmpresa = oEmpresa.NombreEmpresa;
            empresa.Email = oEmpresa.Email;
            empresa.Nit = oEmpresa.Nit;
            empresa.Direccion = oEmpresa.Direccion;
            empresa.IdUsuario = user.IdUsuario;
            entity.Empresa.Add(empresa);
            entity.SaveChanges();

            return Task.FromResult<bool>(true);
        }

     
        public void CambiarContrasena(string Password, string newPassword, int usuario)
        {
            var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            PersonaDTO oPersonaDTO = new PersonaDTO();
            var Datos = (from i in entity.Usuario
                         where i.Password == Encriptar && i.IdUsuario == usuario
                         select i).FirstOrDefault();

            if (Datos != null)
            {
                Datos.Password = SecurityEncode.SecurityEncode.Encriptar(newPassword);
                entity.SaveChanges();
            }
        }
    }
}
