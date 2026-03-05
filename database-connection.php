<?php
$type   = 'mysql';      // Type of database
$server = 'localhost';  // Server the database is on
$db     = 'cf';         // Name of the database
$port   = '3306';       // Port is usually 8889 in MAMP and 3306 in XAMPP

$username = 'root';     // Enter YOUR username here
$password = '';         // Enter YOUR password here

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

// DO NOT CHANGE ANYTHING BENEATH THIS LINE

$charset = 'utf8mb4';
$dsn = "$type:host=$server;dbname=$db;port=$port;charset=$charset";

try {
    $pdo = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    throw new PDOException($e->getMessage(), $e->getCode());
}