<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class BusSeat extends Model
{
    protected $table = 'bus_seates';
    protected $fillable = ['seat_number','booked','bus_id'];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'booked' => 'boolean',
    ];

    public function bus()
    {
        return $this->belongsTo(Bus::class, 'bus_id');
    }


    public function userTrips()
    {
        return $this->hasMany(UserTrip::class, 'seat_id');
    }
}
