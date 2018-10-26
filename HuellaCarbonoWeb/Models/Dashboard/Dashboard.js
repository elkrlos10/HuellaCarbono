//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
    var dashboard = function ($scope, DashboardService, $location) {
		$scope.value = 67;
		$scope.options = {
			size: 250,
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

		$scope.value2 = 5;
		$scope.options2 = {
			size: 250,
			barColor: '#82A20D',
			trackColor: '#182430',
			trackWidth: 15,
			barWidth: 23,
			subText: {
				enabled: true,
				text: 'Terminados'
			},
			readOnly: true,
			animate: {
				enabled: true,
				duration: 1000,
				ease: 'bounce'
			}
		}

		$scope.value3 = 10;
		$scope.options3 = {
			size: 250,
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

		$scope.value4 = 50;
		$scope.options4 = {
			size: 250,
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

        DashboardService.ProyectosDashboard().then(function (response) {
            if (response.data.success) {
                $scope.Listar = response.data.response;
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
                   // DashboardService.ProyectosDashboard();
                }
            });

            
        }


	}
	//inyectar las dependencias que se esta usando
    dashboard.$inject = ["$scope", "DashboardService", "$location"];
	//para declarar que este es mi controlador
	AngularApp.controller("DashboardController", dashboard);

})()