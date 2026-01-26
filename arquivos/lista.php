<?php
include_once(conecao.php)
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de alunos</title>
</head>
<dody>
    <div class="container">
        <h2>Alunos cadastrados</h2>
        <table>
            <tr>
                <tr>Nome<tr>
                <tr>E-Mail<tr>
            </tr>
                <?php
                $sql = "select * from alunos";
                $resultado = mysqli_query($conn, $sql);
                while($linha = mysqli_fetch_assoc($resultado))
                    echo "<tr>";
                    echo "<td>" . $linha['nome']."</td>";
                    echo "<td>" . $linha['email']."</td>";
                    echo "</tr>";
                ?>
                <a href="index.html" class="btn-voltar"><-- Cadastrar novo aluno</a>
           </table>
        </div>
   </dody>
</html>    
             