<?php
namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    protected $table = 'cities';

    protected $guarded = [];

    public function trips()
    {
        return $this->belongsToMany(Trip::class,'trip_cities','city_id','trip_id')->withPivot('order')->orderBy('pivot_order', 'asc');
    }


}
