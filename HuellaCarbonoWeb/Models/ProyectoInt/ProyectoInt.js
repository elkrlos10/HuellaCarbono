(function () {
	//var personas = function ($scope, nombre del servicio) {
    var proyectoInt = function ($scope, $rootScope, ProyectoIntService, $cookies, $cookieStore) {
        //console.log($rootScope.idProyectoInt)

        $rootScope.IdProyecto = $cookieStore.get('IdProyectoInt');
        console.log($rootScope.IdProyecto);

        $scope.Establecimiento = {
            IdEstablecimiento:"",
            IdProyeto:"",
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

        $scope.Mantenimiento2 = {
            IdMantenimiento2: "",
            IdProyecto:"",
            Planteos: "",
            Fertilizacion: "",
            Podas: "",
            Plagas: "",
            Enfermedades: "",
            Malezas: "",
            Caminos: "",
            Cercos: "",
            Incendios: "",
            Etapa: ""
        }

        $scope.GuardarEstablecimiento = function () {
            $scope.Establecimiento.IdProyeto = $rootScope.IdProyecto;
            ProyectoIntService.GuardarEstablecimiento($scope.Establecimiento).then(function (response) {
                if (response.data.success) {
                    $scope.Establecimiento = response.data.response;
                    alert("Guardó Correctamente");
                }
            })
        }

        ProyectoIntService.ConsultarEstablecimiento($scope.Establecimiento).then(function (response) {
            $scope.Establecimiento.IdProyeto = $rootScope.IdProyecto;
            if (response.data.success) {
                $scope.Establecimiento = response.data.response;
            }
        })

        $scope.GuardarMantenimiento2 = function () {
            $scope.Mantenimiento2.IdProyecto = $rootScope.IdProyecto;
            $scope.Mantenimiento2.Etapa = 2;
            ProyectoIntService.GuardarMantenimiento2($scope.Mantenimiento2).then(function (response) {
                if (response.data.success) {
                    $scope.Mantenimiento2 = response.data.response;
                    alert("Guardó Correctamente");
                }
            })
        }

        $scope.ConsultarMantenimiento2 = function () {
            $scope.Mantenimiento2.IdProyecto = $rootScope.IdProyecto;
            ProyectoIntService.ConsultarMantenimiento2($scope.Mantenimiento2).then(function (response) {
                if (response.data.success) {
                    $scope.Mantenimiento2 = response.data.response;
                }
            })
        }

        
    }
	//inyectar las dependencias que se esta usando
    proyectoInt.$inject = ["$scope", "$rootScope", "ProyectoIntService", "$cookies","$cookieStore" ];
	//para declarar que este es mi controlador
    AngularApp.controller("ProyectoIntController", proyectoInt);

})()