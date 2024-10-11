<?php
include_once 'Database.php';
include_once 'Alocacao.php';

$database = new Database();
$db = $database->getConnection();

$alocacao = new Alocacao($db);

$alocacao->aluno_id = $_POST['aluno_id'];
$alocacao->local_estagio_id = $_POST['local_estagio_id'];

if ($alocacao->create()) {
    echo $msg ="Alocacao_registrada_com_sucesso.";
    header("location: index.php?txt=$msg");
   exit(0);
} else {
    echo $msg ="Nao_foi_possível_registrar_a_alocacao.";
    header("location: index.php?txt=$msg");
   exit(0);
}
?>

