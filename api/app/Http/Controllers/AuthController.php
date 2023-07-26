<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\AccessLevel;


class AuthController extends Controller
{
    public function login(Request $request){
        $data = $request->all( ['email', 'password'] );
        
        // auth (by email and password)
        $token = auth('api')->attempt($data);
        
        if( $token ){
            $result = [ 
                'msg' => ['token' => $token],
                'status' => 200
             ];
        }else{
            $result = [ 
                'msg' => ['token' => null],
                'status' => 403
             ];
        }

        // return JWT
        return response()->json( $result['msg'], $result['status'] );
    }
    
    public function register(Request $request)
    {
        $data = $request->all();
        $defaultAccessLevelId = AccessLevel::getAccessLevelIdByName('Usuário');

        // Verifica se o campo access_level_id não foi enviado
        if (!isset($data['access_level_id'])) {
            $data['access_level_id'] = $defaultAccessLevelId;
        }

        // Verifica se o access_level_id é igual ao ID do nível de acesso de "usuário"
        if ($data['access_level_id'] == $defaultAccessLevelId) {
            $user = new User([
                'first_name' => $data['first_name'],
                'last_name' => $data['last_name'],
                'nick' => $data['nick'],
                'email' => $data['email'],
                'password' => bcrypt($data['password']),
                'access_level_id' => $data['access_level_id']
            ]);

            $rules = $user->rules();
            $rules['access_level_id'] = 'sometimes|' . $rules['access_level_id'];

            $request->validate($rules, $user->feedback());
            $user->save();

            return response()->json([
                'msg' => 'User created successfully',
                'user' => $user
            ], 201);
        } else {
            // implemented register user others permissions 
            return response()->json(['error' => 'Unauthorized access.'], 403);
        }
    }

    public function logout(){
        auth('api')->logout();
        return response()->json([
            'msg' => 'Logout realziado com sucesso',
        ]);
    }

    public function refresh(){
        $token = auth('api')->refresh();

        return response()->json( [
            'token' => $token,
        ] );
    }

    public function me(){
        return response()->json( auth()->user() );
    }
}
