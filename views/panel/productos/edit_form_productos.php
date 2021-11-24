<?php
    @session_start();
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';

    $idproductos = $_GET['idproductos'];
    
    $DataProductos = CRUD("SELECT * FROM productos WHERE idproductos = '$idproductos'","s");

    foreach ($DataProductos AS $result)
    {
        $productos = $result['productos'];
    }
?>
<script src="./public/js/funciones-productos.js"></script>
<script src="./public/js/funciones.js"></script>

<form id="UpdateProductos" enctype="multipart/formdata">
    <input type="hidden" name="idproductos" value="<?php echo $idproductos;?>">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Productos: </span>
        </div>
        <input type="text" name="productos" class="form-control" value="<?php echo $productos; ?>" required="ON">
    </div>
    <div style="margin-top:10px">
        <button class="btn btn-primary">Guardar</button>
    </div>
</form>