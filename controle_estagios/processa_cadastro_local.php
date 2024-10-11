<?php
include_once 'Database.php';
include_once 'Local.php';

$database = new Database();
$db = $database->getConnection();

$local  = new Local($db);

$local->nome = $_POST['nome'];
$local->observacao = $_POST['observacao'];

if ($local->create()) {
    echo $msg = "Local_cadastrado_com_sucesso.";   
    header("location: index.php?txt=$msg");
    exit(0);
} else {
    echo $msg = "Não_foi_possível_cadastrar_o_Local.";   
    header("location: index.php?txt=$msg");
    exit(0);
}
?>
