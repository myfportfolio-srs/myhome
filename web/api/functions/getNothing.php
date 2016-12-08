<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

function getNothing(Request $request,Response $response, $args){
  $result ="Nothing To Show " ;
  try{
    return $response->withStatus(200)
    ->withHeader('Content-Type', 'text/html')
    ->write($result);
  }
  catch (Exception $e) {
    $errObj = new stdClass();
    $errObj->error= $e->getMessage();
    return $response->withStatus(200)
    ->withHeader('Content-Type', 'application/json')
    ->write(json_encode($errObj));
  }
}
