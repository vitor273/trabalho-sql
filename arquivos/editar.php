<?php
include_once("conecao.php");
 
$id = $_GET['id'];
$sql = "select * from alunos where id = $id";
$resultado = mysqli_query($conn, $sql);
$dados = mysqli_fetch_assoc($resultado);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <link rel="stylesheet" href="index.css" >
</head>
<dody>
    <div class = "container">
        <h1>Edita Aluno</h1>
        <form action="atualizar.php" method="post">
            <input type="hidden" name ="id" value="<?php echo $dados['id'];?>">
            <label for="nome">Nome</label>
            <input type ="text" name="nome" id ="nome"
            value="<?php echo $dados['nome'];?>"required>

            <label for="E-mail">Nome</label>
            <input type ="email" name="email" id ="email"
            value="<?php echo $dados['email'];?>"required>

            <button type="submit" style="background: #000">Salvar Alteração</button>
        </form>
        <a href="lista.php" class="btn-voltar">Vazar</a>
</body>
</html>