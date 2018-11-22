(function () {
    var LoginService = function ($http) {
        //Siempre se debe declarar una variable e inicializarla en {} y retornarla
        var service = {};

        service.ConsultarUsuario = function (oUsuario) {
            return $http.post(UrlServices + "Usuario/ConsultarUsuario", oUsuario);
        }


        return service;
    }

    LoginService.$inject = ["$http"];
    // AngularApp.service("nombre del servicio", PersonaService);
    AngularApp.service("LoginService", LoginService);

})()