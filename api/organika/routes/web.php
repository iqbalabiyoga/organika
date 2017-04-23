<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$app->get('/', function () use ($app) {
    return $app->version();
});
$app->get('/pengguna', 'PenggunaController@index');
$app->post('/tambah-pengguna', 'PenggunaController@tambah');
$app->post('/update-pengguna', 'PenggunaController@edit');
$app->post('/delete-pengguna', 'PenggunaController@delete');
