<?php

namespace App\Http\Controllers;

use App\Models\Coach;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\CoachRepository;

class CoachController extends Controller
{
    protected $coach;
    
    public function __construct(Coach $coach)
    {
        $this->coach = $coach;
    }

    public function index(Request $request){
        try{
            $coachRepository = new CoachRepository($this->coach);

            if ($request->has('att_city')) {
                $att_city = 'city:id,' .  $request->att_city;
                $coachRepository->selectAttributesRelated($att_city);
            } else {
                $coachRepository->selectAttributesRelated('city');
            }

            if ($request->has('filter')) {
                $coachRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $coachRepository->selectAttributes($request->att);
            }

            $result  = $coachRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $citie = $this->coach->with('city')->findOrFail($id);
            return response()->json($citie, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Not found.'], 404);
        }
        
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->coach->rules(), $this->coach->feedback());
            
            $coach = $this->coach->create($request->all());
            
            return response()->json($coach, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao criar o técnico.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        // try {
        //     $coach = $this->coach->findOrFail($id);

        //     $this->validate($request, $this->coach->rules(), $this->coach->feedback());

        //     $coach->update($request->all());

        //     return response()->json($coach);
        // } catch (ValidationException $e) {
        //     return response()->json(['error' => $e->errors()], 400);
        // } catch (\Exception $e) {
        //     return response()->json(['error' => 'Erro ao atualizar o técnico.'], 500);
        // }
        
        try {
            $coach = $this->coach->find($id);

            if ($coach === null) {
                return response()->json(['error' => 'Coach not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($coach->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $coach->feedback());
            } else {
                $request->validate($coach->rules(), $coach->feedback());
            }

            $coach->update($request->all());

            return response()->json($coach, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update coach'], 500);
        }
    
    }

    public function destroy($id)
    {
        try {
            $coach = $this->coach->findOrFail($id);
            
            $coach->delete();

            return response()->json(['message' => 'Coach successfully removed.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error removing coach.'], 500);
        }
    }
}
