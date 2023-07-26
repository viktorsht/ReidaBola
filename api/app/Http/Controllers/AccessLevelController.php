<?php

namespace App\Http\Controllers;

use App\Models\AccessLevel;
use Illuminate\Http\Request;

class AccessLevelController extends Controller
{
    public function index()
    {
        $accessLevels = AccessLevel::all();
        return response()->json($accessLevels, 200);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|unique:access_levels,name'
        ]);

        $accessLevel = AccessLevel::create($data);

        return response()->json($accessLevel, 201);
    }

    public function show(AccessLevel $accessLevel)
    {
        return response()->json($accessLevel, 200);
    }

    public function update(Request $request, AccessLevel $accessLevel)
    {
        $data = $request->validate([
            'name' => 'required|unique:access_levels,name,' . $accessLevel->id
        ]);

        $accessLevel->update($data);

        return response()->json($accessLevel, 200);
    }

    public function destroy(AccessLevel $accessLevel)
    {
        $accessLevel->delete();

        return response()->json(['message' => 'Access level deleted successfully'], 200);
    }
}
