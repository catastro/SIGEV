<%-- 
    Document   : LogOut
    Created on : 16/03/2015, 12:33:28 PM
    Author     : WINDOWS 8
--%>
<br>
<br>
<center>
<div>
    <div >
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <h3 class="text-center">¿Desea Salir?</h3>
                <button  id="btnLogOn" class="btn btn-primary" ><strong>Si</strong></button>
                <hr/>
            </div>
        </div>
    </div>
</div>
</center>

<script>
    
       $('#btnLogOn').on('click', function () {
           LogOn();
        });
        
    function LogOn() {

            // alert(JSON.stringify(alumno));

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "LogONServlet",
                data: {
                    
                },
                success: function (data) {
                    if (data === true){
                        alert('Ud. salió del sistema');
                        window.location.href='index.html';
                    }
                    else
                        $.messager.alert('Error', "No pudo salir");

                },
                error: function (e) {
                    //alert('Error: ' + e.message);
                    //alert('Error: ' + e.toString());
                    $.messager.alert('Error', "No se pudo eliminar");
                }
            });
        }
</script>
