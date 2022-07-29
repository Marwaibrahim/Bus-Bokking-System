<?php

namespace App\Repositories;

use App\Contracts\CityContract;
use App\Models\City;

class CityRepository implements CityContract
{
    public function getAllCities()
    {

        $cities = City::orderBy('created_at', 'desc')->paginate(10);

        return $cities;
    }

}
