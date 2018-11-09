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

        service.GuardarMantenimiento2 = function (item) {
            return $http.post(UrlServices + "Proyecto/GuardarMantenimiento2", item);
        }

        service.ConsultarMantenimiento2 = function (item) {
            return $http.post(UrlServices + "Proyecto/ConsultarMantenimiento2", item);
        }

        service.ConsultarMantenimiento3 = function (item) {
            return $http.post(UrlServices + "Proyecto/ConsultarMantenimiento3", item);
        }

        service.GuardarMantenimiento3 = function (item) {
            return $http.post(UrlServices + "Proyecto/GuardarMantenimiento3", item);
        }

        service.GuardarDasometria = function (item) {
            return $http.post(UrlServices + "Proyecto/GuardarDasometria", item);
        }
        service.ConsultarDasometria = function (item) {
            return $http.post(UrlServices + "Proyecto/ConsultarDasometria", item);
        }
        return service;
    }

    ProyectoIntService.$inject = ["$http"];
    // AngularApp.service("nombre del servicio", PersonaService);
    AngularApp.service("ProyectoIntService", ProyectoIntService);

})()