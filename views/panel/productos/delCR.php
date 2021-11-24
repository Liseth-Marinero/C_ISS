<?php 
    @session_start();
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';

    $idcategoria = $_GET['idproductos'];

    $tabla = "productos";
    $condicion = "idproductos='$idproductos'";

    $insert = CRUD("DELETE FROM $tabla  WHERE $condicion","d");

    if($insert)
    {
        echo '<script>
                alertify.success("Producto eliminada...");
                $("#contenido-panel").load("./views/panel/productos/principal.php");
            </script>';
    }
    else
    {
        echo '<script>
                alertify.error("Error producto no eliminada...");
                $("#contenido-panel").load("./views/panel/productos/principal.php");
            </script>';
    }
?>