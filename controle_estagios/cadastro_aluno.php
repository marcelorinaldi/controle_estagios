<?php
include_once 'Database.php';
include_once 'Fase.php';

$database = new Database();
$db = $database->getConnection();

$fase = new Fase($db);
$fases = $fase->read();
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Aluno</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<a href="index.php">Voltar para o menu</a>
    <h1>Cadastro de Aluno</h1>
    <form action="processa_cadastro_aluno.php" method="post">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required><br><br>

        <label for="disponibilidade_horario">Disponibilidade de Horário:</label>
        <select id="disponibilidade_horario" name="disponibilidade_horario" required>
            <option value="Manhã">Manhã</option>
            <option value="Tarde">Tarde</option>
            <option value="Noite">Noite</option>
            <option value="Manhã e Tarde">Manhã e Tarde</option>
            <option value="Manhã e Noite">Manhã e Noite</option>
            <option value="Tarde e Noite">Tarde e Noite</option>
        </select><br><br>

        <label for="fase_estagio">Fase do Estágio:</label>
        <select id="fase_estagio" name="fase_estagio" required>
            <!--option value="1ª Fase">1ª Fase</option>
            <option value="2ª Fase">2ª Fase</option>
            <option value="3ª Fase">3ª Fase</option-->

<?php
            $fase = new Fase($db);
$stmt = $fase->read();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='" . $row['id'] . "'>" . $row['nome'] . "</option>";
}
?>


        </select><br><br>

        <input type="submit" value="Cadastrar">
    </form>
   
</body>
</html>
