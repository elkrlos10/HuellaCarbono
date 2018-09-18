//servicio para conectar con los apis

(function () {
    var EncuestaService = function ($http) {
        //Siempre se debe declarar una variable e inicializarla en {} y retornarla
        var service = {};

        service.RegistarEncuesta = function (objEncuesta) {
            return $http.post(UrlServices + "Encuestas/RegistarEncuesta", objEncuesta);
        }



        return service;
    }

    EncuestaService.$inject = ["$http"];
    // AngularApp.service("nombre del servicio", PersonaService);
    AngularApp.service("EncuestaService", EncuestaService);

})()