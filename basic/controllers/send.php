<?php
require_once __DIR__ . '/../vendor/autoload.php';
use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;

$connection = new AMQPStreamConnection('localhost', 5672, 'guest', 'guest');
$channel = $connection->channel();

$channel->queue_declare('salam', false, false, false, false);

$msg = new AMQPMessage('Salam World!');
$channel->basic_publish($msg, '', 'salam');

echo " [x] Sent 'Salam Worl	d!'\n";

$channel->close();
$connection->close();