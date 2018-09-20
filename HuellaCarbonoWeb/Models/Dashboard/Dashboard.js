//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
	var dashboard = function ($scope) {
		$scope.value = 30;
		$scope.options = {
			bgColor: '#2C3E50',
			trackWidth: 50,
			barWidth: 30,
			barColor: '#FFAE1A',
			textColor: 'white',
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
			bgColor: '#2C3E50',
			trackWidth: 50,
			barWidth: 30,
			barColor: '#FFAE1A',
			textColor: 'white',
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
			bgColor: '#2C3E50',
			trackWidth: 50,
			barWidth: 30,
			barColor: '#FFAE1A',
			textColor: 'white',
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
	}
	//inyectar las dependencias que se esta usando
	dashboard.$inject = ["$scope"];
	//para declarar que este es mi controlador
	AngularApp.controller("DashboardController", dashboard);

})()