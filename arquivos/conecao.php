<?php
$servidor ='localhost';
$usuario ='root';
$senha ='';
$banco ='senai';


$conn = mysqli_connect($servidor, $usuario, $senha, $banco);

if (!$conn)
{
die ("A conexão falhou:" . mysqli_connect_errror());
}
?>