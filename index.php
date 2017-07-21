<?php
use Phalcon\Db\Adapter\Pdo\Mysql as PdoMysql;
use Phalcon\Di\FactoryDefault;
use Phalcon\Http\Request;
use Phalcon\Http\Response;
use Phalcon\Loader;
use Phalcon\Mvc\Micro;
$loader = new Loader();
$loader->registerDirs([
	'models',
]);
$loader->register();
$di = new FactoryDefault();
//create the conection
$di->set('db', function () {
	return new PdoMysql(
		[
			'host' => 'localhost',
			'username' => 'root',
			'password' => '',
			'dbname' => 'notice',
		]
	);
}
);
$app = new Micro($di);
// Retrieves all notices
$app->get('/notices', function () use ($app) {
	$notice = Notice::find("soft_delete !=1");
	foreach ($notice as $noti) {
		$data[] = [
			'id' => $noti->id,
			'title' => $noti->title,
			'description' => $noti->description,
			'author' => $noti->author,
			'created_date' => $noti->created_date,

		];
	}
	echo json_encode($data);
});
// Adds a new notice
$app->post(
	'/notices',
	function () use ($app) {
		$notice = new Notice();
		$notice->title = $this->request->getPost("title");
		$notice->description = $this->request->getPost("description");
		$notice->author = $this->request->getPost("author");
		$notice->created_date = date("Y-m-d H:i:s");
		// Create a response
		$response = new Response();
		// Check if the insertion was successful
		if ($notice->save()) {
			// Change the HTTP status
			$response->setStatusCode(201, 'Created');
			// $notice->id = $notice->getModel()->id;
			$response->setJsonContent(
				[
					'status' => 'ADD',
					'data' => $notice,
				]
			);
		} else {
			// Change the HTTP status
			$response->setStatusCode(409, 'Conflict');

			// Send errors to the client
			$errors = [];

			foreach ($notice->getMessages() as $message) {
				$errors[] = $message->getMessage();
			}
			$response->setJsonContent(
				[
					'status' => 'ERROR',
					'messages' => $errors,
				]
			);
		}
		return $response;
	}
);

// Updates notice based on primary key
$app->put(
	'/notices/{id:[0-9]+}',
	function ($id) use ($app) {
		$notice = Notice::findFirstByid($id);
		$row = $this->request->getJsonRawBody();
		$notice->title = $row->title;
		$notice->description = $row->description;
		$notice->author = $row->author;
		// Create a response
		$response = new Response();
		// Check if the in	$response = new Response();sertion was successful
		if ($notice->update()) {
			$response->setJsonContent(
				[
					'status' => 'UPDATED',
					'data' => $notice,
				]
			);
		} else {
			// Change the HTTP status
			$response->setStatusCode(409, 'Conflict');

			$errors = [];
			foreach ($notice->getMessages() as $message) {
				$errors[] = $message->getMessage();
			}
			$response->setJsonContent(
				[
					'status' => 'ERROR',
					'messages' => $errors,
				]
			);
		}
		return $response;
	}
);
// Delete notice based on primary key
$app->delete(
	'/notices/{id:[0-9]+}',
	function ($id) use ($app) {
		$notice = Notice::findFirstByid($id);
		$notice->soft_delete = 1;
		// Create a response
		$response = new Response();
		if ($notice->update()) {
			$response->setJsonContent(
				[
					'status' => 'DELETED',
				]
			);
		} else {
			// Change the HTTP status
			$response->setStatusCode(409, 'Conflict');

			$errors = [];

			foreach ($notice->getMessages() as $message) {
				$errors[] = $message->getMessage();
			}

			$response->setJsonContent(
				[
					'status' => 'ERROR',
					'messages' => $errors,
				]
			);
		}

		return $response;
	}
);
$app->handle();