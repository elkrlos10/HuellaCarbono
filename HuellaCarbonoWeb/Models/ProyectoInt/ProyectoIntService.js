(function () {
    var ProyectoIntService = function ($http) {
        //Siempre se debe declarar una variable e inicializarla en {} y retornarla
        var service = {};
        
        service.GuardarEstablecimiento = function (item) {
            return $http.post(UrlServices + "Proyecto/GuardarEstablecimiento", item);
        }

        service.ConsultarEstablecimiento = function (item) {
            return $http.post(UrlServices + "Proyecto/ConsultarEstablecimiento", item);
        }

        return service;
    }

    ProyectoIntService.$inject = ["$http"];
    // AngularApp.service("nombre del servicio", PersonaService);
    AngularApp.service("ProyectoIntService", ProyectoIntService);

})()