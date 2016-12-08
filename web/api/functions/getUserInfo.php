<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

function getUserInfo(Request $request,Response $response, $args){
  require_once "db-connect.php";
  $req_id = $request->getAttribute('id');
  try{
    if($db_connection) {
      $query = $db_connection->prepare('SELECT * FROM tblclients WHERE clientId=:id');
      $query->execute(['id' => $req_id]);
      $result = $query->fetch(PDO::FETCH_ASSOC);

      return $response->withStatus(200)
      ->withHeader('Content-Type', 'text/json')
      ->write(json_encode($result));

    } else {
      $errObj = new stdClass();
      $errObj->error= "db-connection failed";
      return $response->withStatus(200)
      ->withHeader('Content-Type', 'application/json')
      ->write(json_encode($errObj));
    }
  }
  catch (Exception $e) {
    $errObj = new stdClass();
    $errObj->error= $e->getMessage();
    return $response->withStatus(200)
                    ->withHeader('Content-Type', 'application/json')
                    ->write(json_encode($errObj));
  }
}
