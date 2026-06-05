-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 03 2026 г., 20:58
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kerama_marazzi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_last4` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `unit`, `description`) VALUES
(1, 'Calacatta Gold', 'keramogranit', '4590.00', 'м²', 'Изысканная имитация итальянского мрамора'),
(2, 'Артемида', 'keramogranit', '7890.00', 'м²', 'Ректифицированный крупноформатный керамогранит'),
(3, 'Statuario', 'keramogranit', '12900.00', 'м²', 'Элитный белый мрамор'),
(4, 'Оникс', 'keramogranit', '15900.00', 'м²', 'Имитация драгоценного камня'),
(5, 'Сланец', 'keramogranit', '6850.00', 'м²', 'Фактурный натуральный сланец'),
(6, 'Bianco Carrara', 'keramogranit', '11200.00', 'м²', 'Белый мрамор с серыми прожилками'),
(7, 'Nero Marquina', 'keramogranit', '14800.00', 'м²', 'Чёрный мрамор с белыми прожилками'),
(8, 'Бетон Индастриал', 'keramogranit', '5250.00', 'м²', 'Лофт бетонная текстура'),
(9, 'Wood Oak', 'keramogranit', '6450.00', 'м²', 'Имитация дуба'),
(10, 'Прованс', 'plitka', '2450.00', 'м²', 'Ретро плитка для кухни и ванной'),
(11, 'Мраморный каприз', 'plitka', '5390.00', 'м²', 'Глянцевая мраморная плитка'),
(12, 'Олимпиада', 'plitka', '4150.00', 'м²', 'Дизайнерский синий орнамент'),
(13, 'Гжель', 'plitka', '5200.00', 'м²', 'Русский стиль орнамента'),
(14, 'Дуб натуральный', 'plitka', '3290.00', 'м²', 'Имитация дерева'),
(15, 'Метлахская звезда', 'plitka', '3850.00', 'м²', 'Винтажный стиль'),
(16, 'Венецианская мозаика', 'plitka', '7200.00', 'м²', 'Итальянский стиль'),
(17, 'Рыбья Чешуя', 'plitka', '4980.00', 'м²', 'Форма чешуи'),
(18, 'Капли', 'plitka', '2750.00', 'м²', 'Форма капель'),
(19, 'Кристалл', 'plitka', '6850.00', 'м²', 'Эффект кристаллов'),
(20, 'Перламутр', 'mozaika', '6750.00', 'упак.', 'Стеклянная мозаика'),
(21, 'Золотая чешуя', 'mozaika', '8900.00', 'упак.', 'Золотой эффект'),
(22, 'Морская волна', 'mozaika', '7200.00', 'упак.', 'Волнообразная форма'),
(23, 'Серебро', 'mozaika', '7950.00', 'упак.', 'Серебристый эффект'),
(24, 'Каприз', 'mozaika', '5600.00', 'упак.', 'Микс материалов'),
(25, 'Панцирь черепахи', 'mozaika', '12400.00', 'упак.', 'Ручная работа'),
(26, 'Галька', 'mozaika', '4300.00', 'упак.', 'Эффект камней'),
(27, 'Византия', 'mozaika', '9800.00', 'упак.', 'Золото и синий'),
(28, 'Раедом', 'mozaika', '6700.00', 'упак.', 'Авторская мозаика'),
(29, 'Итальянские сады', 'dekor', '12500.00', 'шт', 'Керамическое панно'),
(30, 'Терра', 'dekor', '3450.00', 'шт', 'Клинкерная ступень'),
(31, 'Волна', 'dekor', '8750.00', 'м²', '3D панель'),
(32, 'Золотая лента', 'dekor', '3450.00', 'шт', 'Фриз'),
(33, 'Плинтус керамический', 'dekor', '1250.00', 'шт', 'Напольный элемент'),
(34, 'Арабеска', 'dekor', '890.00', 'шт', 'Декоративная вставка'),
(35, 'Лазурь', 'dekor', '750.00', 'шт', 'Бордюр'),
(36, 'Лилия', 'dekor', '18900.00', 'шт', 'Большое панно'),
(37, 'Золото уголок', 'dekor', '450.00', 'шт', 'Угловой элемент');

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Пользователь',
  `consultant` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Не назначен',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `status`, `consultant`, `created_at`) VALUES
(1, 'Денис Семенов', '', 'denckik@mail.ru', NULL, '$2y$10$EKFBelh5egIoPoMeHphb2e138Bqf5jSexk69raVkMxWvxZX2hZr3e', 'Пользователь', 'Не назначен', '2026-05-31 12:12:46');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
