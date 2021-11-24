<?php
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';

    $codproducto = $_POST['codproducto'];
    $productos = $_POST['productos'];
    $descripción = $_POST['descripcion'];
    $precio_venta = $_POST['precio_venta'];
    $precio_compra = $_POST['precio_compra'];
    $idproveedor = $_POST['idproveedor'];
    $fecha_ingreso = $_POST['fecha_ingreso'];


    $tabla = "productos";
    $campos = "codproducto, productos, descripcion, precio_venta, precio_compra, idproveedor, fecha_ingreso";
    $valores = "'$codproducto', '$productos', '$descripcion', '$precio_venta', '$precio_compra', '$idproveedor', '$fecha_ingreso'";

    $query1 = "SELECT * FROM productos WHERE productos = '$productos'";

?>
<?php if(CountReg($query1)!= 0):?>
    <script>
        alertify.error("Producto ya registrado intente con uno nuevo...");
        $("#ModalNewProductos").modal("hide");
        $("#contenido-panel").load("./views/panel/productos/principal.php");
    </script>
<?php else:?>
    <?php 
                $query2 = "INSERT INTO $tabla($campos) VALUES($valores)";

                if(CRUD($query2,"i")){
                    echo '<script>
                            alertify.success("Datos registrados...");
                            $("#ModalNewProductos").modal("hide");
                            $("#contenido-panel").load("./views/panel/productos/principal.php");
                        </script>';
                }
                else{
                    echo '<script>
                        alert("Error al registrar datos...");
                        $("#ModalNewProductosr").modal("hide");
                        $("#contenido-panel").load("./views/panel/productoss/principal.php");
                    </script>';
                }
    ?>
<?php endif?>