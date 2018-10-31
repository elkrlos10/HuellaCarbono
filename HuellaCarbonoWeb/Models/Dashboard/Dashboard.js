//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
    var dashboard = function ($scope, DashboardService, $location, $rootScope) {
        $rootScope.value;
        $scope.hol;
        DashboardService.ProyectosDashboard().then(function (response) {
            if (response.data.success) {
                $scope.Listar = response.data.Lista;
                //Valores de los Circulos 
                debugger;
                $scope.value4 = response.data.Lista.length;
                $scope.value3 = response.data.Cancelados;
                $scope.value2 = response.data.EnProceso;   
                $rootScope.value = $scope.value2 + $scope.value3 + $scope.value4;  
                $scope.hol = $scope.value2 + $scope.value3 + $scope.value4;  
            }
        });
          
        $scope.CapIdEmpresa = function (idEmpresa, IdProyecto) {
            $scope.IdProyecto = IdProyecto;
            item = {
                Paramatro1: idEmpresa.toString()
            }

            DashboardService.DatosEmpresa(item).then(function (response) {
                if (response.data.success) {
                    $scope.Empresa = response.data.response;
                    console.log($scope.Empresa)
                }
            });
        }

        $scope.CambiarEstadoProyecto = function (estado) {
            item = {
                Paramatro1: $scope.IdProyecto.toString(),
                Paramatro2: estado.toString()
            }

            DashboardService.CambiarEstadoProyecto(item).then(function (response) {
                if (response.data.success) {
                    $("#exampleModal").modal("hide");

                    //Actualizar la tabla
                    DashboardService.ProyectosDashboard().then(function (response) {
                        if (response.data.success) {
                            $scope.Listar = response.data.Lista;

                            //Valores de los Circulos 
                            $scope.value4 = response.data.Lista.length;
                            $scope.value3 = response.data.Cancelados;
                            $scope.value2 = response.data.EnProceso;
                            $scope.value = $scope.value2 + $scope.value3 + $scope.value4;
                        }
                    });
                }
            });
        }
        
        $scope.FiltroProyectos = function (estado) {
            if (estado == null) {
                item = {
                    Paramatro1: null
                }
            }
            else {
            item = {
                Paramatro1: estado.toString()
                }
            }

            DashboardService.FiltroProyectos(item).then(function (response) {
                if (response.data.success) {
                    $scope.Listar = response.data.response;
                }
            });
        }  
        $rootScope.value = 4;
        $scope.hol;
        $scope.options = {
            size: 200,
            barColor: '#82A20D',
            trackColor: '#182430',
            trackWidth: 15,
            barWidth: 23,
            subText: {
                enabled: true,
                text: 'Total Proyectos'
            },
            readOnly: true,
            animate: {
                enabled: true,
                duration: 1000,
                ease: 'bounce'
            }
        }
        $scope.options2 = {
            size: 200,
            barColor: '#82A20D',
            trackColor: '#182430',
            trackWidth: 15,
            barWidth: 23,
            subText: {
                enabled: true,
                text: 'En proceso'
            },
            readOnly: true,
            animate: {
                enabled: true,
                duration: 1000,
                ease: 'bounce'
            }
        }
        $scope.options3 = {
            size: 200,
            barColor: '#82A20D',
            trackColor: '#182430',
            trackWidth: 15,
            barWidth: 23,
            subText: {
                enabled: true,
                text: 'Cancelados'
            },
            readOnly: true,
            animate: {
                enabled: true,
                duration: 1000,
                ease: 'bounce'
            }
        }
        $scope.options4 = {
            size: 200,
            barColor: '#82A20D',
            trackColor: '#182430',
            trackWidth: 15,
            barWidth: 23,
            subText: {
                enabled: true,
                text: 'Pendientes'
            },
            readOnly: true,
            animate: {
                enabled: true,
                duration: 1000,
                ease: 'bounce'
            }
        }

        //Notificaciones
        $scope.notificacionesMostrar = false;
        $scope.mostrarNotificaciones = function () {
            if ($scope.notificacionesMostrar == false) {
                $(".notificacionesCont").css(
                    "display", "block"
                )
                $scope.notificacionesMostrar = true;
            }
            else {
                $(".notificacionesCont").css(
                    "display", "none"
                )
                $scope.notificacionesMostrar = false;
            }

        }
	}
	//inyectar las dependencias que se esta usando
    dashboard.$inject = ["$scope", "DashboardService", "$location", "$rootScope"];
	//para declarar que este es mi controlador
	AngularApp.controller("DashboardController", dashboard);

})()