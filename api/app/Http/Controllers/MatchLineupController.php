<?php

namespace App\Http\Controllers;

use App\Models\MatchLineup;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Validation\ValidationException;
use App\Repositories\MatchLineupRepository;

class MatchLineupController extends Controller
{
    private $matchLineup;

    public function __construct(MatchLineup $matchLineup)
    {
        $this->matchLineup = $matchLineup;
    }

    public function index(Request $request)
    {
        try{
            $matchLineupRepository = new MatchLineupRepository($this->matchLineup);

            $matchLineupRepository
                ->selectAttributesRelated([
                    'playerEdition.player.position',
                    'playerEdition.teamEdition.team',
                    'soccerMatch.team1Edition.team',
                    'soccerMatch.team2Edition.team',
                    'soccerMatch.championshipEdition.championship',
                    'soccerMatch.championshipRound',
                    'statusLineup',
            ]);

            if ($request->has('filter')) {
                $matchLineupRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $matchLineupRepository->selectAttributes($request->att);
            }

            $result  = $matchLineupRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $lineup = $this->matchLineup->with(['playerEdition.player', 'soccerMatch', 'statusLineup'])->find($id);

            if ($lineup === null) {
                return response()->json(['error' => 'Match lineup not found'], 404);
            }

            return $lineup;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve match lineup'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();
            $lineup = $this->matchLineup->create($data);
            return response()->json([
                'msg' => 'Match lineup created successfully',
                'lineup' => $lineup
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create match lineup'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $lineup = $this->matchLineup->find($id);

            if ($lineup === null) {
                return response()->json(['error' => 'Match lineup not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($lineup->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $lineup->feedback());
            } else {
                $request->validate($lineup->rules(), $lineup->feedback());
            }

            $lineup->update($request->all());

            return response()->json([
                'msg' => 'Match lineup updated successfully',
                'lineup' => $lineup
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update match lineup'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $lineup = $this->matchLineup->find($id);

            if ($lineup === null) {
                return response()->json(['error' => 'Match lineup not found'], 404);
            }

            $lineup->delete();

            return response()->json(['msg' => 'Match lineup deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete match lineup'], 500);
        }
    }
}
