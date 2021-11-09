<?php 
    include './models/conexion.php';
    include './models/login.php';
    include './models/procesos.php';
    include './controllers/funciones.php';
    include './views/navbar/navbar.php';
?>
<div id="contenido" style="margin-top: 10px;">
    <div class="alert alert-info" style="width:500px">
        Bienvenido/a: <?php echo $_SESSION["user"];?>

        <?php
            $idusuario = $_SESSION["idusuario"];
            $foto = buscavalor("usuarios","foto","idusuarios='$idusuario'");
        ?>
        <br>
        <img src="./public/img/usuarios/<?php echo $foto;?>" width="200px" alt="">
    </div>
</div>