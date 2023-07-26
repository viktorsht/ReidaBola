<?php

namespace App\Http\Controllers;

use App\Models\PlayerGameScoreChampionshipEdition;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\PlayerGameScoreChampionshipEditionRepository;

class PlayerGameScoreChampionshipEditionController extends Controller
{
    private $playerGameScoreChampionshipEdition;

    public function __construct(PlayerGameScoreChampionshipEdition $playerGameScoreChampionshipEdition)
    {
        $this->playerGameScoreChampionshipEdition = $playerGameScoreChampionshipEdition;
    }

    public function index(Request $request)
    {
        try{
            $playerGameScoreChampionshipEditionController = new PlayerGameScoreChampionshipEditionRepository($this->playerGameScoreChampionshipEdition);

            // $playerGameScoreChampionshipEditionController
                // ->selectAttributesRelated('','','');
            
            if ($request->has('filter')) {
                $playerGameScoreChampionshipEditionController->filter($request->filter);                
            }

            if($request->has('att')){
                $playerGameScoreChampionshipEditionController->selectAttributes($request->att);
            }

            $result  = $playerGameScoreChampionshipEditionController->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $playerGameScoreChampionshipEdition = $this->playerGameScoreChampionshipEdition
                ->find($id);

            if ($playerGameScoreChampionshipEdition === null) {
                return response()->json(['error' => 'Player game score championship edition not found'], 404);
            }

            return $playerGameScoreChampionshipEdition;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve player game score championship edition'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->playerGameScoreChampionshipEdition->rules(), $this->playerGameScoreChampionshipEdition->feedback());

            $playerGameScoreChampionshipEdition = $this->playerGameScoreChampionshipEdition->create($request->all());

            return response()->json($playerGameScoreChampionshipEdition, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $playerGameScoreChampionshipEdition = $this->playerGameScoreChampionshipEdition->find($id);

            if ($playerGameScoreChampionshipEdition === null) {
                return response()->json(['error' => 'Player game score championship edition not found'], 404);
            }

            $requestData = $request->all();

            if ($request->method() === "PATCH") {
                $rules = array();
                foreach ($playerGameScoreChampionshipEdition->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $playerGameScoreChampionshipEdition->feedback());
            } else {
                $request->validate($playerGameScoreChampionshipEdition->rules(), $playerGameScoreChampionshipEdition->feedback());
            }

            $playerGameScoreChampionshipEdition->update($request->all());

            return response()->json([
                'msg' => 'Player game score championship edition updated successfully',
                'player_game_score_championship_edition' => $playerGameScoreChampionshipEdition
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update player game score championship edition'], 500);
        }
    }
    

    public function destroy($id)
    {
        try {
            $playerGameScoreChampionshipEdition = $this->playerGameScoreChampionshipEdition->find($id);

            if ($playerGameScoreChampionshipEdition === null) {
                return response()->json(['error' => 'Player game score championship edition not found'], 404);
            }

            $playerGameScoreChampionshipEdition->delete();

            return response()->json(['msg' => 'Player game score championship edition deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete player game score championship edition'], 500);
        }
    }
}
