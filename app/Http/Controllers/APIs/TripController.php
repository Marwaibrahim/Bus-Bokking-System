<?php

namespace App\Http\Controllers\APIs;

use App\Contracts\TripContract;
use App\Http\Requests\TripRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\UserTrip;

class TripController extends Controller
{

    protected $trip;

    public function __construct(TripContract $trip)
    {
        $this->trip = $trip;
        $this->middleware('auth:api');
    }

    public function availableSeats($id)
    {	
        $availableSeats = $this->trip->getTripAvailableSeates($id);

        if (!$availableSeats) {
            return $this->sendError('Sorry no available seats', 404);
        }
        return $this->sendResponse($availableSeats, 200, 'Available Seats retrived  Successfully');
    }

    public function userBooking(TripRequest $request, $id)
    {
       
        DB::beginTransaction();
        try {
            $validated = $request->validated();

            if (!$this->trip->isSeatAvailable($id, $request->get('seat_id'), $request->get('depature'), $request->get('destenation'))){
                return $this->sendError('Saet not available', 404);

            }
            $subscriber = auth('api')->user();
            if(!($subscriber)){
                return $this->sendError( 'sorry subscriber not auth', 401 );
            }
            $user = UserTrip::create([
                'depature' => $request->get('depature'),
                'destenation' => $request->get('destenation'),
                'seat_id' => $request->get('seat_id'),
                'trip_id' => $id,
                'user_id' => auth('api')->user()->id
            ]);
            DB::commit();
            return $this->sendResponse($user, 200, 'Saet booked Successfully');

        }catch (\Exception $e) {
            DB::rollback();
            return ['Something went wrong' => false];
        }
    }

}
