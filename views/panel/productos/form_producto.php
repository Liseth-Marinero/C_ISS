<?php 
    include '../../../models/conexion.php';
    include '../../../controllers/funciones.php';
    include '../../../models/procesos.php';

    $DataCR = CRUD("SELECT * FROM codregistros","s");
    $DataCategorias = CRUD("SELECT * FROM categorias","s");
    $DataProveedores = CRUD("SELECT * FROM proveedores","s");
    $DataMaxId = CRUD("SELECT Max(idproducto) AS ultimoid FROM productos","s");

    foreach($DataMaxId AS $result)
    {
        $idproducto = $result['ultimoid']+1;
    }
?>
<script src="./public/js/funciones-productos.js"></script>
<script src="./public/js/funciones.js"></script>

<form id="NewProductos" enctype="multipart/formdata">
    <input type="hidden" name="multipart/formdata">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Codproducto: </span>
        </div>
        <input type="text" name="codproducto" class="form-control" placeholder="codproducto" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Productos: </span>
        </div>
        <input type="text" name="productos" class="form-control" placeholder="Productos" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Descripción: </span>
        </div>
        <input type="text" name="descripcion" class="form-control" placeholder="descripcion" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Precio_venta: </span>
        </div>
        <input type="number" name="precio_venta" class="form-control"  placeholder="precio_venta" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Precio_compra: </span>
        </div>
        <input type="number" name="precio_compra" class="form-control" placeholder="precio_compra" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Idproveedor: </span>
        </div>
        <input type="number" name="	idproveedor" class="form-control" placeholder="idproveedor" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Fecha_ingreso: </span>
        </div>
        <input type="date" name="fecha_ingreso" class="form-control" placeholder="fecha_ingreso" required="ON">
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="inputGroupFileAddon01">Foto</span>
        </div>
        <div class="custom-file">
            <input type="file" class="custom-file-input imagen" name="imagen" id="" aria-describedby="inputGroupFileAddon01">
            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
        </div>
    </div>
    <div>
        <img src="" width="200px" alt="" id="muestraimagen">
    </div>
    <div style="margin-top:10px">
        <button class="btn btn-primary">Guardar</button>
    </div>
</form>