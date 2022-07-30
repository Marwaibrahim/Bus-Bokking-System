<?php

namespace App\Http\Controllers\APIs;

use App\Contracts\CityContract;
use App\Http\Resources\CityResource;
use App\Http\Controllers\Controller;

class CityController extends Controller
{
    protected $city;

    public function __construct(CityContract $city)
    {
        $this->city = $city;
        $this->middleware('auth:api');
    }

    public function index()
    {

        $cities = $this->city->getAllCities();
        if (!$cities) {
            return $this->sendError('Sorry cities not found', 404);
        }
    
        return CityResource::collection($cities)->additional([
            "status" => [
                "code" => 200,
                "success" => true,
                "message" => "Cities retrived Successfully"
            ]
        ]);
    }
}
