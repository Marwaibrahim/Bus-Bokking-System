<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class UserTrip extends Model
{
    protected $table = 'user_trips';
    protected $fillable = ['trip_id','seat_id','user_id', 'depature', 'destenation'];

    public $timestamps = false ;

    public function trip()
    {
        return $this->belongsTo(Trip::class, 'trip_id');
    }

    public function seat()
    {
        return $this->belongsTo(BusSeat::class, 'seat_id');
    }

    public function user()
    {
        return $this->belongsTo(Subscriber::class, 'user_id');
    }

    public function fromStation()
    {
        return $this->belongsTo(City::class, 'depature');
    }

    public function toStation()
    {
        return $this->belongsTo(City::class, 'destenation');
    }

}
