

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
        [HttpGet]
       
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

        [HttpPost]
        public async Task<bool> RegistarEmpresa(EmpresaDTO oEmpresa)
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var res = await oUsuario.RegistarEmpresa(oEmpresa);

                return res;

            }
            catch (Exception e)
            {

                return false;

            }
        }
    }
}