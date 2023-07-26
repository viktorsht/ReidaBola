<?php

namespace App\Http\Controllers;

use App\Models\PlayerEdition;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\PlayerEditionRepository;

class PlayerEditionController extends Controller
{
    protected $playerEdition;

    public function __construct(PlayerEdition $playerEdition)
    {
        $this->playerEdition = $playerEdition;
    }

    public function index(Request $request)
    {
        try{
            $playerEditionRepository = new PlayerEditionRepository($this->playerEdition);
            
            $playerEditionRepository
                ->selectAttributesRelated([
                    'player.position', 
                    'teamEdition.team'
                ]);

            if ($request->has('filter')) {
                $playerEditionRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $playerEditionRepository->selectAttributes($request->att);
            }

            $result  = $playerEditionRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $playerEdition = $this->playerEdition->with('player.position', 'teamEdition.team')->findOrFail($id);

            return response()->json($playerEdition, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Player edition not found.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->playerEdition->rules(), $this->playerEdition->feedback());

            $playerEdition = $this->playerEdition->create($request->all());

            return response()->json($playerEdition, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error created player edition.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $playerEdition = $this->playerEdition->findOrFail($id);

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($this->playerEdition->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $this->validate($request, $rules, $this->playerEdition->feedback());
            } else {
                $this->validate($request, $this->playerEdition->rules(), $this->playerEdition->feedback());
            }

            $playerEdition->update($request->all());

            return response()->json($playerEdition);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao atualizar edição de jogador.'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $playerEdition = $this->playerEdition->findOrFail($id);

            $playerEdition->delete();

            return response()->json(['message' => 'Player edition removed success.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error removing player edition'], 500);
        }
    }
}
