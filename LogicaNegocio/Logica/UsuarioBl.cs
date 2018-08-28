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

        public Task<List<Usuario>> Prueba()
        {
            //var Encriptar = SecurityEncode.SecurityEncode.Encriptar(Password);
            PersonaDTO oPersonaDTO = new PersonaDTO();
            var Datos = (from i in entity.Usuario
                         select i).ToList();

            if (Datos == null)
            {
                return null;
            }

            return Task.FromResult<List<Usuario>>(Datos);
        }

        //public string RecuperarPassword(string Email, string Cedula)
        //{
        //    //var Contraseña = "";
        //    //PersonaDTO oPersonaDTO = new PersonaDTO();
        //    //var Instructor = (from i in entity.Instructor
        //    //                  where i.Email == Email
        //    //                  && i.Cedula == Cedula
        //    //                  select i).FirstOrDefault();

        //    //var Coordinador = (from i in entity.Coordinacion
        //    //                   where i.Correo == Email
        //    //                   && i.Cedula == Cedula
        //    //                   select i).FirstOrDefault();

        //    //if (Instructor != null)
        //    //{
        //    //    var Usuario = (from i in entity.Usuario
        //    //                   where i.IdUsuario == Instructor.IdUsuario
        //    //                   select i).FirstOrDefault();

        //    //    oPersonaDTO.IdUsuario = Instructor.IdUsuario;
        //    //    oPersonaDTO.Nombre = Instructor.Nombre;
        //    //    oPersonaDTO.Apellido = Instructor.Apellido;
        //    //    oPersonaDTO.Cedula = Instructor.Cedula;
        //    //    Contraseña = SecurityEncode.SecurityEncode.Desencriptar(Usuario.Password);
        //    //}
        //    //if (Coordinador != null)
        //    //{
        //    //    var Usuario = (from i in entity.Usuario
        //    //                   where i.IdUsuario == Coordinador.IdUsuario
        //    //                   select i).FirstOrDefault();

        //    //    oPersonaDTO.IdUsuario = Coordinador.IdUsuario;
        //    //    oPersonaDTO.Nombre = Coordinador.Nombre;
        //    //    oPersonaDTO.Apellido = Coordinador.Apellido;
        //    //    oPersonaDTO.Cedula = Coordinador.Cedula;
        //    //    Contraseña = SecurityEncode.SecurityEncode.Desencriptar(Usuario.Password);
        //    //}
        //    //if (Instructor != null || Coordinador != null)
        //    //{
        //    //    var Asunto = "Recupetación de Contraseña";
        //    //    var Plantilla = "Sr(a) " + oPersonaDTO.Nombre + " " + oPersonaDTO.Apellido + ".<br/> La Contraseña de su cuenta de usuario es " + Contraseña;
        //    //    SendMail.SendMailMessage(Asunto, Plantilla, Email);
        //    //    return Email;
        //    //}
        //    //else
        //    //{
        //    //    return null;
        //    //}

        //}

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
