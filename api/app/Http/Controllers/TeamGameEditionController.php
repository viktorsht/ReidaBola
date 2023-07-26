<?php

namespace App\Http\Controllers;

use App\Models\TeamGameEdition;
use Illuminate\Http\Request;

class TeamGameEditionController extends Controller
{
    public $teamGameEdition;

    public function __construct(TeamGameEdition $teamGameEdition)
    {
        $this->teamGameEdition = $teamGameEdition;
    }

    public function index()
    {
        $teamGameEditions = $this->teamGameEdition->with(['teamGame', 'championshipEdition'])->get();
        return $teamGameEditions;
    }

    public function show($id)
    {
        $teamGameEdition = TeamGameEdition::with('teamGame', 'championshipEdition')->find($id);

        if ($teamGameEdition === null) {
            return response()->json(['error' => 'Nenhum dado encontrado.'], 404);
        }

        return $teamGameEdition;
    }

    public function store(Request $request)
    {
        $data = $request->all();

        $teamGameEdition = TeamGameEdition::create($data);

        return $teamGameEdition;
    }

    public function update(Request $request, $id)
    {
        $teamGameEdition = TeamGameEdition::find($id);

        if ($teamGameEdition === null) {
            return response()->json(['error' => 'Nenhum dado encontrado.'], 404);
        }

        $teamGameEdition->update($request->all());

        return $teamGameEdition;
    }

    public function destroy($id)
    {
        $teamGameEdition = TeamGameEdition::find($id);

        if ($teamGameEdition === null) {
            return response()->json(['error' => 'Nenhum dado encontrado.'], 404);
        }

        $teamGameEdition->delete();

        return ['msg' => 'Removido com sucesso.'];
    }


}
