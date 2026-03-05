-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 05 2026 г., 18:10
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dgty`
--

-- --------------------------------------------------------

--
-- Структура таблицы `disciplines`
--

CREATE TABLE `disciplines` (
  `id_disciplines` int(11) NOT NULL,
  `namedisciplines` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img/',
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `disciplines`
--

INSERT INTO `disciplines` (`id_disciplines`, `namedisciplines`, `photo`, `description`) VALUES
(1, 'Математика', 'img/Математика.png', 'Математика в университете (бакалавриат, код 01.03.01) — это фундаментальная подготовка, включающая математический анализ, алгебру, теорию вероятностей, дифференциальные уравнения и дискретную математику.'),
(2, 'История', 'img/История.png', 'Курс направлен на развитие критического мышления, понимание причинно-следственных связей событий и формирования мировоззрения'),
(3, 'Правоведение', 'img/Правоведение.png', 'Курс охватывает основы теории права, конституционного, гражданского, трудового, административного и уголовного права. '),
(4, 'Социология\r\n', 'img/Социология.png', 'Социология в вузе (направление 39.03.01) — это комплексная дисциплина, изучающая структуру общества, социальные процессы, поведение людей и функционирование социальных институтов.'),
(5, 'Экономическая теория', 'img/Экономическаятеория.png', 'Экономическая теория в вузе — это фундаментальная общественная дисциплина, изучающая закономерности производства, распределения, обмена и потребления благ в условиях ограниченности ресурсов.'),
(6, 'Философия', ' img/Философия.png', 'Философия в вузе — это фундаментальная гуманитарная дисциплина, формирующая критическое мышление, навыки анализа, аргументации и мировоззрение.'),
(7, 'Психология', 'img/Психология.png', 'Психология в вузе — это фундаментальная научно-образовательная дисциплина (код 37.03.01), изучающая закономерности развития и функционирования психики.');

-- --------------------------------------------------------

--
-- Структура таблицы `grade`
--

CREATE TABLE `grade` (
  `id_grade` int(11) NOT NULL,
  `id_disciplines` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_tea` int(11) NOT NULL DEFAULT '1',
  `namegrade` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `grade`
--

INSERT INTO `grade` (`id_grade`, `id_disciplines`, `id_users`, `id_tea`, `namegrade`) VALUES
(1, 2, 2, 1, 5),
(2, 4, 2, 2, 4),
(8, 2, 3, 1, 4),
(9, 3, 2, 1, 5),
(10, 3, 15, 1, 3),
(11, 3, 15, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `grupp`
--

CREATE TABLE `grupp` (
  `id_grupp` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `namegrupp` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `formobch` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `grupp`
--

INSERT INTO `grupp` (`id_grupp`, `id_users`, `namegrupp`, `formobch`) VALUES
(1, 20, 'Р-3', 'Очная'),
(2, 3, 'В-4', 'Очная');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id_tae` int(11) NOT NULL,
  `namesurname` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kacedra` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `optrabot` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id_tae`, `namesurname`, `kacedra`, `optrabot`) VALUES
(1, 'Голикова Василиса Марковна', 'Филологический факультет', '15  лет'),
(2, 'Лещенков Дмитрий Владиславович', 'Экономический факультет', '23 года');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `fio` varchar(70) NOT NULL,
  `login` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'Студент'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_users`, `fio`, `login`, `password`, `role`) VALUES
(2, 'Иванова Анна Данииловна', 'user1', 'password', 'Студент'),
(3, 'Румянцева София Данииловна', 'user2', 'password', 'Студент'),
(14, 'Сочкина Анастасия Алексеевна', 'anastasia', 'password', 'Студент'),
(15, 'Анастасия', 'teacher', 'password', 'Преподаватель'),
(16, 'Мериса', 'adminkka', 'password', 'Администратор'),
(17, 'Виктор Мазуров Владимирович', 'sava', 'password', 'Студент'),
(20, 'Алина', 'uwer3', 'tyre', 'Студент'),
(21, 'Виктор Мазуров Владимирович', 'reaw34', '111', 'Студент'),
(22, 'Мария Ивановна Петрова', 'reaw15', 'password', 'Студент');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id_disciplines`);

--
-- Индексы таблицы `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id_grade`),
  ADD KEY `id_disciplines` (`id_disciplines`),
  ADD KEY `id_teacher` (`id_tea`),
  ADD KEY `id_users` (`id_users`);

--
-- Индексы таблицы `grupp`
--
ALTER TABLE `grupp`
  ADD PRIMARY KEY (`id_grupp`),
  ADD KEY `1d_users` (`id_users`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id_tae`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id_disciplines` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `grade`
--
ALTER TABLE `grade`
  MODIFY `id_grade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `grupp`
--
ALTER TABLE `grupp`
  MODIFY `id_grupp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id_tae` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`id_disciplines`) REFERENCES `disciplines` (`id_disciplines`),
  ADD CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`id_tea`) REFERENCES `teacher` (`id_tae`),
  ADD CONSTRAINT `grade_ibfk_4` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`);

--
-- Ограничения внешнего ключа таблицы `grupp`
--
ALTER TABLE `grupp`
  ADD CONSTRAINT `grupp_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
