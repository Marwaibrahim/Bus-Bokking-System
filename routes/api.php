<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\APIs\AuthController;
use App\Http\Controllers\APIs\CityController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::controller(AuthController::class)->group(function () {
    Route::post('login', 'login');
    Route::post('register', 'register');

});

// Route::group(['middleware'=>['jwt.auth']],function(){

    Route::group(['prefix' => 'cities'], function () {
        Route::get('/', [CityController::class, 'index']);
    });



// });