<?php

use Symfony\Component\Dotenv\Dotenv;

$dotenv = new Dotenv();
$dotenv->load(__DIR__.'/../.env');

$dbUser = $_ENV['DB_USER'];
$dbName = $_ENV['DB_NAME'];
$dbHost = $_ENV['DB_HOST'];
$dbPass = $_ENV['DB_PASS'];

return [
    'class' => 'yii\db\Connection',
    'dsn' => "mysql:host={$dbHost};dbname={$dbName}",
    'username' => $dbUser,
    'password' => $dbPass,
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
