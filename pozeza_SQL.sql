-- Створюємо базу та переходимо до неї
CREATE DATABASE IF NOT EXISTS pozeza;
USE pozeza;

-- Видаляємо таблиці у правильному порядку
DROP TABLE IF EXISTS passwords;
DROP TABLE IF EXISTS vyprobuvannya;
DROP TABLE IF EXISTS obladnannya;
DROP TABLE IF EXISTS nomenklatura;
DROP TABLE IF EXISTS accesses;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS chastyny;
DROP TABLE IF EXISTS zahony;


-- Таблиця Номенклатура
CREATE TABLE nomenklatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Таблиця Загонів
CREATE TABLE zahony (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Таблиця Частин
CREATE TABLE chastyny (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    zahon_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (zahon_id) REFERENCES zahony(id)
);

-- Таблиця Обладнання
CREATE TABLE obladnannya (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nomenklatura_id INT UNSIGNED NOT NULL,
    inventory_number VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(100) NOT NULL,
    chastyna_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (nomenklatura_id) REFERENCES nomenklatura(id),
    FOREIGN KEY (chastyna_id) REFERENCES chastyny(id)
);

-- Таблиця Випробувань
CREATE TABLE vyprobuvannya (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    obladnannya_id INT UNSIGNED NOT NULL,
    test_date DATE NOT NULL,
    result ENUM('пройшов', 'не пройшов') NOT NULL,
    next_test_date DATE NOT NULL,
    act_url TEXT,
    FOREIGN KEY (obladnannya_id) REFERENCES obladnannya(id)
);

-- Таблиця користувачів
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    chastyna_id INT UNSIGNED,
    password VARCHAR(255) NOT NULL,
    FOREIGN KEY (chastyna_id) REFERENCES chastyny(id)
);

-- Таблиця доступів
CREATE TABLE accesses(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    level enum('ro', 'rw'),
    zahin_id INT UNSIGNED NOT NULL,
    chastyna_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (zahin_id) REFERENCES zahony(id),
    FOREIGN KEY (chastyna_id) REFERENCES chastyny(id)
);


-- Таблиця сесій
CREATE TABLE sessions(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    token VARCHAR(100) NOT NULL,
    ex_time bigint NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
