(function () {
    //var personas = function ($scope, nombre del servicio) {
    var proyectoInt = function ($scope, $rootScope, ProyectoIntService, $location, $cookies, $cookieStore) {
        //console.log($rootScope.idProyectoInt)

        $rootScope.IdProyecto = $cookieStore.get('IdDetalleHuella');
        $rootScope.Id = undefined;

        //FASE UNO ESTABLECIMIENTO
        $scope.Establecimiento = {
            IdEstablecimiento: "",
            IdDetalleHuella: "",
            Preparacion: "",
            Roceria: "",
            Trazado: "",
            Plateo: "",
            Transporte: "",
            Plantacion: "",
            Fertilizacion: "",
            Replantes: "",
            Cercos: "",
        }

        $scope.Mantenimiento2 = {
            IdMantenimiento2: "",
            IdDetalleHuella: "",
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

        //FASE 2

        $scope.Dasometria1 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria2 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria3 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria4 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        //fase 3

        $scope.Dasometria5 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria6 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria7 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria8 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        //FASE 4

        $scope.Dasometria9 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria10 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria11 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria12 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        //FASE 5

        $scope.Dasometria13 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria14 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria15 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }

        $scope.Dasometria16 = {
            IdDasometria: "",
            IdDetalleHuella: "",
            Altura: "",
            Dap: "",
            Perimetro: "",
            Diametro: "",
            Observaciones: "",
            Etapa: ""
        }


        $scope.GuardarEstablecimiento = function () {
            $scope.Establecimiento.IdDetalleHuella = $rootScope.IdProyecto;
            swal({
                title: 'Está seguro',
                text: "Desea guardar los cambios en mantenimiento",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.value) {
                    ProyectoIntService.GuardarEstablecimiento($scope.Establecimiento).then(function (response) {
                        if (response.data.success) {
                            $scope.Establecimiento = response.data.response;
                            swal(
                                'Buen trabajo',
                                'La fase establecimiento se ha guardado correctamente',
                                'success'
                            )
                            $scope.ConsultarPorcentaje()
                        }
                        $scope.posicion = 0;
                        for (const prop in $scope.Establecimiento) {
                            if ($scope.Establecimiento[prop] == true) {
                                $("#" + prop).attr("disabled", true);
                                $scope.posicion++;
                                if ($scope.posicion == 9) {
                                    $("#btnGuardar1").attr("disabled", true);
                                    $("#btnGuardar1").removeClass("btnFases");
                                    $("#btnGuardar1").addClass("btnFases2");
                                }
                            }
                        }

                    })
                } else {
                    swal(
                        'Listo',
                        'No se han guardado los cambios',
                        'success'
                    )
                }
            })
        }

        $scope.Establecimiento.IdDetalleHuella = $rootScope.IdProyecto;

        $scope.posicion = 0;

        ProyectoIntService.ConsultarEstablecimiento($scope.Establecimiento).then(function (response) {
            if (response.data.success) {
                $scope.Establecimiento = response.data.response;
                for (const prop in $scope.Establecimiento) {
                    if ($scope.Establecimiento[prop] == true) {
                        $("#" + prop).prop("disabled", true);
                        $scope.posicion++;

                        if ($scope.posicion == 9) {
                            $("#btnGuardar1").attr("disabled", true);
                            $("#btnGuardar1").removeClass("btnFases");
                            $("#btnGuardar1").addClass("btnFases2");
                        }
                    }
                }
            }
        })

        $("#Mantenimiento1").addClass("disabled");
        $("#Mantenimiento2").addClass("disabled");
        $("#Mantenimiento3").addClass("disabled");
        $("#Mantenimiento4").addClass("disabled");

        for (var i = 0; i < 4; i++) {
            if ($("#Mantenimiento" + (i + 1)).hasClass('disabled')) {
                $("#Mantenimiento" + (i + 1)).css({
                    color: "#dadada",
                    background: "transparent",
                    cursor: "no-drop"
                })
            }
        }

        $scope.ConsultarEstablecimiento = function () {
            $scope.Establecimiento.IdProyeto = $rootScope.IdProyecto;
            $scope.posicion = 0;
            ProyectoIntService.ConsultarEstablecimiento($scope.Establecimiento).then(function (response) {
                if (response.data.success) {
                    $scope.Establecimiento = response.data.response;
                    for (const prop in $scope.Establecimiento) {
                        if ($scope.Establecimiento[prop] == true) {
                            $("#" + prop).prop("disabled", true);
                            $scope.posicion++;
                            if ($scope.posicion == 9) {
                                $("#btnGuardar1").attr("disabled", true);
                                $("#btnGuardar1").removeClass("btnFases");
                                $("#btnGuardar1").addClass("btnFases2");
                            }
                        }
                    }

                }
            })
        }

        $scope.GuardarMantenimiento2 = function (Etapa) {
            var Id = "";
            if (Etapa == 2) {
                $scope.Objeto = $scope.Mantenimiento2;
                Id = "Mantenimiento1";
            }
            else {
                $scope.Objeto = $scope.Mantenimiento3;
                Id = "mantenimiento2Btn";
            }
            $scope.Etapa = Etapa;
            $scope.Objeto.IdDetalleHuella = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            $scope.posicionMantenimiento = 0;
            $scope.posicionMantenimiento2 = 0;

            ProyectoIntService.GuardarMantenimiento2($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (response.data.response.Etapa == 2) {
                        $scope.Mantenimiento2 = response.data.response;
                        for (const prop in $scope.Mantenimiento2) {
                            if ($scope.Mantenimiento2[prop] == true) {
                                $("#" + prop + "2").prop("disabled", true);
                                $scope.posicionMantenimiento++;

                                if ($scope.posicionMantenimiento == 9) {
                                    $("#btnGuardar2").attr("disabled", true);
                                    $("#btnGuardar2").removeClass("btnFases");
                                    $("#btnGuardar2").addClass("btnFases2");
                                }
                            }
                        }
                        $scope.ConsultarPorcentaje()

                    }
                    else {
                        $scope.Mantenimiento3 = response.data.response;
                        for (const prop in $scope.Mantenimiento3) {
                            if ($scope.Mantenimiento3[prop] == true) {
                                $("#" + prop + "3").prop("disabled", true);
                                $scope.posicionMantenimiento2++;

                                if ($scope.posicionMantenimiento2 == 9) {
                                    $("#btnGuardar3").attr("disabled", true);
                                    $("#btnGuardar3").removeClass("btnFases");
                                    $("#btnGuardar3").addClass("btnFases2");
                                }
                            }
                        }
                        $scope.ConsultarPorcentaje()
                    }
                    swal(
                        'Buen trabajo',
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

            $scope.Objeto.IdDetalleHuella = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            $scope.posicionMantenimiento = 0;
            $scope.posicionMantenimiento2 = 0;

            ProyectoIntService.ConsultarMantenimiento2($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (Etapa == 2) {
                        $scope.ConsultarDasometria(Etapa)
                    } else {
                        $scope.ConsultarDasometria2(Etapa)
                    }

                    if (response.data.response.Etapa == 2) {
                        $scope.Mantenimiento2 = response.data.response;
                        for (const prop in $scope.Mantenimiento2) {
                            if ($scope.Mantenimiento2[prop] == true) {
                                $("#" + prop + "2").prop("disabled", true);
                                $scope.posicionMantenimiento++;

                                if ($scope.posicionMantenimiento == 9) {
                                    $("#btnGuardar2").attr("disabled", true);
                                    $("#btnGuardar2").removeClass("btnFases");
                                    $("#btnGuardar2").addClass("btnFases2");
                                }
                            }

                        }
                    }

                    else {
                        $scope.Mantenimiento3 = response.data.response;
                        for (const prop in $scope.Mantenimiento3) {
                            if ($scope.Mantenimiento3[prop] == true) {
                                $("#" + prop + "3").prop("disabled", true);
                                $scope.posicionMantenimiento2++;

                                if ($scope.posicionMantenimiento2 == 9) {
                                    $("#btnGuardar3").attr("disabled", true);
                                    $("#btnGuardar3").removeClass("btnFases");
                                    $("#btnGuardar3").addClass("btnFases2");
                                }
                            }
                        }
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

            $scope.Objeto.IdDetalleHuella = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            $scope.posicionMantenimiento3 = 0;
            $scope.posicionMantenimiento4 = 0;

            ProyectoIntService.GuardarMantenimiento3($scope.Objeto).then(function (response) {
                if (response.data.success) {

                    if (response.data.response.Etapa == 4) {
                        $scope.Mantenimiento4 = response.data.response;

                        for (const prop in $scope.Mantenimiento4) {
                            if ($scope.Mantenimiento4[prop] == true) {
                                $("#" + prop + "4").prop("disabled", true);
                                $scope.posicionMantenimiento3++;
                                if ($scope.posicionMantenimiento3 == 7) {
                                    $("#btnGuardar4").attr("disabled", true);
                                    $("#btnGuardar4").removeClass("btnFases");
                                    $("#btnGuardar4").addClass("btnFases2");
                                }

                            }
                        }
                        $scope.ConsultarPorcentaje()

                    }
                    else {
                        $scope.Mantenimiento5 = response.data.response;
                        for (const prop in $scope.Mantenimiento5) {
                            if ($scope.Mantenimiento5[prop] == true) {
                                $("#" + prop + "5").prop("disabled", true);
                                $scope.posicionMantenimiento4++;
                                if ($scope.posicionMantenimiento4 == 7) {
                                    $("#btnGuardar5").attr("disabled", true);
                                    $("#btnGuardar5").removeClass("btnFases");
                                    $("#btnGuardar5").addClass("btnFases2");
                                }
                            }
                        }
                        $scope.ConsultarPorcentaje()

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
            $scope.Objeto.IdDetalleHuella = $rootScope.IdProyecto;
            $scope.Objeto.Etapa = Etapa;
            $scope.posicionMantenimiento3 = 0;
            $scope.posicionMantenimiento4 = 0;
            ProyectoIntService.ConsultarMantenimiento3($scope.Objeto).then(function (response) {
                if (response.data.success) {
                    if (Etapa == 4) {
                        $scope.ConsultarDasometria3(Etapa)
                    } else {
                        $scope.ConsultarDasometria4(Etapa)
                    }
                    if (response.data.response.Etapa == 4) {
                        $scope.Mantenimiento4 = response.data.response;
                        for (const prop in $scope.Mantenimiento4) {
                            if ($scope.Mantenimiento4[prop] == true) {
                                $("#" + prop + "4").prop("disabled", true);
                                $scope.posicionMantenimiento3++;
                                if ($scope.posicionMantenimiento3 == 7) {
                                    $("#btnGuardar4").attr("disabled", true);
                                    $("#btnGuardar4").removeClass("btnFases");
                                    $("#btnGuardar4").addClass("btnFases2");
                                }
                            }
                        }

                    }
                    else {
                        $scope.Mantenimiento5 = response.data.response;
                        for (const prop in $scope.Mantenimiento5) {
                            if ($scope.Mantenimiento5[prop] == true) {
                                $("#" + prop + "5").prop("disabled", true);
                                $scope.posicionMantenimiento4++;
                                if ($scope.posicionMantenimiento4 == 7) {
                                    $("#btnGuardar5").attr("disabled", true);
                                    $("#btnGuardar5").removeClass("btnFases");
                                    $("#btnGuardar5").addClass("btnFases2");
                                }
                            }
                        }

                    }
                }
            })
        }

        //.menu li a
        $("#sextoMes td div input , #sextoMes td div textarea").attr("disabled", true);
        $("#novenoMes td div input , #novenoMes td div textarea").attr("disabled", true);
        $("#doceavoMes td div input , #doceavoMes td div textarea").attr("disabled", true);

        $("#sextoMes2 td div input , #sextoMes2 td div textarea").attr("disabled", true);
        $("#novenoMes2 td div input , #novenoMes2 td div textarea").attr("disabled", true);
        $("#doceavoMes2 td div input , #doceavoMes2 td div textarea").attr("disabled", true);

        $("#sextoMes3 td div input , #sextoMes3 td div textarea").attr("disabled", true);
        $("#novenoMes3 td div input , #novenoMes3 td div textarea").attr("disabled", true);
        $("#doceavoMes3 td div input , #doceavoMes3 td div textarea").attr("disabled", true);

        $("#sextoMes4 td div input , #sextoMes4 td div textarea").attr("disabled", true);
        $("#novenoMes4 td div input , #novenoMes4 td div textarea").attr("disabled", true);
        $("#doceavoMes4 td div input , #doceavoMes4 td div textarea").attr("disabled", true);

        $scope.GuardarDasometria = function (Etapa, form) {
            var numDasometria = 0;
            swal({
                title: 'Está seguro',
                text: "Desea guardar los cambios en dasometría",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, guardar',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.value) {
                    if (!$("#tercerMes td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria1;
                    }

                    if (!$("#sextoMes td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria2;
                    }

                    if (!$("#novenoMes td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria3;
                    }

                    if (!$("#doceavoMes td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria4;
                    }


                    if ($scope.ValidacionesDasometria($scope.objeto)) {
                        return;
                    }

                    $scope.objeto.Etapa = Etapa;
                    $scope.objeto.IdDetalleHuella = $rootScope.IdProyecto;

                    ProyectoIntService.GuardarDasometria($scope.objeto).then(function (response) {
                        if (response.data.success) {
                            var DasometriaValue = response.data.response;
                            $.each(DasometriaValue, function (index, value) {
                                if (index == 0) {
                                    $scope.Dasometria1 = value;
                                    $("#tercerMes td div input , #tercerMes td div textarea").attr("disabled", true);
                                    $("#sextoMes td div input , #sextoMes td div textarea").attr("disabled", false);
                                }
                                else if (index == 1) {
                                    $scope.Dasometria2 = value;
                                    $("#sextoMes td div input , #sextoMes td div textarea").attr("disabled", true);
                                    $("#novenoMes td div input , #novenoMes td div textarea").attr("disabled", false);
                                }
                                else if (index == 2) {
                                    $scope.Dasometria3 = value;
                                    $("#novenoMes td div input , #novenoMes td div textarea").attr("disabled", true);
                                    $("#doceavoMes td div input , #doceavoMes td div textarea").attr("disabled", false);
                                }
                                else if (index == 3) {
                                    $scope.Dasometria4 = value;
                                    $("#doceavoMes td div input , #doceavoMes td div textarea").attr("disabled", true);
                                }
                            });
                            swal(
                                'Buen Trabajo',
                                'Los cambios en dasometria se ha guardado correctamente',
                                'success'
                            )
                        }
                    })
                } else {
                    swal(
                        'Listo',
                        'No se han guardado los cambios',
                        'success'
                    )

                }
            })

        }

        $scope.ConsultarDasometria = function (Etapa) {
            var item = {
                Paramatro1: $rootScope.IdProyecto,
                Paramatro2: Etapa
            }
            ProyectoIntService.ConsultarDasometria(item).then(function (response) {
                if (response.data.success) {
                    var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        if (index == 0) {
                            $scope.Dasometria1 = value;
                            $("#tercerMes td div input , #tercerMes td div textarea").attr("disabled", true);
                            $("#sextoMes td div input , #sextoMes td div textarea").attr("disabled", false);
                        }
                        else if (index == 1) {
                            $scope.Dasometria2 = value;
                            $("#sextoMes td div input , #sextoMes td div textarea").attr("disabled", true);
                            $("#novenoMes td div input , #novenoMes td div textarea").attr("disabled", false);
                        }
                        else if (index == 2) {
                            $scope.Dasometria3 = value;
                            $("#novenoMes td div input , #novenoMes td div textarea").attr("disabled", true);
                            $("#doceavoMes td div input , #doceavoMes td div textarea").attr("disabled", false);
                        }
                        else if (index == 3) {
                            $scope.Dasometria4 = value;
                            $("#doceavoMes td div input , #doceavoMes td div textarea").attr("disabled", true);
                        }

                    });

                }
            })
        }

        $scope.GuardarDasometria2 = function (Etapa, form) {
            var numDasometria = 0;

            swal({
                title: 'Está seguro',
                text: "Desea guardar los cambios en dasometría",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, guardar',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.value) {
                    if (!$("#tercerMes2 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria5;
                    }

                    if (!$("#sextoMes2 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria6;
                    }

                    if (!$("#novenoMes2 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria7;
                    }

                    if (!$("#doceavoMes2 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria8;
                    }

                    if ($scope.ValidacionesDasometria($scope.objeto)) {
                        return;
                    }

                    $scope.objeto.Etapa = Etapa;
                    $scope.objeto.IdDetalleHuella = $rootScope.IdProyecto;

                    ProyectoIntService.GuardarDasometria($scope.objeto).then(function (response) {
                        if (response.data.success) {
                            var DasometriaValue = response.data.response;
                            $.each(DasometriaValue, function (index, value) {
                                if (index == 0) {
                                    $scope.Dasometria5 = value;
                                    $("#tercerMes2 td div input , #tercerMes2 td div textarea").attr("disabled", true);
                                    $("#sextoMes2 td div input , #sextoMes2 td div textarea").attr("disabled", false);
                                }
                                else if (index == 1) {
                                    $scope.Dasometria6 = value;
                                    $("#sextoMes2 td div input , #sextoMes2 td div textarea").attr("disabled", true);
                                    $("#novenoMes2 td div input , #novenoMes2 td div textarea").attr("disabled", false);
                                }
                                else if (index == 2) {
                                    $scope.Dasometria7 = value;
                                    $("#novenoMes2 td div input , #novenoMes2 td div textarea").attr("disabled", true);
                                    $("#doceavoMes2 td div input , #doceavoMes2 td div textarea").attr("disabled", false);
                                }
                                else if (index == 3) {
                                    $scope.Dasometria8 = value;
                                    $("#doceavoMes2 td div input , #doceavoMes2 td div textarea").attr("disabled", true);
                                }
                            });
                            swal(
                                'Buen Trabajo',
                                'Los cambios en dasometria se ha guardado correctamente',
                                'success'
                            )
                        }
                    })
                } else {
                    swal(
                        'Listo',
                        'No se han guardado los cambios',
                        'success'
                    )

                }
            })

        }

        $scope.ConsultarDasometria2 = function (Etapa) {
            var item = {
                Paramatro1: $rootScope.IdProyecto,
                Paramatro2: Etapa
            }
            ProyectoIntService.ConsultarDasometria(item).then(function (response) {
                if (response.data.success) {
                    var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        if (index == 0) {
                            $scope.Dasometria5 = value;
                            $("#tercerMes2 td div input , #tercerMes2 td div textarea").attr("disabled", true);
                            $("#sextoMes2 td div input , #sextoMes2 td div textarea").attr("disabled", false);
                        }
                        else if (index == 1) {
                            $scope.Dasometria6 = value;
                            $("#sextoMes2 td div input , #sextoMes2 td div textarea").attr("disabled", true);
                            $("#novenoMes2 td div input , #novenoMes2 td div textarea").attr("disabled", false);
                        }
                        else if (index == 2) {
                            $scope.Dasometria7 = value;
                            $("#novenoMes2 td div input , #novenoMes2 td div textarea").attr("disabled", true);
                            $("#doceavoMes2 td div input , #doceavoMes2 td div textarea").attr("disabled", false);
                        }
                        else if (index == 3) {
                            $scope.Dasometria8 = value;
                            $("#doceavoMes2 td div input , #doceavoMes2 td div textarea").attr("disabled", true);
                        }

                    });

                }
            })
        }

        $scope.GuardarDasometria3 = function (Etapa, form) {
            var numDasometria = 0;
            swal({
                title: 'Está seguro',
                text: "Desea guardar los cambios en dasometría",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Si, guardar',
                cancelButtonText: 'No'
            }).then((result) => {
                if (result.value) {
                    if (!$("#tercerMes3 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria9;
                    }

                    if (!$("#sextoMes3 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria10;
                    }

                    if (!$("#novenoMes3 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria11;
                    }

                    if (!$("#doceavoMes3 td div input").attr("disabled")) {
                        $scope.objeto = $scope.Dasometria12;
                    }

                    if ($scope.ValidacionesDasometria($scope.objeto)) {
                        return;
                    }

                    $scope.objeto.Etapa = Etapa;
                    $scope.objeto.IdDetalleHuella = $rootScope.IdProyecto;

                    ProyectoIntService.GuardarDasometria($scope.objeto).then(function (response) {
                        if (response.data.success) {
                            var DasometriaValue = response.data.response;
                            $.each(DasometriaValue, function (index, value) {
                                if (index == 0) {
                                    $scope.Dasometria9 = value;
                                    $("#tercerMes3 td div input , #tercerMes3 td div textarea").attr("disabled", true);
                                    $("#sextoMes3 td div input , #sextoMes3 td div textarea").attr("disabled", false);
                                }
                                else if (index == 1) {
                                    $scope.Dasometria10 = value;
                                    $("#sextoMes3 td div input , #sextoMes3 td div textarea").attr("disabled", true);
                                    $("#novenoMes3 td div input , #novenoMes3 td div textarea").attr("disabled", false);
                                }
                                else if (index == 2) {
                                    $scope.Dasometria11 = value;
                                    $("#novenoMes3 td div input , #novenoMes3 td div textarea").attr("disabled", true);
                                    $("#doceavoMes3 td div input , #doceavoMes3 td div textarea").attr("disabled", false);
                                }
                                else if (index == 3) {
                                    $scope.Dasometria12 = value;
                                    $("#doceavoMes3 td div input , #doceavoMes3 td div textarea").attr("disabled", true);
                                }
                            });
                            swal(
                                'Buen Trabajo',
                                'Los cambios en dasometria se ha guardado correctamente',
                                'success'
                            )
                        }
                    })
                } else {
                    swal(
                        'Listo',
                        'No se han guardado los cambios',
                        'success'
                    )

                }
            })

        }

        $scope.ConsultarDasometria3 = function (Etapa) {
            var item = {
                Paramatro1: $rootScope.IdProyecto,
                Paramatro2: Etapa
            }
            ProyectoIntService.ConsultarDasometria(item).then(function (response) {
                if (response.data.success) {
                    var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        if (index == 0) {
                            $scope.Dasometria9 = value;
                            $("#tercerMes3 td div input , #tercerMes3 td div textarea").attr("disabled", true);
                            $("#sextoMes3 td div input , #sextoMes3 td div textarea").attr("disabled", false);
                        }
                        else if (index == 1) {
                            $scope.Dasometria10 = value;
                            $("#sextoMes3 td div input , #sextoMes3 td div textarea").attr("disabled", true);
                            $("#novenoMes3 td div input , #novenoMes3 td div textarea").attr("disabled", false);
                        }
                        else if (index == 2) {
                            $scope.Dasometria11 = value;
                            $("#novenoMes3 td div input , #novenoMes3 td div textarea").attr("disabled", true);
                            $("#doceavoMes3 td div input , #doceavoMes3 td div textarea").attr("disabled", false);
                        }
                        else if (index == 3) {
                            $scope.Dasometria12 = value;
                            $("#doceavoMes3 td div input , #doceavoMes3 td div textarea").attr("disabled", true);
                        }

                    });

                }
            })
        }

        $scope.GuardarDasometria4 = function (Etapa, form) {
            var numDasometria = 0;
            if (!$("#tercerMes4 td div input").attr("disabled")) {
                $scope.objeto = $scope.Dasometria13;
            }

            if (!$("#sextoMes4 td div input").attr("disabled")) {
                $scope.objeto = $scope.Dasometria14;
            }

            if (!$("#novenoMes4 td div input").attr("disabled")) {
                $scope.objeto = $scope.Dasometria15;
            }

            if (!$("#doceavoMes4 td div input").attr("disabled")) {
                $scope.objeto = $scope.Dasometria16;
            }

            if ($scope.ValidacionesDasometria($scope.objeto)) {
                return;
            }

            $scope.objeto.Etapa = Etapa;
            $scope.objeto.IdDetalleHuella = $rootScope.IdProyecto;

            ProyectoIntService.GuardarDasometria($scope.objeto).then(function (response) {
                if (response.data.success) {
                    var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        if (index == 0) {
                            $scope.Dasometria13 = value;
                            $("#tercerMes4 td div input , #tercerMes4 td div textarea").attr("disabled", true);
                            $("#sextoMes4 td div input , #sextoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 1) {
                            $scope.Dasometria14 = value;
                            $("#sextoMes4 td div input , #sextoMes4 td div textarea").attr("disabled", true);
                            $("#novenoMes4 td div input , #novenoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 2) {
                            $scope.Dasometria15 = value;
                            $("#novenoMes4 td div input , #novenoMes4 td div textarea").attr("disabled", true);
                            $("#doceavoMes4 td div input , #doceavoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 3) {
                            $scope.Dasometria16 = value;
                            $("#doceavoMes4 td div input , #doceavoMes4 td div textarea").attr("disabled", true);
                        }
                    });
                    swal(
                        'Buen Trabajo',
                        'Los cambios en dasometria se ha guardado correctamente',
                        'success'
                    )
                }
            })
        }

        $scope.ConsultarDasometria4 = function (Etapa) {
            var item = {
                Paramatro1: $rootScope.IdProyecto,
                Paramatro2: Etapa
            }
            ProyectoIntService.GuardarDasometria($scope.objeto).then(function (response) {
                if (response.data.success) {
                    var DasometriaValue = response.data.response;
                    $.each(DasometriaValue, function (index, value) {
                        if (index == 0) {
                            $scope.Dasometria13 = value;
                            $("#tercerMes4 td div input , #tercerMes4 td div textarea").attr("disabled", true);
                            $("#sextoMes4 td div input , #sextoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 1) {
                            $scope.Dasometria14 = value;
                            $("#sextoMes4 td div input , #sextoMes4 td div textarea").attr("disabled", true);
                            $("#novenoMes4 td div input , #novenoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 2) {
                            $scope.Dasometria15 = value;
                            $("#novenoMes4 td div input , #novenoMes4 td div textarea").attr("disabled", true);
                            $("#doceavoMes4 td div input , #doceavoMes4 td div textarea").attr("disabled", false);
                        }
                        else if (index == 3) {
                            $scope.Dasometria16 = value;
                            $("#doceavoMes4 td div input , #doceavoMes4 td div textarea").attr("disabled", true);
                        }
                    });

                }
            })
        }

        ProyectoIntService.Porcentaje($rootScope.IdProyecto).then(function (response) {
            if (response.data.success) {
                $scope.Porcentaje = response.data.response;

                if ($scope.Porcentaje >= 20) {
                    $scope.hrefMantenimiento1 = "#mantenimiento1";
                    $("#Mantenimiento1").removeClass("disabled");
                    $("#Mantenimiento1").css({
                        color: "#fff",
                        cursor: "pointer"
                    });
                    $("#Mantenimiento1").hover({
                        color: "#4e600a",
                        border: "none"
                    });
                    $("#Mantenimiento1").focus({
                        color: "#fff",
                        background: "#4e600a"
                    });
                }

                if ($scope.Porcentaje >= 40) {
                    $scope.hrefMantenimiento1 = "#mantenimiento1";
                    $("#Mantenimiento1").removeClass("disabled");
                    $("#Mantenimiento1").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento2 = "#mantenimiento2";
                    $("#Mantenimiento2").removeClass("disabled");
                    $("#Mantenimiento2").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                }
                if ($scope.Porcentaje >= 60) {
                    $scope.hrefMantenimiento1 = "#mantenimiento1";
                    $("#Mantenimiento1").removeClass("disabled");
                    $("#Mantenimiento1").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento2 = "#mantenimiento2";
                    $("#Mantenimiento2").removeClass("disabled");
                    $("#Mantenimiento2").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento3 = "#mantenimiento3";
                    $("#Mantenimiento3").removeClass("disabled");
                    $("#Mantenimiento3").css({
                        color: "#fff",
                        cursor: "pointer"
                    });
                }
                if ($scope.Porcentaje >= 80) {
                    $scope.hrefMantenimiento1 = "#mantenimiento1";
                    $("#Mantenimiento1").removeClass("disabled");
                    $("#Mantenimiento1").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento2 = "#mantenimiento2";
                    $("#Mantenimiento2").removeClass("disabled");
                    $("#Mantenimiento2").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento3 = "#mantenimiento3";
                    $("#Mantenimiento3").removeClass("disabled");
                    $("#Mantenimiento3").css({
                        color: "#fff",
                        cursor: "pointer"
                    });

                    $scope.hrefMantenimiento4 = "#mantenimiento4";
                    $("#Mantenimiento4").removeClass("disabled");
                    $("#Mantenimiento4").css({
                        color: "#fff",
                        cursor: "pointer"
                    });
                }
                console.log($scope.Porcentaje);
            }
        })

        $scope.ConsultarPorcentaje = function () {
            ProyectoIntService.Porcentaje($rootScope.IdProyecto).then(function (response) {
                if (response.data.success) {
                    $scope.Porcentaje = response.data.response;
                    if ($scope.Porcentaje >= 20) {
                        $scope.hrefMantenimiento1 = "#mantenimiento1";
                        $("#Mantenimiento1").removeClass("disabled");
                        $("#Mantenimiento1").css({
                            color: "#fff",
                            cursor: "pointer"
                        });
                        $("#Mantenimiento1").hover({
                            color: "#4e600a",
                            border: "none"
                        });
                        $("#Mantenimiento1").focus({
                            color: "#fff",
                            background: "#4e600a"
                        });
                    }

                    if ($scope.Porcentaje >= 40) {
                        $scope.hrefMantenimiento1 = "#mantenimiento1";
                        $("#Mantenimiento1").removeClass("disabled");
                        $("#Mantenimiento1").css({
                            color: "#fff",
                            cursor: "pointer"
                        });
                        $("#Mantenimiento1").hover({
                            color: "#4e600a",
                            border: "none"
                        });
                        $("#Mantenimiento1").focus({
                            color: "#fff",
                            background: "#4e600a"
                        });

                        $scope.hrefMantenimiento2 = "#mantenimiento2";
                        $("#Mantenimiento2").removeClass("disabled");
                        $("#Mantenimiento2").css({
                            color: "#fff",
                            cursor: "pointer"
                        });
                        $("#Mantenimiento1").hover({
                            color: "#4e600a",
                            border: "none"
                        });
                        $("#Mantenimiento1").focus({
                            color: "#fff",
                            background: "#4e600a"
                        });

                    }
                    if ($scope.Porcentaje >= 60) {
                        $scope.hrefMantenimiento1 = "#mantenimiento1";
                        $("#Mantenimiento1").removeClass("disabled");
                        $("#Mantenimiento1").css({
                            color: "#fff",
                            cursor: "pointer"
                        });

                        $scope.hrefMantenimiento2 = "#mantenimiento2";
                        $("#Mantenimiento2").removeClass("disabled");
                        $("#Mantenimiento2").css({
                            color: "#fff",
                            cursor: "pointer"
                        });

                        $scope.hrefMantenimiento3 = "#mantenimiento3";
                        $("#Mantenimiento3").removeClass("disabled");
                        $("#Mantenimiento3").css({
                            color: "#fff",
                            cursor: "pointer"
                        });
                    }
                    if ($scope.Porcentaje >= 80) {
                        $scope.hrefMantenimiento1 = "#mantenimiento1";
                        $("#Mantenimiento1").removeClass("disabled");
                        $("#Mantenimiento1").css({
                            color: "#fff",
                            cursor: "pointer"
                        });

                        $scope.hrefMantenimiento2 = "#mantenimiento2";
                        $("#Mantenimiento2").removeClass("disabled");
                        $("#Mantenimiento2").css({
                            color: "#fff",
                            cursor: "pointer"
                        });

                        $scope.hrefMantenimiento3 = "#mantenimiento3";
                        $("#Mantenimiento3").removeClass("disabled");
                        $("#Mantenimiento3").css({
                            color: "#fff",
                            cursor: "pointer"
                        });

                        $scope.hrefMantenimiento4 = "#mantenimiento4";
                        $("#Mantenimiento4").removeClass("disabled");
                        $("#Mantenimiento4").css({
                            color: "#fff",
                            cursor: "pointer"
                        });
                    }
                }
            })
        }

        $scope.ValidacionesDasometria = function (validaciones) {
            if (validaciones.Altura == "" || validaciones.Dap == "" || validaciones.Perimetro == "" || validaciones.Diametro == "") {
                swal(
                    'Algo salió mal',
                    'Algunos campos están vacíos',
                    'error'
                )
                return true;
            }
            return false;
        }

        $scope.cerrarSesion = function () {
            $cookies.remove("username");
            $location.url("Login");
        }

    }

    //inyectar las dependencias que se esta usando
    proyectoInt.$inject = ["$scope", "$rootScope", "ProyectoIntService","$location", "$cookies", "$cookieStore"];
    //para declarar que este es mi controlador
    AngularApp.controller("ProyectoIntController", proyectoInt);

})()