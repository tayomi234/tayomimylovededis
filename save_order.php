<?php

header('Content-Type: application/json');

include 'db_connect.php';

$data = json_decode(file_get_contents("php://input"), true);

$cart = $data['cart'] ?? [];

if(empty($cart)){
    echo json_encode([
        "success" => false,
        "message" => "Корзина пуста"
    ]);
    exit;
}

$stmt = $conn->prepare("
INSERT INTO orders
(product_name, price, quantity)
VALUES (?, ?, ?)
");

foreach($cart as $item){

    $name = $item['name'];
    $price = $item['price'];
    $quantity = $item['quantity'];

    $stmt->bind_param(
        "sdi",
        $name,
        $price,
        $quantity
    );

    $stmt->execute();
}

echo json_encode([
    "success" => true
]);

$conn->close();
?>