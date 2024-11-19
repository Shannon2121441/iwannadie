<?php
require 'db_shannon.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $searchTerm = $_POST['name'];

    $stmt = $pdo->prepare('SELECT * FROM Merch_tbl WHERE Name LIKE ?');
    $stmt->execute(['%' . $searchTerm . '%']);
    $merchandise = $stmt->fetchAll();

    if ($merchandise) {
        echo json_encode(['status' => 'success', 'data' => $merchandise]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'No merchandise found']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
