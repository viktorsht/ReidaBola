<?php

namespace App\Http\Controllers;

use App\Models\ChampionshipEdition;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\ChampionshipEditionRepository;

class ChampionshipEditionController extends Controller
{
    protected $championshipEdition;

    public function __construct(ChampionshipEdition $championshipEdition)
    {
        $this->championshipEdition = $championshipEdition;
    }

    public function index(Request $request)
    {
        try {
            $championshipEditionRepository = new ChampionshipEditionRepository($this->championshipEdition);

            if ($request->has('att_championship')) {
                $att_championship = 'championship:id,' . $request->att_championship;
                $championshipEditionRepository->selectAttributesRelated($att_championship);
            } else {
                $championshipEditionRepository
                    ->selectAttributesRelated([
                        'championship',
                        'championship.city'
                    ]);
            }

            if ($request->has('filter')) {
                $championshipEditionRepository->filter($request->filter);
            }

            if ($request->has('att')) {
                $championshipEditionRepository->selectAttributes($request->att);
            }

            $result = $championshipEditionRepository->getResult();
            return response()->json($result, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while fetching championship editions.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $championshipEdition = $this->championshipEdition
                ->with([
                    'championship',
                    'championship.city'
                ])->find($id);

            if ($championshipEdition === null) {
                return response()->json(['error' => 'Championship edition not found.'], 404);
            }

            return response()->json($championshipEdition, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while fetching championship edition.'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->championshipEdition->rules(), $this->championshipEdition->feedback());

            $championshipEdition = $this->championshipEdition->create($request->all());

            return response()->json($championshipEdition, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating championship edition.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $championshipEdition = $this->championshipEdition->find($id);

        if ($championshipEdition === null) {
            return response()->json(['error' => "Championship edition not found."], 404);
        } else {
            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($this->championshipEdition->rules($id) as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }
                $this->validate($request, $rules, $this->championshipEdition->feedback());
            } else {
                $this->validate($request, $this->championshipEdition->rules(), $this->championshipEdition->feedback());
            }

            $championshipEdition->update($request->all());
        }

        return response()->json($championshipEdition);
    }

    public function destroy($id)
    {
        try {
            $championshipEdition = $this->championshipEdition->find($id);
            $championshipEdition = ($championshipEdition === null) ? 0 : $championshipEdition->delete();
            return $championshipEdition ? response()->json(['message' => 'Successfully removed.'], 200) : response()->json(['error' => 'No data found.'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while removing the championship edition.'], 500);
        }
    }

}
