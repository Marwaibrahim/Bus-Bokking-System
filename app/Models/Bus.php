<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Bus extends Model
{
    protected $table = 'buses';
    protected $fillable = ['car_plate'];

   
    public function busSeats()
    {
        return $this->hasMany(BusSeat::class);
    }

    public function trip()
    {
        return $this->hasOne(Trip::class);
    }


}
