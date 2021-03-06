﻿

namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using Modelo.Datos;
    using Modelo.DTO;
    using System;
    using System.Threading;
    using System.Threading.Tasks;
    using System.Web.Http;

    public class UsuarioController: ApiController
    {
        [HttpPost]
        public async Task<UsuarioDTO> IniciarSesion(UsuarioDTO oUser)
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var response = await oUsuario.IniciarSesion(oUser);
                var token = TokenGenerator.GenerateTokenJwt("123");

                return response;

            }
            catch (Exception e)
            {
                return null;
            }
        }

        [HttpPost]
        public async Task<bool> RegistarEmpresa(EmpresaDTO oEmpresa)
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var response = await oUsuario.RegistarEmpresa(oEmpresa);

                return response;

            }
            catch (Exception e)
            {
                throw;
            }
        }

        [HttpPost]
        public async Task<Usuario> RegistarEmpresa1()
        {
            try
            {
                UsuarioBl oUsuarioBl = new UsuarioBl();
                var response = await oUsuarioBl.ConsultarUsuario();

                return response;

            }
            catch (Exception e)
            {

                return null;

            }
        }

        [HttpPost]
        public async Task<bool> RecuperarContrasena(UsuarioDTO oUser)
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var response = await oUsuario.RecuperarContrasena(oUser);

                return response;

            }
            catch (Exception e)
            {
                throw;
            }
        }

        [HttpPost]
        public IHttpActionResult ConsultarUsuario(Usuario oUsuario)
        {
            try
            {
                UsuarioBl oUsuarioBl = new UsuarioBl();
                var usuario = oUsuarioBl.ConsutarUsuario(oUsuario);

                if (usuario == null)
                {
                    return Ok(new { user = false });
                }
                else
                {
                    return Ok(new { user = true,  usuario });
                }

            }
            catch (Exception e)
            {

                return Ok(new { success = false });
            }

        }

    }
}