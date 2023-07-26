<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = $this->user->with('accessLevel')->find(auth()->user()->id);
        $accessLevel = $user->accessLevel;

        if ($accessLevel->level < 3) {
            $users = $this->user->all();
            return response()->json($users, 200);
        }

        return response()->json(['error' => 'Acesso não autorizado.'], 403);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $result = $this->user->with('user')->find($id);
        if ($result === null) {
            $result = response()->json(['error' => "Nenhum dado encontrado."], 404);
        }
        return $result;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = $this->user->find($id);

        if ($user === null) {
            return response()->json(['error' => "Nenhum dado encontrado."], 404);
        } else {
            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($this->user->rules($id) as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $this->validate($request, $rules, $this->user->feedback());
            } else {
                $this->validate($request, $this->user->rules($id), $this->user->feedback());
            }

            $user->update($request->all());
        }

        return $user;

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $result = $this->user->find($id);
        $result = ($result === null) ? 0 : $result->delete();
        return $result ? ['msg' => "Removido com sucesso"] :  response()->json([ 'error' => "Nenhum dado encontrado"], 404); ;
    }
}
