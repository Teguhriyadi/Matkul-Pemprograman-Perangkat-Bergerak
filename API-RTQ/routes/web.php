<?php

/** @var \Laravel\Lumen\Routing\Router $router */

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

use Laravel\Lumen\Routing\Router;
use App\Http\Controllers\WaliSantriController;

$router->get('/', function () use ($router) {

    return $router->app->version();
});

$router->group(
    ['prefix' => 'api'],

    function () use ($router) {

        $router->get(
            'wali_santri',
            ['uses' => 'WaliSantriController@index']
        );

        $router->get(
            'wali_santri/{id}',
            ['uses' => 'WaliSantriController@edit']
        );

        $router->post(
            'wali_santri',
            ['uses' => 'WaliSantriController@create']
        );

        $router->delete(
            'wali_santri/{id}',
            ['uses' => 'WaliSantriController@delete']
        );

        $router->put(
            'wali_santri/{id}',
            ['uses' => 'WaliSantriController@update']
        );
    }
);