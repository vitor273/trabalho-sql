<?php
include_once("conecao.php");
$nome = $_POST['nome'];
$email = $_POST['email'];

$sql = "insert into alunos (nome,email) values ('$nome','$email')";
if (mysqli_query($conn, $sql))
{
    echo "<h1>Aluno Cadastrado com sucesso!</h1>";
    echo "<a href='index.html'>Voltar</a>";
}
else{echo "erro de cadastro";}