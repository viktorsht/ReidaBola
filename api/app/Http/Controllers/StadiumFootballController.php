<?php

namespace App\Http\Controllers;

use App\Models\StadiumFootball;
use Illuminate\Http\Request;

class StadiumFootballController extends Controller
{
    public $stadium;

    public function __construct(StadiumFootball $stadium){
        $this->stadium = $stadium;
    }
    
    public function index()
    {
        $stadiums = $this->stadium->with('city.state')->get();;
        return response()->json($stadiums);
    }

    public function show($id)
    {
        $stadium = $this->stadium->with('city.state')->find($id);

        if ($stadium === null) {
            return response()->json(['error' => 'Estádio não encontrado.'], 404);
        }

        return response()->json($stadium);
    }

    public function store(Request $request)
    {
        $this->validate($request, $this->stadium->rules(), $this->stadium->feedback());

        $stadium = $this->stadium->create($request->all());

        return response()->json($stadium, 201);
    }

    public function update(Request $request, $id)
    {
        $stadium = $this->stadium->find($id);

        if ($stadium === null) {
            return response()->json(['error' => 'Estádio não encontrado.'], 404);
        }

        $this->validate($request, $this->stadium->rules(), $this->stadium->feedback());

        $stadium->update($request->all());

        return response()->json($stadium);
    }

    public function destroy($id)
    {
        $stadium = $this->stadium->find($id);

        if ($stadium === null) {
            return response()->json(['error' => 'Estádio não encontrado.'], 404);
        }

        $stadium->delete();

        return response()->json(['message' => 'Estádio removido com sucesso.']);
    }
}
