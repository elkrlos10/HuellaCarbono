﻿(function () {
    //var personas = function ($scope, nombre del servicio) {
    var proyectoInt = function ($scope, $rootScope, ProyectoIntService, $cookies, $cookieStore) {
        //console.log($rootScope.idProyectoInt)

        $rootScope.IdProyecto = $cookieStore.get('IdProyectoInt');
        console.log($rootScope.IdProyecto);

        //FASE UNO ESTABLECIMIENTO
        $scope.Establecimiento = {
            IdEstablecimiento: "",
            IdProyeto: "",
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

        $scope.Meses = {
            Mes0: "Tercer Mes",
            Mes1: "Sexto Mes",
            Mes2: "Noveno Mes",
            Mes3: "Doceavo Mes"
        } 

        $scope.Dasometria = [{

            IdDasometria: "",
            Mes: "Tercer Mes",
            IdProyecto:"",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa:""
        },
            {
                IdDasometria:"",
                Mes: "Sexto Mes",
                IdProyecto: "",
                Altura: "",
                Dap: "",
                Perimetro: "",
                Diametro: "",
                Observaciones: "",
                Etapa: ""
            },
            {
                IdDasometria: "",
                Mes: "Noveno Mes",
                IdProyecto: "",
                Altura: "",
                Dap: "",
                Perimetro: "",
                Diametro: "",
                Observaciones: "",
                Etapa: ""
            },
            {
                IdDasometria: "",
                Mes: "Doceavo Mes",
                IdProyecto: "",
                Altura: "",
                Dap: "",
                Perimetro: "",
                Diametro: "",
                Observaciones: "",
                Etapa: ""
            }];
          
        $scope.GuardarEstablecimiento = function () {
            $scope.Establecimiento.IdProyeto = $rootScope.IdProyecto;
            ProyectoIntService.GuardarEstablecimiento($scope.Establecimiento).then(function (response) {
                if (response.data.success) {
                    $scope.Establecimiento = response.data.response;
                    swal(
                        'Buen Trabajo',
                        'La fase establecimiento se ha guardado correctamente',
                        'success'
                    )
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
                    swal(
                        'Buen Trabajo',
                        'Los cambios se ha guardado correctamente',
                        'success'
                    )
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
                    swal(
                        'Buen Trabajo',
                        'Los cambios se ha guardado correctamente',
                        'success'
                    )
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

        $scope.GuardarDasometria = function (Etapa) {
            $.each($scope.Dasometria, function (index, value) {
                $scope.Dasometria[index].Etapa = Etapa;
                $scope.Dasometria[index].IdProyecto = $rootScope.IdProyecto;
            });
            ProyectoIntService.GuardarDasometria($scope.Dasometria).then(function (response) {
                if (response.data.success) {
                   var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        $scope.Dasometria[index] = value;
                            if (index == 0) {
                                $scope.Dasometria[index].Mes = "Tercer Mes"
                            }
                            else if (index == 1)
                            {
                                $scope.Dasometria[index].Mes = "Sexto Mes"
                            }
                            else if (index == 2) {
                                $scope.Dasometria[index].Mes = "Noveno Mes"
                            }
                            else if (index == 3) {
                                $scope.Dasometria[index].Mes = "Doceavo Mes"
                            }
                         
                    });
                    console.log($scope.Dasometria);
                    swal(
                        'Buen Trabajo',
                        'Los cambios en dasometria se ha guardado correctamente',
                        'success'
                    )
                }
            })
        }

        $(document).ready(function(){
            $("#tablaDasometria").validate({
                rules: {
                    altura: {
                        required: true,
                        number: true
                    },
                    dap: {
                        required: true,
                        number: true
                    },
                    perimetro: {
                        required: true,
                        number: true
                    },
                    diametro: {
                        required: true,
                        number: true
                    },
                    observaciones: {
                        required: true,
                        string: true
                    },
                },
                messages: {
                    altura: {
                        required: "El campo es requerido",
                        number: "Deben ser numeros"
                    },
                    dap: {
                        required: "El campo es requerido",
                        number: "Deben ser numeros"
                    },
                    perimetro: {
                        required: "El campo es requerido",
                        number: "Deben ser numeros"
                    },
                    diametro: {
                        required: "El campo es requerido",
                        number: "Deben ser numeros"
                    },
                    observaciones: {
                        required: "El campo es requerido",
                        string: "Bien"
                    },
                }
            });
        });
       
    }
    //inyectar las dependencias que se esta usando
    proyectoInt.$inject = ["$scope", "$rootScope", "ProyectoIntService", "$cookies", "$cookieStore"];
    //para declarar que este es mi controlador
    AngularApp.controller("ProyectoIntController", proyectoInt);

})()