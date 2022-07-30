<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\APIs\AuthController;
use App\Http\Controllers\APIs\CityController;
use App\Http\Controllers\APIs\TripController;

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


    Route::group(['prefix' => 'cities'], function () {
        Route::get('/', [CityController::class, 'index']);
    });

    Route::get('trip/{id}',[TripController::class, 'availableSeats']);
    Route::post('trip/{id}/book',[TripController::class, 'userBooking']);
