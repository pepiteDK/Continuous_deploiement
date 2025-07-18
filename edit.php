<?php
require 'db.php';
$id = $_GET['id'] ?? null;
if (!$id) exit('ID invalide');

$stmt = $pdo->prepare("SELECT * FROM users WHERE id = ?");
$stmt->execute([$id]);
$user = $stmt->fetch();
if (!$user) exit("Utilisateur non trouvé");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $stmt = $pdo->prepare("UPDATE users SET name = ?, email = ? WHERE id = ?");
    $stmt->execute([$_POST['name'], $_POST['email'], $id]);
    header("Location: index.php");
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Modifier un utilisateur</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Modifier un utilisateur</h1>
    <form method="post">
        Nom : <input name="name" value="<?= htmlspecialchars($user['name']) ?>" required><br>
        Email : <input name="email" value="<?= htmlspecialchars($user['email']) ?>" required><br>
        <button type="submit">Enregistrer</button>
    </form>
</body>
</html>
