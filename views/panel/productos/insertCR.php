<?php
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';

    $idcr = $_POST['idcr'];
    $codreg = $_POST['codreg'];
    $nombrereg = $_POST['nombrereg'];
    


    $tabla = "codregistros";
    $campos = "idcr, codreg, nombrereg";
    $valores = "'$idcr', '$codreg', '$nombrereg'";

    $query1 = "SELECT * FROM codregistros WHERE codregistros = '$codregistros'";

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