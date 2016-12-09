<?php
	require '../../vendor/autoload.php';
  require_once 'loadFunctions.php';

  $app = new \Slim\App();


/**
  All the GET request handler
**/
  $app->get('/group/{id}', "getGroupInfo");
  $app->get('/{id}', "getUserInfo");
  $app->get('/', "getNothing");
/**
  All the POST request handler
**/

/**
  All the PUT /UPDATE request handler
**/


/**
  All the DELETE request handler
**/

	$app->run();
