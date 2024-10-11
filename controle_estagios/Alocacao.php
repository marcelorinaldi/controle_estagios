<?php
class Alocacao {
    private $conn;
    private $table = 'alocacoes';

    public $id;
    public $aluno_id;
    public $local_estagio_id;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create() {
        $query = "INSERT INTO " . $this->table . " SET aluno_id=:aluno_id, local_estagio_id=:local_estagio_id";
        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':aluno_id', $this->aluno_id);
        $stmt->bindParam(':local_estagio_id', $this->local_estagio_id);

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
