<?php
    include_once 'Database.php';
    include_once 'Aluno.php';
    include_once 'Database.php';
    include_once 'LocalDepartamento.php';
    
    $database = new Database();
    $db = $database->getConnection();

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Alocação</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body> <a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Alocação</h1>
    <form action="processa_cadastro_alocacao.php" method="post">
        <label for="aluno_id">Aluno:</label>
        <select id="aluno_id" name="aluno_id" required>
            <?php          

            $database = new Database();
            $db = $database->getConnection();

            $aluno = new Aluno($db);
            $stmt = $aluno->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
            }
            ?>
        </select><br><br>

        <label for="local_estagio_id">Local de Estágio:</label>
        <select id="local_estagio_id" name="local_estagio_id" required>
          <?php           

            $local_estagio = new LocalDepartamento($db);
           // print_r($local_estagio);
            $stmt = $local_estagio->read();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {


                
                echo "<option value='" . $row['id'] . "'>" . $row['local'] . " | " . $row['departamento'] . "</option>";
            }
            ?>
        </select><br><br>

        <input type="submit" value="Alocar">
    </form>
</body>
</html>
