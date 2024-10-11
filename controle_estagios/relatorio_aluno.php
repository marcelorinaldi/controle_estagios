<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Relatório de Aluno</title>
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Relatório de Aluno</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Disponibilidade de Horário</th>
            <th>Fase do Estágio</th>
        </tr>
        <?php
        include_once 'Database.php';
        include_once 'Aluno.php';

        $database = new Database();
        $db = $database->getConnection();

        $aluno = new Aluno($db);
        $stmt = $aluno->read();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['nome'] . "</td>";
            echo "<td>" . $row['disponibilidade_horario'] . "</td>";
            echo "<td>" . $row['fase_estagio'] . "</td>";
            echo "</tr>";
        }
        ?>
    </table>
   
</body>
</html>
