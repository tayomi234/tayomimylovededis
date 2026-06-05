<?php
session_start();
include "db_connect.php";

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];

$result = mysqli_query($conn, "
    SELECT *
    FROM users
    WHERE id='$user_id'
");

$user = mysqli_fetch_assoc($result);

if (!$user) {
    die("Пользователь не найден");
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Личный кабинет</title>

<link rel="stylesheet" href="account.css">
</head>

<body>

<header>
    <div class="header-container">
        <div class="logo">Керама Мараци</div>

        <nav>
            <ul>
                <li><a href="index.html">Главная</a></li>
                <li><a href="catalog.html">Коллекции</a></li>
                <li><a href="onas.html">О бренде</a></li>
            </ul>
        </nav>

        <div class="cart-icon">
            🛒 <span class="cart-count">0</span>
        </div>
    </div>
</header>

<div class="account-container">

<!-- SIDEBAR -->
<aside class="account-sidebar">

    <div class="user-profile">
        <div class="user-avatar">
            <?= mb_strtoupper(mb_substr($user['first_name'],0,1) . mb_substr($user['last_name'],0,1)) ?>
        </div>

        <div class="user-info">
            <h2><?= htmlspecialchars($user['first_name'].' '.$user['last_name']) ?></h2>
            <p><?= htmlspecialchars($user['email']) ?></p>
        </div>
    </div>

    <ul class="sidebar-menu">
        <li><a class="active" onclick="showTab('profile')">Профиль</a></li>
        <li><a onclick="showTab('orders')">Заказы</a></li>
        <li><a onclick="showTab('settings')">Настройки</a></li>
        <li><a href="logout.php">Выйти</a></li>
    </ul>

</aside>

<!-- CONTENT -->
<main class="account-content">

<!-- PROFILE -->
<div id="profile" class="tab">

<h1 class="section-title">Профиль</h1>

<div class="greeting-badge">
Добро пожаловать 👋
</div>

<form action="update_profile.php" method="POST">

<div class="account-details">

<div class="detail-group">
<label>Имя</label>
<input type="text" name="first_name"
value="<?= htmlspecialchars($user['first_name']) ?>">
</div>

<div class="detail-group">
<label>Фамилия</label>
<input type="text" name="last_name"
value="<?= htmlspecialchars($user['last_name']) ?>">
</div>

<div class="detail-group">
<label>Email</label>
<input type="email" name="email"
value="<?= htmlspecialchars($user['email']) ?>">
</div>

<div class="detail-group">
<label>Телефон</label>
<input type="text" name="phone"
value="<?= htmlspecialchars($user['phone']) ?>">
</div>

<div class="detail-group">
<label>Статус</label>
<p><?= htmlspecialchars($user['status']) ?></p>
</div>

<div class="detail-group">
<label>Консультант</label>
<p><?= htmlspecialchars($user['consultant']) ?></p>
</div>

</div>

<button class="btn" type="submit">
💾 Сохранить
</button>

</form>

</div>

<!-- ORDERS -->
<div id="orders" class="tab" style="display:none">

<h1 class="section-title">Заказы</h1>

<table class="order-history">
<tr>
<th>№</th>
<th>Дата</th>
<th>Сумма</th>
<th>Статус</th>
</tr>

<tr>
<td>KM-2409</td>
<td>24.03.2025</td>
<td>34 750 ₽</td>
<td><span class="status completed">Доставлен</span></td>
</tr>

<tr>
<td>KM-2381</td>
<td>10.03.2025</td>
<td>12 390 ₽</td>
<td><span class="status completed">Завершен</span></td>
</tr>

</table>

</div>

<!-- SETTINGS -->
<div id="settings" class="tab" style="display:none">

<h1 class="section-title">Настройки</h1>

<div class="greeting-badge">
Настройки аккаунта
</div>

<p>Тут можно дальше расширять: пароль, уведомления и т.д.</p>

</div>

</main>
</div>

<footer>
<div class="footer-container">
© 2025 Керама Мараци
</div>
</footer>

<script>
function showTab(id) {
    document.querySelectorAll('.tab').forEach(t => t.style.display = 'none');
    document.getElementById(id).style.display = 'block';

    document.querySelectorAll('.sidebar-menu a')
        .forEach(a => a.classList.remove('active'));
}
</script>

</body>
</html>