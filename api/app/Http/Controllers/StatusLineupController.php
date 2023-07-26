<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Models\StatusLineup;

class StatusLineupController extends Controller
{
    protected $statusLineup;

    public function __construct(StatusLineup $statusLineup)
    {
        $this->statusLineup = $statusLineup;
    }

    public function index()
    {
        try {
            $statusLineups = $this->statusLineup->all();

            return response()->json($statusLineups);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao obter os status do lineup.'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->statusLineup->rules(), $this->statusLineup->feedback());

            $statusLineup = $this->statusLineup->create($request->all());

            return response()->json($statusLineup, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao criar o status do lineup.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $statusLineup = $this->statusLineup->findOrFail($id);

            return response()->json($statusLineup);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Status do lineup não encontrado.'], 404);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $statusLineup = $this->statusLineup->findOrFail($id);

            $this->validate($request, $statusLineup->rules($id), $statusLineup->feedback());

            $statusLineup->update($request->all());

            return response()->json($statusLineup);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao atualizar o status do lineup.'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $statusLineup = $this->statusLineup->findOrFail($id);

            $statusLineup->delete();

            return response()->json(['message' => 'Status do lineup removido com sucesso.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao remover o status do lineup.'], 500);
        }
    }
}
