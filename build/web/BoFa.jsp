<%-- 
    Document   : BoFa
    Created on : 10 may 2022, 12:26:12
    Author     : Desarrollo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<main class="content">
    <div class="container-fluid p-0">

        <h1 class="h3 mb-3">GENERACIÓN DE DOCUMENTOS</h1>


        <div class="row">


            <div class="col-12 col-xxl-6">

                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">DATOS DEL DOCUMENTO</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <a class="btn btn-light" >Operación</a>                                     
                                        <select class="form-select" >
                                            <option>Select...</option>
                                            <option>One</option>
                                            <option>Two</option>
                                            <option>Three</option>
                                        </select>         
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <a class="btn btn-light" >Transacción</a>                                     
                                        <select class="form-select">
                                            <option>Select...</option>
                                            <option>One</option>
                                            <option>Two</option>
                                            <option>Three</option>
                                        </select>         
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <button class="btn btn-light" type="button">N°Doc</button>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <button class="btn btn-light" type="button">IGV</button>                                        
                                        <input type="text" class="form-control">                                          
                                    </div>  
                                </div>

                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <button class="btn btn-light" type="button">Ruc/Dni</button>                                        
                                        <input type="text" class="form-control">         
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <button class="btn btn-light" type="button">Señor(@)</button>                                        
                                        <input type="text" class="form-control">               
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="input-group">
                                        <button class="btn btn-light" type="button"> Dirección</button>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>               

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">

                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">REMITENTE</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">  
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">RUC/DNI</button>                                        
                                                <input type="text" class="form-control">                                          
                                            </div>  
                                        </div>                                
                                    </div>  
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">Nombre</button>                                        
                                                <input type="text" class="form-control">         
                                            </div>
                                        </div>
                                    </div>                                
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">Dirección</button>                                        
                                                <input type="text" class="form-control">         
                                            </div>
                                        </div>
                                    </div>                                
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">CONSIGNATARIO</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">  
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">RUC/DNI</button>                                        
                                                <input type="text" class="form-control">                                          
                                            </div>  
                                        </div>                                
                                    </div>  
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">Nombre</button>                                        
                                                <input type="text" class="form-control">         
                                            </div>
                                        </div>
                                    </div>                                
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="input-group">
                                                <button class="btn btn-light" type="button">Dirección</button>                                        
                                                <input type="text" class="form-control">         
                                            </div>
                                        </div>
                                    </div>                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        $("#smartwizard-default-primary").smartWizard({
            theme: "default",
            showStepURLhash: false
        });
        $("#smartwizard-default-success").smartWizard({
            theme: "default",
            showStepURLhash: false
        });
        $("#smartwizard-default-danger").smartWizard({
            theme: "default",
            showStepURLhash: false
        });
        $("#smartwizard-default-warning").smartWizard({
            theme: "default",
            showStepURLhash: false
        });
        $("#smartwizard-arrows-primary").smartWizard({
            theme: "arrows",
            showStepURLhash: false
        });
        $("#smartwizard-arrows-success").smartWizard({
            theme: "arrows",
            showStepURLhash: false
        });
        $("#smartwizard-arrows-danger").smartWizard({
            theme: "arrows",
            showStepURLhash: false
        });
        $("#smartwizard-arrows-warning").smartWizard({
            theme: "arrows",
            showStepURLhash: false
        });
        // Validation
        var $validationForm = $("#smartwizard-validation");
        $validationForm.validate({
            errorPlacement: function errorPlacement(error, element) {
                $(element).parents(".error-placeholder").append(
                        error.addClass("invalid-feedback small d-block")
                        )
            },
            highlight: function (element) {
                $(element).addClass("is-invalid");
            },
            unhighlight: function (element) {
                $(element).removeClass("is-invalid");
            },
            rules: {
                "wizard-confirm": {
                    equalTo: "input[name=\"wizard-password\"]"
                }
            }
        });
        $validationForm
                .smartWizard({
                    autoAdjustHeight: false,
                    backButtonSupport: false,
                    useURLhash: false,
                    showStepURLhash: false,
                    toolbarSettings: {
                        toolbarExtraButtons: [$("<button class=\"btn btn-submit btn-primary\" type=\"button\">Finish</button>")]
                    }
                })
                .on("leaveStep", function (e, anchorObject, stepNumber, stepDirection) {
                    if (stepDirection === 1) {
                        return $validationForm.valid();
                    }
                    return true;
                });
        $validationForm.find(".btn-submit").on("click", function () {
            if (!$validationForm.valid()) {
                return;
            }
            alert("Great! The form is valid and ready to submit.");
            return false;
        });
    });
</script>
