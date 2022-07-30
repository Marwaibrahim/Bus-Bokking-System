<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TripRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return[
            'depature' => 'required|integer',
            'destenation'   =>  'required|integer',
            'seat_id' => 'required|integer',
        ];
    }

    protected function failedValidation(\Illuminate\Contracts\Validation\Validator $validator)
    {
        $response = response()->json([ 
                'status' => [
                    'code'=>422, //can be changed if it is required 
                    'success'=>false,
                    'message' => $validator->errors()->first()   //if first only needed
                ],'data' => []], 422);

        throw new \Illuminate\Validation\ValidationException($validator, $response);
    }
}
