<?php
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';
    
    $idcr = $_POST['idcr'];
    $codreg = $_POST['codreg'];
    $nombrereg = $_POST['nombrereg'];

    
    $tabla = "codregistros";
    $campos = "codreg='$codreg',nombre_registro='$nombrereg'";
    $condicion = "idcr='$idcr'";

    $insert = CRUD("UPDATE $tabla SET $campos WHERE $condicion","i");
    
    if($insert){
        echo '<script>
                alertify.success("Código registro actualizado...");
                $("#ModalEditCR").modal("hide");
                $("#contenido-panel").load("./views/panel/productos/principal.php");
            </script>';
    }
    else{
        echo '<script>
                alertify.error("Error al actualizar datos...");
                $("#ProveUpd").modal("hide");
                $("#contenido-panel").load("./views/panel/productos/principal.php");
            </script>';
    }

