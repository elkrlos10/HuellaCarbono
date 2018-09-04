

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

                return false;

            }
        }

        [HttpPost]
        public async Task<Proyecto> CrearProyecto(Proyecto oProyecto)
        {
            try
            {
                UsuarioBl oUsuario = new UsuarioBl();
                var response = await oUsuario.CrearProyecto(oProyecto);

                return response;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}