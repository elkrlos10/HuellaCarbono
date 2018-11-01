(function () {
	//var personas = function ($scope, nombre del servicio) {
    var proyectoInt = function ($scope, $rootScope, ProyectoIntService, $cookies, $cookieStore) {
        //console.log($rootScope.idProyectoInt)

        $rootScope.IdProyecto = $cookieStore.get('IdProyectoInt');
        console.log($rootScope.IdProyecto);

        //FASE UNO ESTABLECIMIENTO
        $scope.Establecimiento = {
            IdEstablecimiento:"",
            IdProyeto:"",
            Preparacion:"",
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

        $scope.Mantenimiento3 = {
            IdMantenimiento2: "",
            IdProyecto: "",
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

        $scope.Mantenimiento4 = {
            IdMantenimiento3: "",
            IdProyecto: "",
            Planteos: "",
            Fertilizacion: "",
            Plagas: "",
            Caminos: "",
            Cercos: "",
            Incendios: "",
            Raleo: "",
            Etapa: ""
        }

        $scope.Mantenimiento5 = {
            IdMantenimiento3: "",
            IdProyecto: "",
            Planteos: "",
            Fertilizacion: "",
            Plagas: "",
            Caminos: "",
            Cercos: "",
            Incendios: "",
            Raleo: "",
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

        $scope.Establecimiento.IdProyeto = $rootScope.IdProyecto;
        ProyectoIntService.ConsultarEstablecimiento($scope.Establecimiento).then(function (response) {
            
            if (response.data.success) {
                $scope.Establecimiento = response.data.response;
            }
        })

        $scope.GuardarMantenimiento2 = function (Etapa) {
            if (Etapa == 2) {
                $scope.Objeto = $scope.Mantenimiento2;
            }
            else {
                $scope.Objeto = $scope.Mantenimiento3;
            }

            $scope.Objeto.IdProyecto = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            ProyectoIntService.GuardarMantenimiento2($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (response.data.response.Etapa == 2) {
                        $scope.Mantenimiento2 = response.data.response;
                    }
                    else {
                        $scope.Mantenimiento3 = response.data.response;
                    }
                    alert("Guardó Correctamente");
                }
            })
        }

        $scope.ConsultarMantenimiento2 = function (Etapa) {
            if (Etapa == 2) {
                $scope.Objeto = $scope.Mantenimiento2;
            }
            else {
                $scope.Objeto = $scope.Mantenimiento3;
            }
            $scope.Objeto.IdProyecto = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            ProyectoIntService.ConsultarMantenimiento2($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (response.data.response.Etapa == 2) {
                        $scope.Mantenimiento2 = response.data.response;
                    }
                    else {
                        $scope.Mantenimiento3 = response.data.response;
                    }
                }
            })
        }

        $scope.GuardarMantenimiento3 = function (Etapa) {
            if (Etapa == 4) {
                $scope.Objeto = $scope.Mantenimiento4;
            }
            else {
                $scope.Objeto = $scope.Mantenimiento5;
            }

            $scope.Objeto.IdProyecto = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            ProyectoIntService.GuardarMantenimiento3($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (response.data.response.Etapa == 4) {
                        $scope.Mantenimiento4 = response.data.response;
                    }
                    else {
                        $scope.Mantenimiento5 = response.data.response;
                    }
                    alert("Guardó Correctamente");
                }
            })
        }

        $scope.ConsultarMantenimiento3 = function (Etapa) {
            if (Etapa == 4) {
                $scope.Objeto = $scope.Mantenimiento4;
            }
            else {
                $scope.Objeto = $scope.Mantenimiento5;
            }
            $scope.Objeto.IdProyecto = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            ProyectoIntService.ConsultarMantenimiento3($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (response.data.response.Etapa == 4) {
                        $scope.Mantenimiento4 = response.data.response;
                    }
                    else {
                        $scope.Mantenimiento5 = response.data.response;
                    }
                }
            })
        }

        
    }
	//inyectar las dependencias que se esta usando
    proyectoInt.$inject = ["$scope", "$rootScope", "ProyectoIntService", "$cookies","$cookieStore" ];
	//para declarar que este es mi controlador
    AngularApp.controller("ProyectoIntController", proyectoInt);

})()