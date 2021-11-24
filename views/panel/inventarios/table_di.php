<style>
    .cHead {
        vertical-align: middle;
        text-align: center;
    }
</style>
<table class="table table-borderless table-hover table-responsive-xl">
    <thead class="bg-dark text-white cHead">
        <tr>
            <th class="ch">N°</th>
            <th class="ch">Cod. Producto</th>
            <th class="ch">Cod. Registro</th>
            <th class="ch">Cod. Inventario</th>
            <th class="ch">Producto</th>
            <th class="ch">Descripcion</th>
            <th class="ch">Precio Unitario</th>
            <th class="ch">Stock</th>
            <th class="ch">Categoria</th>
            <th class="ch">Agregar</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($dataID as $result) : ?>
            <?php
                $idproducto = $result['idproducto'];
                $codregistro = $result["productos","codproducto",
                "idproducto = $idproducto'"];
            <tr>
                <td class="ch"><?php echo $cont += 1; ?></td>
                <td class="ch"><?php echo $result['idproducto']; ?></td>
                <td class="ch"><?php echo $result $idproducto; ?></td>
                <td class="ch"><?php echo $result['categoria']; ?></td>
                <td class="ch">
                    <a href="" class="btn btn-success upd-cate" data-toggle="modal" id-categoria="<?php echo $result['idcategoria']; ?>"><i class="fas fa-user-edit"></i></a>
                </td>
                <td class="ch">
                    <a href="" class="btn btn-danger del-cate" id-categoria="<?php echo $result['idcategoria']; ?>"><i class="fas fa-user-times"></i></a>
                </td>
            </tr>
        <?php endforeach ?>
    </tbody>
</table>