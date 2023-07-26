<?php

namespace App\Http\Controllers;

use App\Models\ChampionshipRound;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\ChampionshipRoundRepository;


class ChampionshipRoundController extends Controller
{
    public $championshipRound;

    public function __construct(ChampionshipRound $championshipRound){
        $this->championshipRound = $championshipRound;
    }

    public function index(Request $request)
    {
        try {
            $championshipRoundRepository = new ChampionshipRoundRepository($this->championshipRound);
            
            if ($request->has('filter')) {
                $championshipRoundRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $championshipRoundRepository->selectAttributes($request->att);
            }

            $result  = $championshipRoundRepository->getResult();
            return response()->json( $result, 200 );
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve championship rounds'], 500);
        }
    }

    public function show($id)
    {
        try {
            $championshipRound = $this->championshipRound->with('user')->findOrFail($id);
            return response()->json($championshipRound, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Equipe não encontrada.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->championshipRound->rules(), $this->championshipRound->feedback());

            $championshipRound = $this->championshipRound->create($request->all());

            return response()->json($championshipRound, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating team edition.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $championshipRound = $this->championshipRound->find($id);

        if ($championshipRound === null) {
            return response()->json(['error' => 'Not found.'], 404);
        } else {
            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($this->championshipRound->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }
                $this->validate($request, $rules, $this->championshipRound->feedback());
            } else {
                $this->validate($request, $this->championshipRound->rules(), $this->championshipRound->feedback());
            }

            $championshipRound->update($request->all());
        }

        return response()->json($championshipRound);
    }
    
    public function destroy($id)
    {
        try {
            $round =  $this->championshipRound->find($id);

            if ($round === null) {
                return response()->json(['error' => 'Championship round not found'], 404);
            }

            $round->delete();

            return response()->json(['msg' => 'Championship round deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete championship round'], 500);
        }
    }
}
