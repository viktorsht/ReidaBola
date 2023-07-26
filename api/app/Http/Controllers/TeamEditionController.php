<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Models\TeamEdition;

class TeamEditionController extends Controller
{
    protected $teamEdition;

    public function __construct(TeamEdition $teamEdition)
    {
        $this->teamEdition = $teamEdition;
    }

    public function index()
    {
        try {
            $teamEditions = TeamEdition::with('team', 'championshipEdition.championship', 'coach')->get();

            return response()->json($teamEditions, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao buscar as edições de equipe.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $teamEdition = TeamEdition::with('team', 'championshipEdition.championship', 'coach')->findOrFail($id);

            return response()->json($teamEdition, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Edição de equipe não encontrada.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->teamEdition->rules(), $this->teamEdition->feedback());

            $teamEdition = $this->teamEdition->create($request->all());

            return response()->json($teamEdition, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating team edition.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $teamEdition = $this->teamEdition->findOrFail($id);

            $this->validate($request, $this->teamEdition->rules(), $this->teamEdition->feedback());

            $teamEdition->update($request->all());

            return response()->json($teamEdition);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error updating team edition.'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $teamEdition = $this->teamEdition->findOrFail($id);

            $teamEdition->delete();

            return response()->json(['message' => 'Team edition removed successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error removing team edition.'], 500);
        }
    }
}
