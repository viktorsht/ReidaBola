<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Models\Team;

class TeamController extends Controller
{
    protected $team;

    public function __construct(Team $team)
    {
        $this->team = $team;
    }

    public function index()
    {
        try {
            $teams = $this->team->with('championship')->get();

            return response()->json($teams);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao obter as equipes.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $team = $this->team->with('championship')->findOrFail($id);

            return response()->json($team);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Equipe não encontrada.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->team->rules(), $this->team->feedback());

            $team = $this->team->create($request->all());

            return response()->json($team, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao criar a equipe.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $team = $this->team->with('championship')->find($id);

            if ($team === null) {
                return response()->json(['error' => 'Nenhum dado encontrado.'], 404);
            } else {
                if ($request->method() === 'PATCH') {
                    $requestData = $request->all();

                    $rules = [];
                    foreach ($this->team->rules($id) as $input => $rule) {
                        if (array_key_exists($input, $requestData)) {
                            $rules[$input] = $rule;
                        }
                    }

                    $this->validate($request, $rules, $this->team->feedback());
                } else {
                    $this->validate($request, $this->team->rules($id), $this->team->feedback());
                }

                $team->update($request->all());
            }

            return response()->json($team);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao atualizar a equipe.'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $team = $this->team->findOrFail($id);
            
            $team->delete();

            return response()->json(['message' => 'Equipe removida com sucesso.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao remover a equipe.'], 500);
        }
    }


}