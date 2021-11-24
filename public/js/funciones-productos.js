$(document).ready(function() {
    /* Carga contenido Productos*/
    $(".productos").click(function(event) {
        $("#contenido-panel").load("./views/panel/productos/principal.php");
        event.preventDefault();
    });

    $(".cod-registro").click(function(event) {
        $("#contenido-panel").load("./views/panel/productos/principal_registro.php");
        event.preventDefault();
    });
    /* Despliega Modal Registro de Producto*/
    $("a.BtnNewProducto").click(function(event) {
        $("#ModalNewProducto").modal("show");
        $("#DataFormProducto").load("./views/panel/productos/form_producto.php");
        event.preventDefault();
    });

    $("a.BtnNewCR").click(function(event) {
        $("#ModalNewCR").modal("show");
        $("#DataFormCR").load("./views/panel/productos/form_CR.php");
        event.preventDefault();
    });
    /* Despliega Modal Editar*/
    $("a.BtnEditProducto").click(function() {
        var idproducto = $(this).attr("id-producto");
        $('#ModalEditProducto').modal('show');
        $("#DataEditProducto").load("./views/panel/productos/edit_form_producto.php?idproducto=" + idproducto);
    });

    $("a.BtnEditCR").click(function() {
        var idcodreg = $(this).attr("id-codreg");
        $('#ModalEditCR').modal('show');
        $("#DataEditCR").load("./views/panel/productos/edit_form_CR.php?idcodreg=" + idcodreg);
    });

    /* Nuevo Producto*/
    $("#NewProducto").on("submit", function(event) {
        var formData = new FormData(document.getElementById("NewProducto"));
        formData.append("dato", "valor");
        $.ajax({
                url: "./views/panel/productos/insert.php",
                type: "POST",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
                processData: false
            })
            .done(function(res) {
                $("#contenido-panel").html(res);
            });
        event.preventDefault();
        
    });
    $("#NewCR").on("submit", function(event) {
        var formData = new FormData(document.getElementById("NewCR"));
        formData.append("dato", "valor");
        $.ajax({
                url: "./views/panel/productos/insertCR.php",
                type: "POST",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
                processData: false
            })
            .done(function(res) {
                $("#contenido-panel").html(res);
            });
        event.preventDefault();
        
    });

    /* Paginado*/
    $("a.pagina").click(function(event) {
        var num, reg;
        num = $(this).attr("v-num");
        reg = $(this).attr("num-reg");
        $("#contenido-panel").load("./views/panel/productos/principal.php?num=" + num + "&num_reg=" + reg);
        event.preventDefault();
    });

    $("a.paginaCR").click(function(event) {
        var num, reg;
        num = $(this).attr("v-num");
        reg = $(this).attr("num-reg");
        $("#contenido-panel").load("./views/panel/productos/principal_registro.php?num=" + num + "&num_reg=" + reg);
        event.preventDefault();
    });

    /* Aumenta N° registros para el paginado*/
    $("#select-reg").on('change', function(event) {
        var valor;
        valor = $("#select-reg option:selected").val();
        $("#contenido-panel").load("./views/panel/productos/principal.php?num_reg=" + valor);
        event.preventDefault();
    });

    /* Busca Productos*/
    $("#like-productos").on('change', function(event) {
        var valor;
        valor = $("#like-productos").val();
        if (valor.trim() == "") {
            alertify.alert("Busca Productos", "No ingreso el nombre ó código del producto a buscar...");
            event.preventDefault();
        } else {
            //alert(valor);
            $("#contenido-panel").load("./views/panel/productos/principal.php?like=1&valor=" + valor);
            //event.preventDefault();
        }
    });
    /* Eliminar Productos */
    $("a.BtnDelProducto").click(function(event) {
        var idproducto = $(this).attr("id-producto");
        alertify.confirm('Eliminar Producto', 'Seguro/a de eliminar producto',
            function() {
                $("#contenido-panel").load("./views/panel/productos/del.php?idproducto=" + idproducto);
                event.preventDefault();
            },
            function() {
                alertify.error('Proceso cancelado...');
            });
        event.preventDefault();
    });

    $("a.BtnDelCR").click(function(event) {
        var idcodreg = $(this).attr("id-codreg");
        alertify.confirm('Eliminar Código Registro/Producto', 'Seguro/a de eliminar registro',
            function() {
                $("#contenido-panel").load("./views/panel/productos/del.php?idproducto=" + idproducto);
                event.preventDefault();
            },
            function() {
                alertify.error('Proceso cancelado...');
            });
        event.preventDefault();
    });
    /* Update Producto*/
    $("#UpdateProducto").on("submit", function(event) {
        var formData = new FormData(document.getElementById("UpdateProducto"));
        formData.append("dato", "valor");
        $.ajax({
                url: "./views/panel/productos/update.php",
                type: "POST",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
                processData: false
            })
            .done(function(res) {
                $("#contenido-panel").html(res);
                $("#ModalEditProducto").modal("hide");
            });
        event.preventDefault();
    });

    $("#UpdateCR").on("submit", function(event) {
        var formData = new FormData(document.getElementById("UpdateCR"));
        formData.append("dato", "valor");
        $.ajax({
                url: "./views/panel/productos/updateCR.php",
                type: "POST",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
                processData: false
            })
            .done(function(res) {
                $("#contenido-panel").html(res);
            });
        event.preventDefault();
    });
});