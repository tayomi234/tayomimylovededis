<?php
session_start();
include __DIR__ . "/db_connect.php";

$error = "";

if (isset($_POST['login'])) {

    $name = trim($_POST['name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (!$conn) {
        die("Нет подключения к БД");
    }

    // ищем пользователя
    $stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {

        $user = $result->fetch_assoc();

        if (password_verify($password, $user['password'])) {

            $_SESSION['user_id'] = $user['id'];
            header("Location: account.php");
            exit();

        } else {
            $error = "Неверный пароль";
        }

    } else {

        // регистрация (если нет пользователя)
        $hash = password_hash($password, PASSWORD_DEFAULT);

        $stmt = $conn->prepare("
            INSERT INTO users (first_name, last_name, email, password)
            VALUES (?, '', ?, ?)
        ");

        $stmt->bind_param("sss", $name, $email, $hash);

        if ($stmt->execute()) {

            $_SESSION['user_id'] = $conn->insert_id;
            header("Location: account.php");
            exit();

        } else {
            $error = "Ошибка создания аккаунта";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Вход</title>

<style>
body{
    margin:0;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#faf8f4;
    font-family:Arial;
}

.card{
    width:400px;
    background:white;
    padding:40px;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,.1);
}

h1{text-align:center;}

input{
    width:100%;
    padding:12px;
    margin-top:10px;
    margin-bottom:15px;
    border:1px solid #ddd;
    border-radius:10px;
}

button{
    width:100%;
    padding:14px;
    border:none;
    border-radius:50px;
    background:#5e3a2e;
    color:white;
    cursor:pointer;
}

.error{
    color:red;
    text-align:center;
    margin-bottom:15px;
}
</style>
</head>
<body>

<div class="card">

<h1>Kerama Marazzi</h1>

<?php if ($error): ?>
<div class="error"><?= $error ?></div>
<?php endif; ?>

<form method="POST">

<input type="text" name="name" placeholder="Имя" required>
<input type="email" name="email" placeholder="Email" required>
<input type="password" name="password" placeholder="Пароль" required>

<button type="submit" name="login">Войти</button>

</form>

</div>

</body>
</html>