<?php
// app/core/Model.php

declare(strict_types=1);

require_once __DIR__ . '/../../config/database.php';

abstract class Model
{
    protected PDO $db;

    public function __construct()
    {
        $this->db = Database::getConnection();
    }

    // Ejecutas los SELECT y retorana las rows
    protected function fetchAll(string $sql, array $params = []): array
    {
        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    // Ejecuta el SELECT y retorana la row
    protected function fetchOne(string $sql, array $params = []): ?array
    {
        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        $row = $stmt->fetch();
        return $row === false ? null : $row;
    }

    // Ejecutas los INSERT/UPDATE/DELETE. y retornas las rows afectadas
    protected function execute(string $sql, array $params = []): int
    {
        $stmt = $this->db->prepare($sql);
        $stmt->execute($params);
        return $stmt->rowCount();
    }

    // Retorna el último id insertado
    protected function lastInsertId(): string
    {
        return $this->db->lastInsertId();
    }
}
