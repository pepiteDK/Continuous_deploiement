<?php
require 'db.php';
$users = $pdo->query("SELECT * FROM users");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Utilisateurs</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Liste des utilisateurs</h1>
    <a href="create.php">➕ Ajouter un utilisateurs</a>
    <table>
        <tr><th>ID</th><th>Nom</th><th>Email</th><th>Actions</th></tr>
        <?php foreach ($users as $user): ?>
        <tr>
            <td><?= $user['id'] ?></td>
            <td><?= htmlspecialchars($user['name']) ?></td>
            <td><?= htmlspecialchars($user['email']) ?></td>
            <td>
                <a href="edit.php?id=<?= $user['id'] ?>">✏️ Modifier</a>
                <a href="delete.php?id=<?= $user['id'] ?>" onclick="return confirm('Supprimer cet utilisateur ?')">🗑️ Supprimer</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
</body>
</html> 
