

namespace HuellaCarbonoWeb.Controllers
{
    using LogicaNegocio.Logica;
    using System;
    using System.Threading;
    using System.Threading.Tasks;
    using System.Web.Http;

    public class UsuarioController: ApiController
    {
        [HttpGet]
        [AllowAnonymous]
        public async Task<Response> IniciarSesion()
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var res = await oUsuario.IniciarSesion();
                var token = TokenGenerator.GenerateTokenJwt("123");

                return new Response
                {
                    success = true,
                    Result = res,
                    Result1 = token
                };

            }
            catch (Exception e)
            {

                return new Response
                {
                    success = false,
                    Message = e.Message
                };

            }
        }

        [HttpPost]
        [Authorize]
        public async Task<Response> Prueba()
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var res = await oUsuario.Prueba();
                //var token = TokenGenerator.GenerateTokenJwt("123");
                var identity = Thread.CurrentPrincipal.Identity;

                return new Response
                {
                    success = true,
                    Result = res,
                   Result1= $" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}"
                };

            }
            catch (Exception e)
            {

                return new Response
                {
                    success = false,
                    Message = e.Message
                };

            }
        }
    }
}