<?php
require_once __DIR__ . '/../vendor/autoload.php';
use PhpAmqpLib\Connection\AMQPStreamConnection;
use PhpAmqpLib\Message\AMQPMessage;
use PhpAmqpLib\Connection\AMQPConnection;

$connection = new AMQPStreamConnection('localhost', 5672, 'guest', 'guest');
//$cnn = new AMQPConnection();
$channel = $connection->channel();

// if ($cnn->connect()){
// 	echo "sudah bisa konek";
// } else{
// 	echo "gagal konek";
// }

$channel->queue_declare('salam', false, false, false, false);
$data = rand(35, 887);

// $msg = new AMQPMessage($data, array('delivery_mode' => 2));
// $channel->basic_publish($msg, '', 'rand');
//echo " [*] Waiting for messages. To exit press CTRL+C\n";

$callback = function ($msg) {
	echo ' [x] Received ', $msg->body, "\n";
};
      
$channel->basic_consume('salam', '', false, true, false, false, $callback);
      
while ($channel->is_open()) {
	$channel->wait();
}

$channel->close();
$connection->close();