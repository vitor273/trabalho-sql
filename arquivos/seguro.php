<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="stylelist.css">
</head>
<body>
      <div class ="container">
      <form action="" method="get">
      <input type="text" name="busca" id="buscar" color="black">
     <button>Buscar</button>
    </form>
    <?php
    include_once("conecao.php");
    if(isset($_GET['busca']))
    {
      $busca = $_GET['busca'];
      $sql = "SELECT * FROM alunos WHERE nome LIKE ?";
      $stmt = mysqli_query($conn, $sql);
      
      $param_busca = "%" . $busca . "%";

      $mysqli_stmt_execute($stmt);

      if(mysqli_num_rows($resultado) > 0)
        {
          echo "<table><tr><tr>Nome</th><th>Email</th></tr>";
          while($linha = mysqli_fetch_assoc($resultado))
            {
               echo "<tr><th>{$linha['nome']}</td><td>{$linha['email']}</td></td></tr>";
            }
            echo "</table>";
        }

    }  
    ?>
</body>
</html>