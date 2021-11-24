<?php
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';
    
    $codproducto = $_POST['codproducto'];
    $productos = $_POST['productos'];
    $descripcion = $_POST['descripcion'];
    $precio_venta = $_POST['precio_venta'];
    $precio_compra = $_POST['precio_compra'];
    $idproveedor = $_POST['idproveedor'];
    $fecha_ingreso = $_POST['fecha_ingreso'];
    
    $tabla = "productos";
    $campos = "codproducto='$codproducto',productos='$productos',descripcion='$descripcion',precio_venta='$precio_venta', precio_compra='$precio_compra', idproveedor='$idproveedor', fecha_ingreso='$fecha_ingreso'";
    $condicion = "idproductos='$idproductos'";
    $update = CRUD("UPDATE $tabla SET $campos WHERE $condicion","u");
    
    if($update){
        echo '<script>
                alertify.success("Datos actualizados...");
                $("#ProveUpd").modal("hide");
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

