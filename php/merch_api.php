<?php
require 'db_shannon.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Fetch all merchandise items
    $stmt = $pdo->query('SELECT * FROM Merchandise_tbl');
    $merchandise = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($merchandise);
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['id'])) {
    // Fetch a specific merchandise item by ID
    $id = $_GET['id'];
    $stmt = $pdo->prepare('SELECT * FROM Merchandise_tbl WHERE id = :id');
    $stmt->execute(['id' => $id]);
    $merchandise = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($merchandise) {
        echo json_encode($merchandise);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Merchandise item not found']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
