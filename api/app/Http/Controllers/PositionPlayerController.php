<?php

namespace App\Http\Controllers;

use App\Models\PositionPlayer;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\PositionPlayerRepository;


class PositionPlayerController extends Controller
{

    protected $positionPlayer;

    public function __construct(PositionPlayer $positionPlayer){
        $this->positionPlayer = $positionPlayer;
    }

    public function index(Request $request)
    {
        try{
            $positionPlayerRepository = new PositionPlayerRepository($this->positionPlayer);

            if ($request->has('filter')) {
                $positionPlayerRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $positionPlayerRepository->selectAttributes($request->att);
            }

            $result  = $positionPlayerRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $positionPlayer = $this->positionPlayer->findOrFail($id);
            return response()->json($positionPlayer, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Not found.'], 404);
        }
        
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, $this->positionPlayer->rules(), $this->positionPlayer->feedback());

            $positionPlayer = $this->positionPlayer->create($request->all());

            return response()->json($positionPlayer, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $positionPlayer = $this->positionPlayer->find($id);

            if ($positionPlayer === null) {
                return response()->json(['error' => 'Not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($positionPlayer->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $positionPlayer->feedback());
            } else {
                $request->validate($positionPlayer->rules(), $positionPlayer->feedback());
            }

            $positionPlayer->update($request->all());

            return response()->json([
                'msg' => 'Updated successfully',
                'citie' => $positionPlayer
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $positionPlayer = $this->positionPlayer->findOrFail($id);
            
            $positionPlayer->delete();

            return response()->json(['message' => 'Posição do jogador removida com sucesso.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Erro ao remover a posição do jogador.'], 500);
        }
    }
}

