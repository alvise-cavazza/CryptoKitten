<?php

$database = new SQLite3('db.sqlite');

if($_GET['a'] === 'g') {
  $m = $_GET['m'];
  $u = $_GET['u'];
  $key = $database->querySingle("SELECT key FROM keys WHERE uid = '$u' and filename = '$m'; ");
  echo $key;
} else {
  $query = $database->exec('CREATE TABLE IF NOT EXISTS keys ( id INTEGER PRIMARY KEY AUTOINCREMENT, uid TEXT NOT NULL, filename TEXT NOT NULL, key TEXT NOT NULL )');
  $bytes = openssl_random_pseudo_bytes(32);
  $m = $_GET['m'];
  $u = $_GET['u'];
  $query = $database->exec("INSERT INTO keys (uid, filename, key) VALUES ('$u','$m','$bytes')");
  echo $bytes;
}

?>
