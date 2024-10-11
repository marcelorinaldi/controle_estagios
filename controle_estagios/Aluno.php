<?php
class Aluno {
    private $conn;
    private $table = 'alunos';

    public $id;
    public $nome;
    public $disponibilidade_horario;
    public $fase_estagio;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET nome=:nome, disponibilidade_horario=:disponibilidade_horario, fase_estagio=:fase_estagio";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':nome', $this->nome);
        $stmt->bindParam(':disponibilidade_horario', $this->disponibilidade_horario);
        $stmt->bindParam(':fase_estagio', $this->fase_estagio);

        if ($stmt->execute()) {
            return true;
        }
        return false;
    }

    public function read() {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }
}
?>
