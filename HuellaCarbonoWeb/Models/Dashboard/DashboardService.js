
(function () {
    var DashboardService = function ($http) {
        //Siempre se debe declarar una variable e inicializarla en {} y retornarla
        var service = {};

        service.ProyectosDashboard = function () {
            return $http.post(UrlServices + "Proyecto/ProyectosDashboard");
        }

        service.DatosEmpresa = function (item) {
            return $http.post(UrlServices + "Proyecto/DatosEmpresa", item);
        }

        service.CambiarEstadoProyecto = function (item) {
            return $http.post(UrlServices + "Proyecto/CambiarEstadoProyecto", item);
        }



        return service;
    }

    DashboardService.$inject = ["$http"];
    // AngularApp.service("nombre del servicio", PersonaService);
    AngularApp.service("DashboardService", DashboardService);

})()