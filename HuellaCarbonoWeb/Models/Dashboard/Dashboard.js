//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
    var dashboard = function ($scope, DashboardService, $location) {

       
        DashboardService.ProyectosDashboard().then(function (response) {
            if (response.data.success) {
                $scope.Listar = response.data.response;
                $scope.TotalProyecto = $scope.Listar.length;
                $scope.value4 = $scope.TotalProyecto;
                console.log();

                //$scope.FiltroProyectos(false)
                //$scope.value3 = $scope.Listar.length;
                //$scope.FiltroProyectos(true)
                //$scope.value2 = $scope.Listar.length;

            }
        });



       // $scope.value = $scope.TotalProyecto;
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
		//$scope.value3 = 10;
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
        //$scope.value4 = $scope.TotalProyecto;
		$scope.options4 = {
			size:200,
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
                   DashboardService.ProyectosDashboard();
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


	}
	//inyectar las dependencias que se esta usando
    dashboard.$inject = ["$scope", "DashboardService", "$location"];
	//para declarar que este es mi controlador
	AngularApp.controller("DashboardController", dashboard);

})()