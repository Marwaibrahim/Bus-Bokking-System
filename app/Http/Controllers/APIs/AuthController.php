<?php

namespace App\Http\Controllers\APIs;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

use App\Models\Subscriber;


class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','register']]);
    }

    public function login(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        if ($validation->fails()) {
            return $this->sendError($validation->errors()->all(), 400);
        }

        $credentials = request(['email', 'password']);
        if (!$token = auth('api')->attempt($credentials)) {
            return $this->sendError('Not Authorized',401);
        }    
        $user=auth('api')->user();
        $user->token=$token;
        return $this->sendResponse($user, 200,'Logined successfully');

    }

    public function register(Request $request){
        $validation = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:subscribers',
            'password' => 'required|string|min:6',
        ]);

        if ($validation->fails()) {
            return $this->sendError($validation->errors()->all(), 400);
        }

        $subscriber = Subscriber::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
       
        $token = auth('api')->login($subscriber);
        $user=auth('api')->user();
        $user->token=$token;
        return response()->json([
            'status' => 'success',
            'message' => 'Subscriber created successfully',
            'subscriber' => $subscriber,

        ]);
    }


}