<?php

namespace App\Http\Controllers;

use App\Models\MatchGameLineup;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\MatchGameLineupRepository;


class MatchGameLineupController extends Controller
{
    private $matchGameLineup;

    public function __construct(MatchGameLineup $matchGameLineup)
    {
        $this->matchGameLineup = $matchGameLineup;
    }

    public function index(Request $request)
    {        
        try{
            $matchGameLineupRepository = new MatchGameLineupRepository($this->matchGameLineup);

            if ($request->has('att_soccer')) {
                $att_soccer = 'soccer:id,' .  $request->att_soccer;
                $matchGameLineupRepository->selectAttributesRelated($att_soccer);
            } else {
                $matchGameLineupRepository->selectAttributesRelated('soccer');
            }

            if ($request->has('filter')) {
                $matchGameLineupRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $matchGameLineupRepository->selectAttributes($request->att);
            }

            $result  = $matchGameLineupRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }

    
    }

    public function show($id)
    {
        try {
            $matchGameLineup = $this->matchGameLineup->with(['teamGameEdition', 'playerLineup', 'championshipRound'])->find($id);

            if ($matchGameLineup === null) {
                return response()->json(['error' => 'Match game lineup not found'], 404);
            }

            return $matchGameLineup;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve match game lineup'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();
            $matchGameLineup = $this->matchGameLineup->create($data);
            return response()->json([
                'msg' => 'Match game lineup created successfully',
                'matchGameLineup' => $matchGameLineup
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create match game lineup'], 500);
        }
    }

    public function update(Request $request, $id)
    {        
        try {
            $matchGameLineup = $this->matchGameLineup->find($id);

            if ($matchGameLineup === null) {
                return response()->json(['error' => 'Not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($matchGameLineup->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $matchGameLineup->feedback());
            } else {
                $request->validate($matchGameLineup->rules(), $matchGameLineup->feedback());
            }

            $matchGameLineup->update($request->all());

            return response()->json([
                'msg' => 'Updated successfully',
                'citie' => $matchGameLineup
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update'], 500);
        }
    
    }

    public function destroy($id)
    {
        try {
            $matchGameLineup = $this->matchGameLineup->find($id);

            if ($matchGameLineup === null) {
                return response()->json(['error' => 'Match game lineup not found'], 404);
            }

            $matchGameLineup->delete();

            return response()->json(['msg' => 'Match game lineup deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete match game lineup'], 500);
        }
    }
}
