<?php

namespace App\Http\Controllers;

use App\Models\SoccerMatch;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\SoccerMatchRepository;
use Carbon\Carbon;

class SoccerMatchController extends Controller
{
    private $soccerMatch;

    public function __construct(SoccerMatch $soccerMatch)
    {
        $this->soccerMatch = $soccerMatch;
    }

    // public function index()
    // {
    //     try {
    //         $matches = $this->soccerMatch->with(['team1Edition.team', 'team2Edition.team', 'championshipEdition', 'stadiumFootball', 'championshipRound'])->get();
    //         return $matches;
    //     } catch (\Exception $e) {
    //         return response()->json(['error' => 'Failed to retrieve soccer matches'], 500);
    //     }
    // }

    public function index(Request $request)
    {
        try{
            $soccerMatchRepository = new SoccerMatchRepository($this->soccerMatch);

            $soccerMatchRepository->selectAttributesRelated([
                'team1Edition.team',
                'team2Edition.team',
                'championshipEdition.championship',
                'stadiumFootball',
                'championshipRound'
            ]);

            if ($request->has('filter')) {
                $soccerMatchRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $soccerMatchRepository->selectAttributes($request->att);
            }

            $result  = $soccerMatchRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function next(Request $request){
        $dateInput = $request->input('date');
        
        try {
            $date = Carbon::createFromFormat('Y-m-d', $dateInput);
            // Ajuste a data de referência para incluir o horário atual (usando o horário atual do servidor)
            $date = $date->setTime($date->hour, $date->minute, $date->second);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Invalid date. Be sure to provide the date in Y-m-d format.'], 400);
        }

        // Consulta para obter o jogo mais próximo da data de referência
        $result = $this->soccerMatch
            ->orderByRaw("ABS(TIMESTAMPDIFF(SECOND, date_time, '{$date}'))")
            ->with('championshipRound')
            ->first();
        // echo $date;
        
        return response()->json( $result, 200 );
    }

    public function show($id)
    {
        try {
            $match = $this->soccerMatch->with(['team1Edition.team', 'team2Edition.team', 'championshipEdition', 'stadiumFootball', 'championshipRound'])->find($id);

            if ($match === null) {
                return response()->json(['error' => 'Soccer match not found'], 404);
            }

            return $match;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve soccer match'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();
            $match = $this->soccerMatch->create($data);
            return response()->json([
                'msg' => 'Soccer match created successfully',
                'match' => $match
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create soccer match'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $match = $this->soccerMatch->find($id);

            if ($match === null) {
                return response()->json(['error' => 'Soccer match not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($match->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $match->feedback());
            } else {
                $request->validate($match->rules(), $match->feedback());
            }

            $match->update($request->all());

            return response()->json([
                'msg' => 'Soccer match updated successfully',
                'match' => $match
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update soccer match'], 500);
        }
    }


    public function destroy($id)
    {
        try {
            $match = $this->soccerMatch->find($id);

            if ($match === null) {
                return response()->json(['error' => 'Soccer match not found'], 404);
            }

            $match->delete();

            return response()->json(['msg' => 'Soccer match deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete soccer match'], 500);
        }
    }
}
