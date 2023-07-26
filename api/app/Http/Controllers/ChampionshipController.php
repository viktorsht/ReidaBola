<?php

namespace App\Http\Controllers;

use App\Models\Championship;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\ChampionshipRepository;



class ChampionshipController extends Controller
{
    protected $championship;

    public function __construct(Championship $championship)
    {
        $this->championship = $championship;
    }

    public function index(Request $request)
    {
        $championshipRepository = new ChampionshipRepository($this->championship);

        try {
            if ($request->has('att_city')) {
                $att_city = 'city:id,' . $request->att_city;
                $championshipRepository->selectAttributesRelated($att_city);
            } else {
                $championshipRepository->selectAttributesRelated('city');
            }

            if ($request->has('filter')) {
                $championshipRepository->filter($request->filter);
            }

            if ($request->has('att')) {
                $championshipRepository->selectAttributes($request->att);
            }

            $result = $championshipRepository->getResult();
            return response()->json($result, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $championship = $this->championship->with('city')->find($id);

            if ($championship === null) {
                return response()->json(['error' => 'Championship not found.'], 404);
            }

            return response()->json($championship, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while retrieving the championship.'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->championship->rules(), $this->championship->feedback());

            $teamGame = $this->championship->create($request->all());

            return response()->json($teamGame, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating team edition.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $championship = $this->championship->find($id);

        if ($championship === null) {
            return response()->json(['error' => 'Campeonato não encontrado.'], 404);
        } else {
            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($this->championship->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }
                $this->validate($request, $rules, $this->championship->feedback());
            } else {
                $this->validate($request, $this->championship->rules(), $this->championship->feedback());
            }

            $championship->update($request->all());
        }

        return response()->json($championship);
    }

    public function destroy($id)
    {
        try {
            $championship = $this->championship->find($id);

            if ($championship === null) {
                return response()->json(['error' => 'Championship not found.'], 404);
            }

            $championship->delete();

            return response()->json(['message' => 'Championship successfully removed.'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while removing the championship.'], 500);
        }
    }

}
