<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    protected $table = 'trips';
 

    public function bus()
    {
        return $this->belongsTo(Bus::class, 'bus_id');
    }

    public function cities()
    {
        return $this->belongsToMany(City::class,'trip_cities','trip_id','city_id')->withPivot('order')->orderBy('pivot_order', 'asc');
    }

    public function busSeats()
    {
        return $this->hasMany(BusSeat::class);
    }
}
