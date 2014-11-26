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
    
<?php
/* Abrimos la base de datos */ 
$server     = 'localhost'; //servidor
$username   = 'root'; //usuario de la base de datos
$password   = 'root'; //password del usuario de la base de datos
$database   = 'CONAL'; //nombre de la base de datos
 
$conexionb = @new mysqli($server, $username, $password, $database);
 
if ($conexionb->connect_error) //verificamos si hubo un error al conectar, recuerden que pusimos el @ para evitarlo
{
    die('Error de conexión: ' . $conexionb->connect_error); //si hay un error termina la aplicación y mostramos el error
}
/* Realizamos la consulta SQL */
$sql="select lc.nombre as comite, inf_us.nombre as delegado, inf_us.telefono as telefono, tshirt, party from inf_us
JOIN lc ON lc.idLC = inf_us.idLC join usuario as usr ON usr.idUsuario=inf_us.idUsuario WHERE inf_us.idLC = '1'";
$result = $conexionb->query($sql); //usamos la conexion para dar un resultado a la variable

if($result->num_rows==0) die("No hay registros para mostrar");

/* Desplegamos cada uno de los registros dentro de una tabla */  
echo "<table border=1 cellpadding=4 cellspacing=0>";

/*Priemro los encabezados*/
 echo "<tr>
         <th colspan=6> Agenda personal </th>
       <tr>
         <th> Comité</th><th> Delegado </th><th> Teléfono </th>
         <th> Fiesta </th><th> Playera </th><th> Asistencia </th>
      </tr>";

/*Y ahora todos los registros */
while($row = $result->fetch_array(MYSQLI_ASSOC))
{
    echo "<tr><td>".$row["comite"]."</td>";
    echo "<td>".$row["delegado"]."</td>";
    echo "<td>".$row["telefono"]."</td>";
    echo "<td>".$row["tshirt"]. "</td>";  
    echo "<td>".$row["party"]. "</td></tr>";  
}
echo "</table>";
$conexionb->close(); //cerramos la conexión
?>
</body>
</html>