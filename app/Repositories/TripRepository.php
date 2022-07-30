<?php

namespace App\Repositories;

use App\Contracts\TripContract;
use App\Models\BusSeat;
use Symfony\Component\Console\Output\ConsoleOutput;

class TripRepository implements TripContract
{
    public function getTripAvailableSeates($id){
        $busSeats = BusSeat::with(['bus' => function ($query){
            $query->with(['trip' => function($query){
                $query->with('cities');
            }]);
        },'userTrips' => function($query) {
            $query->with(['fromStation', 'toStation'])->orderBy('depature', 'asc');
        }])->whereHas('bus.trip', function ($query) use($id) { $query->where('id', $id);})->get();
        $availableSeats = [];
        foreach($busSeats as $seat) {
            $tripStations = $seat->bus->trip->cities;
            $userTrips = $seat->userTrips;
            $tripCities = $seat->bus->trip->cities;
            if($userTrips->count() > 1) {
                if($userTrips[0]->depature != $tripCities[0]->id) {
                    array_push($availableSeats, [
                        'id' => $seat->id,
                        'bus' => $seat->bus,
                        'from' => $tripCities[0],
                        'to' => $userTrips[0]->fromStation
                    ]);
                }
                for($i = 1; $i < $userTrips->count(); $i++) {
                    if($userTrips[$i]->depature != $userTrips[$i - 1]->destenation) {
                        array_push($availableSeats, [
                            'id' => $seat->id,
                            'bus' => $seat->bus,
                            'from' => $userTrips[$i - 1]->toStation,
                            'to' => $userTrips[$i]->fromStation
                        ]);
                    }
                }
                if($userTrips[$userTrips->count() - 1]->destenation != $tripCities[$tripCities->count() - 1]->id) {
                    array_push($availableSeats, [
                        'id' => $seat->id,
                        'bus' => $seat->bus,
                        'from' => $userTrips[$userTrips->count() - 1] -> toStation,
                        'to' => $tripCities[$tripCities->count() - 1]
                    ]);
                }
            }
            else if($userTrips->count() == 0) {
                array_push($availableSeats, [
                    'id' => $seat->id,
                    'bus' => $seat->bus,
                    'from' => $tripCities[0],
                    'to' => $tripCities[$tripCities->count() - 1]
            ]);

            } else {
                if($userTrips[0]->depature != $tripCities[0]->id) {
                    array_push($availableSeats, [
                        'id' => $seat->id,
                        'bus' => $seat->bus,
                        'from' => $tripCities[0],
                        'to' => $userTrips[0]->fromStation
                    ]);
                }

                if($userTrips[0]->destenation != $tripCities[$tripCities->count() - 1]->id) {
                    array_push($availableSeats, [
                        'id' => $seat->id,
                        'bus' => $seat->bus,
                        'from' => $userTrips[0]->toStation,
                        'to' => $tripCities[$tripCities->count() - 1]
                        ]);
                    }
                }
        }
        return  $availableSeats;
    }

    public function isSeatAvailable($tripId, $seatId, $from, $to) {
        $availableSeats = array_filter($this->getTripAvailableSeates($tripId), function($seat) use($seatId) { return $seat['id'] == $seatId; });
        foreach($availableSeats as $seat) {
            $tripCities = $seat['bus']->trip->cities;
            $fromIndex = $tripCities->search(function($city) use($seat) {
                   return $city->id == $seat['from']->id;
            });
            $toIndex = $tripCities->search(function($city) use($seat){
                   return $city->id == $seat['to']->id;
            });
            $availableStations = $tripCities->map(function ($city) { return $city->id; })->slice($fromIndex, $toIndex - $fromIndex + 1);
            if($availableStations->contains($from) && $availableStations->contains($to)) {
                return true;
            }
        }
        return false;
    }

}
