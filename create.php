<?php
require 'db.php';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("INSERT INTO users (name, email) VALUES (?, ?)");
    $stmt->execute([$_POST['name'], $_POST['email']]);
    header("Location: index.php");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un utilisateur</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Ajouter un utilisateur</h1>
    <form method="post">
        Nom : <input name="name" required><br>
        Email : <input name="email" required><br>
        <button type="submit">Créer</button>
    </form>
</body>
</html>
