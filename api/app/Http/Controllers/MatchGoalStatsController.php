<?php

namespace App\Http\Controllers;

use App\Models\MatchGoalStats;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\MatchGoalStatsRepository;

class MatchGoalStatsController extends Controller
{
    private $matchGoalStats;

    public function __construct(MatchGoalStats $matchGoalStats)
    {
        $this->matchGoalStats = $matchGoalStats;
    }

    public function index(Request $request)
    {
        try{
            $matchGoalStatsRepository = new MatchGoalStatsRepository($this->matchGoalStats);

            if ($request->has('filter')) {
                $matchGoalStatsRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $matchGoalStatsRepository->selectAttributes($request->att);
            }

            $result  = $matchGoalStatsRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }

    
    }

    public function show($id)
    {
        try {
            $matchGoalStats = $this->matchGoalStats
                ->with('soccerMatch','playerGoal', 'playerAssist')
                ->findOrFail($id);
            return response()->json($matchGoalStats, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve match goal stat'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->matchGoalStats->rules(), $this->matchGoalStats->feedback());

            $matchGoalStats = $this->matchGoalStats->create($request->all());

            return response()->json([
                'msg' => 'Match goal stat created successfully',
                'match_goal_stat' => $matchGoalStats
            ], 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create match goal stat'], 500);
        }
    
    }

    public function update(Request $request, $id)
    {
        try {
            $matchGoalStats = $this->matchGoalStats->find($id);

            if ($matchGoalStats === null) {
                return response()->json(['error' => 'Match goal stat not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($matchGoalStats->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $matchGoalStats->feedback());
            } else {
                $request->validate($matchGoalStats->rules(), $matchGoalStats->feedback());
            }

            $matchGoalStats->update($request->all());

            return response()->json([
                'msg' => 'Match goal stat updated successfully',
                'match_goal_stats' => $matchGoalStats
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update match goal stat'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $matchGoalStats = $this->matchGoalStats->find($id);

            if ($matchGoalStats === null) {
                return response()->json(['error' => 'Match goal stat not found'], 404);
            }

            $matchGoalStats->delete();

            return response()->json(['msg' => 'Match goal stat deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete match goal stat'], 500);
        }
    }

}
