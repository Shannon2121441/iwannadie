<?php
require 'db_shannon.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $stmt = $pdo->prepare('INSERT INTO User_tbl (Email, Password) VALUES (:email, :password)');
    $stmt->execute(['email' => $email, 'password' => $password]);

    echo json_encode(['status' => 'success', 'message' => 'User registered successfully']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>



<?php
require 'db_shannon.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT);

    $stmt = $pdo->prepare('INSERT INTO User_tbl (Name, Email, Password) VALUES (:name, :email, :password)');
    if ($stmt->execute(['name' => $name, 'email' => $email, 'password' => $password])) {
        $userId = $pdo->lastInsertId();
        $stmt = $pdo->prepare('SELECT Name, Email FROM User_tbl WHERE ID = :id');
        $stmt->execute(['id' => $userId]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        echo json_encode(['status' => 'success', 'message' => 'User registered successfully', 'user' => $user]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Failed to register user']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}
?>
