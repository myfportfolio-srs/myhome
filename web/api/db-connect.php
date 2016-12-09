  <?php
    $host = "mysql3.gear.host";
    $port = "3306";
    $dbname = "myhome01";
    $user = "myhome01";
    $password = "My3i-?4A4gbo";

    $connectionString = "mysql:host=$host;port=$port;dbname=$dbname";
    $db_connection = new PDO($connectionString, $user, $password);
?>
