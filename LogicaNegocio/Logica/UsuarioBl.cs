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

        public Task<UsuarioDTO> IniciarSesion(UsuarioDTO oUser)
        {
            //var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            PersonaDTO oPersonaDTO = new PersonaDTO();

            var Datos = (from i in entity.Usuario
                         join e in entity.Empresa on i.IdUsuario equals e.IdUsuario
                         where i.NombreUsuario == oUser.NombreUsuario & i.Password == oUser.Password
                         select new UsuarioDTO{
                             IdUsuario = i.IdUsuario,
                             NombreUsuario= i.NombreUsuario,
                             TipoEmpresa= e.TipoEmpresa,
                             IdEmpresa= e.IdEmpresa,
                             NombreEmpresa= e.NombreEmpresa
                         }).FirstOrDefault();

            var Can_Proyectos = (from p in entity.Proyecto
                                 join h in entity.Huella on p.IdProyecto equals h.IdProyecto
                                 join d in entity.DetalleHuella on h.IdHuella equals d.IdHuella
                                 where p.IdEmpresa== Datos.IdEmpresa
                                 select d).ToList();


            if (Datos == null)
            {
                return null;
            }

            if (Can_Proyectos.Count== 0)
            {
                Datos.Proyectos = false;
            }
            else
            {
                Datos.Proyectos = true;
            }

            return Task.FromResult<UsuarioDTO>(Datos);
        }

        public Task<bool> RegistarEmpresa(EmpresaDTO oEmpresa)
        {

            //var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            var user = (from i in entity.Usuario
                        where i.NombreUsuario == oEmpresa.Email
                        select i).FirstOrDefault();

            if (user != null)
            {
                return Task.FromResult<bool>(false);
            }
            Usuario usuario = new Usuario();
            usuario.NombreUsuario = oEmpresa.Email;
            usuario.Password = oEmpresa.Password;
            usuario.TipoUsuario =1;

            entity.Usuario.Add(usuario);
            entity.SaveChanges();

            //var user1 = (from i in entity.Usuario
            //            where i.NombreUsuario == oEmpresa.Email
            //            select i).FirstOrDefault();

            Empresa empresa = new Empresa();
            empresa.NombreEmpresa = oEmpresa.NombreEmpresa;
            empresa.Email = oEmpresa.Email;
            empresa.Nit = oEmpresa.Nit;
            empresa.Direccion = oEmpresa.Direccion;
            empresa.IdUsuario = usuario.IdUsuario;
            empresa.TipoEmpresa = oEmpresa.TipoEmpresa;
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

        public Task<Usuario> ConsultarUsuario()
        {
            var Usuario = (from i in entity.Usuario
                           select i).FirstOrDefault();

            return Task.FromResult<Usuario>(Usuario);
        }

    }
}
