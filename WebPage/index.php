<?php
$server     = 'localhost'; //servidor
$username   = 'root'; //usuario de la base de datos
$password   = 'root'; //password del usuario de la base de datos
$database   = 'CONAL'; //nombre de la base de datos
 
$conexion = @new mysqli($server, $username, $password, $database);
 
if ($conexion->connect_error) //verificamos si hubo un error al conectar, recuerden que pusimos el @ para evitarlo
{
    die('Error de conexión: ' . $conexion->connect_error); //si hay un error termina la aplicación y mostramos el error
}
 
$sql="SELECT nombre from lc";
$comites = $conexion->query($sql); //usamos la conexion para dar un resultado a la variable
 
if ($comites->num_rows > 0) //si la variable tiene al menos 1 fila entonces seguimos con el codigo
{
    $combobit="";
    while ($row = $comites->fetch_array(MYSQLI_ASSOC)) 
    {
        $combobit .=" <option value='".$row['abbr']."'>".$row['nombre']."</option>"; //concatenamos el los options para luego ser insertado en el HTML
    }
}
else
{
    $combobit .= " <option>"."No existen comites en la base de datos"."</option>";
}
$conexion->close(); //cerramos la conexión
?>
<html>
<head>
<title>Llenar un Combobox/Select con registros de una Tabla</title>
<link href="contactos.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form action="datos.php" method="post">
        <p>Porfavor selecciona el comité:        
            <select name="comites">
                <?php echo $combobit; ?>
            </select>
        </p>
    </form>
</body>
</html>