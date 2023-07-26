<?php

namespace App\Http\Controllers;

use App\Models\PlayerGameScore;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\PlayerGameScoreRepository;

class PlayerGameScoreController extends Controller
{
    private $playerGameScore;

    public function __construct(PlayerGameScore $playerGameScore)
    {
        $this->playerGameScore = $playerGameScore;
    }

    public function index(Request $request)
    {
        try{
            $playerGameScoreRepository = new PlayerGameScoreRepository($this->playerGameScore);

            if ($request->has('filter')) {
                $playerGameScoreRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $playerGameScoreRepository->selectAttributes($request->att);
            }

            $result  = $playerGameScoreRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $playerGameScore = $this->playerGameScore->find($id);

            if ($playerGameScore === null) {
                return response()->json(['error' => 'Player game score not found'], 404);
            }

            return $playerGameScore;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve player game score'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();

            $request->validate($this->playerGameScore->rules(), $this->playerGameScore->feedback());

            $playerGameScore = new PlayerGameScore([
                'name' => $data['name']
            ]);

            $playerGameScore->save();

            return response()->json([
                'msg' => 'Player game score created successfully',
                'player_game_score' => $playerGameScore
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create player game score'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $playerGameScore = $this->playerGameScore->find($id);

            if ($playerGameScore === null) {
                return response()->json(['error' => 'Player game score not found'], 404);
            }

            $request->validate($this->playerGameScore->rules(), $this->playerGameScore->feedback());

            $playerGameScore->update($request->all());

            return response()->json([
                'msg' => 'Player game score updated successfully',
                'player_game_score' => $playerGameScore
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update player game score'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $playerGameScore = $this->playerGameScore->find($id);

            if ($playerGameScore === null) {
                return response()->json(['error' => 'Player game score not found'], 404);
            }

            $playerGameScore->delete();

            return response()->json(['msg' => 'Player game score deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete player game score'], 500);
        }
    }
}
