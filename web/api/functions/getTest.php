<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

function getTest(Request $request,Response $response, $args){
  require_once "db-connect.php";
  $req_id = $request->getAttribute('id');
  try{
    if($db_connection) {
      $result ="<b>Successfully</b> connected to db and got this:>	$req_id " ;
      return $response->withStatus(200)
      ->withHeader('Content-Type', 'text/html')
      ->write($result);

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
