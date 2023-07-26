<?php

namespace App\Http\Controllers;

use App\Models\City;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\CityRepository;

class CityController extends Controller
{
    protected $citie;

    public function __construct(City $citie){
        $this->citie = $citie;
    }

    public function index(Request $request)
    {
        try{
            $cityRepository = new CityRepository($this->citie);

            if ($request->has('att_state')) {
                $att_state = 'state:id,' .  $request->att_state;
                $cityRepository->selectAttributesRelated($att_state);
            } else {
                $cityRepository->selectAttributesRelated('state');
            }

            if ($request->has('filter')) {
                $cityRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $cityRepository->selectAttributes($request->att);
            }

            $result  = $cityRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $citie = $this->citie->with('state')->findOrFail($id);
            return response()->json($citie, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Not found.'], 404);
        }
        
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->citie->rules(), $this->citie->feedback());

            $citie = $this->citie->create($request->all());

            return response()->json($citie, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $citie = $this->citie->find($id);

            if ($citie === null) {
                return response()->json(['error' => 'Not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($citie->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $citie->feedback());
            } else {
                $request->validate($citie->rules(), $citie->feedback());
            }

            $citie->update($request->all());

            return response()->json([
                'msg' => 'Updated successfully',
                'citie' => $citie
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $result = $this->citie->find($id);
            $result = ($result === null) ? 0 : $result->delete();
            return $result ? response()->json(['message' => 'Successfully removed.'], 200) : response()->json(['error' => 'No data found.'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while removing.'], 500);
        }
    }
}
