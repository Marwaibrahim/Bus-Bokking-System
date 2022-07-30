<?php

namespace App\Contracts;

use Illuminate\Support\Collection;

interface TripContract
{

 
    public function getTripAvailableSeates($id);
    public function isSeatAvailable($tripId, $seatId, $from, $to);

}