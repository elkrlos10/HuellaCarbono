

namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using Modelo.Datos;
    using System;
    using System.Threading;
    using System.Threading.Tasks;
    using System.Web.Http;

    public class UsuarioController: ApiController
    {
        [HttpPost]
       
        public async Task<Response> IniciarSesion()
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var res = await oUsuario.IniciarSesion();
                var token = TokenGenerator.GenerateTokenJwt("123");

                return new Response
                {
                    IsSuccess = true,
                    Result = res,
                    Result1 = token
                };

            }
            catch (Exception e)
            {

                return new Response
                {
                    IsSuccess = false,
                    Message = e.Message
                };

            }
        }

        [HttpGet]
        public async Task<Usuario> Prueba()
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var res = await oUsuario.Prueba();


                return (res);

            }
            catch (Exception e)
            {

                return null;
                //{
                //    IsSuccess = false,
                //    Message = e.Message
                //};

            }
        }
    }
}