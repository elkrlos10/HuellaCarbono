using LogicaNegocio.Email;

using Modelo.Datos;
using Modelo.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Net.Http;

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

        public async Task<bool> RecuperarContrasena(UsuarioDTO oUsuario)
        {
            var Correo = (from i in entity.Usuario
                          where i.NombreUsuario == oUsuario.NombreUsuario
                          select i).FirstOrDefault();
            bool respuesta = false;

			if (Correo != null)
			{ //C:\Users\FS_2017\Desktop\publicacion\SISCOLI\HuellaCarbono\HuellaCarbonoWeb\
				string[] delimitador = new string[] { "api" };
				string[] rutaBase;
				var ruta = HttpContext.Current.Request.Url.AbsoluteUri;
				rutaBase = ruta.Split(delimitador, StringSplitOptions.None);
				var rutaAbsoluta = rutaBase[0];
				var Asunto = "Recuperación contraseña Huella Carbono";
				var body = "<div style = 'font-family:helvetica;'><div style = 'background: white ; border-radius: 20px; height: 100%; width: 80%;margin: 0px; color:#182430;  box-shadow: 2px 6px 15px #ccc'>" +
					"<div style = 'background: #82a20d; width: 100%; height: 150px;border-radius: 20px 20px 0px 0px;'>" +
		"<center><img src='" + rutaAbsoluta + "Images/logoBlanco.png' width='150px' style='margin-top:5px' /></center></div>" +
		"<div style='padding:20px'><b><h2> Hola </h2></b><p>La solicitud para recuperar su contraseña ha sido aceptada</p> <center><b><h3> INFORMACIÓN DE CONTACTO</h3></b></center> " +
		"<h4>Usuario: " + Correo.NombreUsuario + "</h4><h4> Contraseña: " + Correo.Password + "</h4> " +
		"<p> Puede dirigirse a la aplicación móvil Huella de carbono para ingresar nuevamente </p><br><br><i> Esto es un correo electrónico generado automáticamente enviado por el aplicativo Huella de Carbono.</i> " +
		"</div></div></div>";
				SendMail.SendMailMessage(Asunto, body, Correo.NombreUsuario);
                respuesta = true;
            }
            return await Task.FromResult<bool>(respuesta);
        }

        public Usuario ConsutarUsuario(Usuario oUsuario)
        {
            Model1 entity = new Model1();
            //var desencriptar = SecurityEncode.SecurityEncode.Encriptar(oUsuario.Password);
            //oUsuario.Password = desencriptar;
            var usuario = (from i in entity.Usuario
                           where i.NombreUsuario == oUsuario.NombreUsuario
                           && i.Password == oUsuario.Password
                           select i).FirstOrDefault();
            return usuario;
        }

    }
}
