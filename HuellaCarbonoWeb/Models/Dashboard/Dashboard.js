﻿//controlador angular de personas
(function () {
	//var personas = function ($scope, nombre del servicio) {
    var dashboard = function ($scope, DashboardService, $location, $rootScope, $cookies) {

        setTimeout(function () { 
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
        }, 1000);

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
                    console.log($scope.Listar)
                }
            });
        }

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
                    text: 'En Proceso'
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
        setInterval(function () {
            DashboardService.ProyectosDashboard().then(function (response) {
                if (response.data.success) {

                    $scope.value4 = response.data.Lista.length;
                    $scope.value = $scope.value2 + $scope.value3 + $scope.value4;
                }
            })
            }, 1000)



        $scope.notificacionesMostrar = false;
        $scope.mostrarNotificaciones = function () {
            if ($scope.notificacionesMostrar == false) {
                $scope.value4 = 0;
                $scope.notificacionesMostrar = true;
            }
            else {
                $scope.value4 = $scope.value4;

                $scope.notificacionesMostrar = false;
            }

        }

        $scope.CapIdInt = function (idDetalleHuella) {
            $rootScope.IdDetalleHuella = idDetalleHuella;
            $cookies.putObject("IdDetalleHuella", $rootScope.IdDetalleHuella);
            $location.url("ProyectoInt");
            $rootScope.Id = $cookieStore.get('IdDetalleHuella');
        }

        //$scope.Filter = function (e) {

        //    //var rex = new RegExp($(e.target).val(), 'i');
        //    //$('.searchable tr').hide();
        //    //$('.searchable tr').filter(function () {
        //    //    return rex.test($(this).text());
        //    //}).show();

        //    var Lista = $scope.Listar
        //    var Busqueda = $("#Buscar").val();
        //    var exp = new RegExp(Busqueda);
        //    if (Busqueda == "") {
        //        $scope.Listar = Lista;
        //    }
        //    var Proyectos = [];
        //    //$scope.datalists = $scope.ListaCompleta;
        //    Proyectos = $scope.Listar.filter(function (item) {


        //        if (exp.test(item.IdDetalle) {

        //            return item;
        //        }

        //        //else if (exp.test(item.Parametro4.toLowerCase()) || exp.test(item.Parametro4.toUpperCase())) {
        //        //    return item;
        //        //}

        //        //else if (exp.test(item.Parametro2.toLowerCase()) || exp.test(item.Parametro2.toUpperCase())) {
        //        //    return item;
        //        //}
        //    });

        //    $scope.Listar = Proyectos;
        //    ////Variable para setear la paginación 
        //    //$scope.curPage = 0;

        //};
	}
	//inyectar las dependencias que se esta usando
    dashboard.$inject = ["$scope", "DashboardService", "$location", "$rootScope" ,"$cookies"];
	//para declarar que este es mi controlador
    AngularApp.controller("DashboardController", dashboard);

})()