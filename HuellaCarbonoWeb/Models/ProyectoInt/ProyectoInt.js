(function () {
	//var personas = function ($scope, nombre del servicio) {
    var proyectoInt = function ($scope, $rootScope, ProyectoIntService) {
        //console.log($rootScope.idProyectoInt)
        $scope.Establecimiento = {
            IdEstablecimiento:"",
            IdProyeto: $rootScope.idProyectoInt,
            Preparacion: "",
            Roceria: "",
            Trazado: "",
            Plateo: "",
            Transporte: "",
            Plantacion: "",
            Fertilizacion: "",
            Replantes: "",
		    Cercos: ""
        }

        $scope.GuardarEstablecimiento = function () {
            ProyectoIntService.GuardarEstablecimiento($scope.Establecimiento).then(function (response) {
                if (response.data.success) {
                    $scope.Establecimiento = response.data.response;
                    alert("Guardó Correctamente");
                }
            })
        }

        ProyectoIntService.ConsultarEstablecimiento($scope.Establecimiento).then(function (response) {
            if (response.data.success) {
                $scope.Establecimiento = response.data.response;
            }
        })

        
    }
	//inyectar las dependencias que se esta usando
    proyectoInt.$inject = ["$scope", "$rootScope","ProyectoIntService"];
	//para declarar que este es mi controlador
    AngularApp.controller("ProyectoIntController", proyectoInt);

})()