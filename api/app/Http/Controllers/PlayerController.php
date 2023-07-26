<?php

namespace App\Http\Controllers;

use App\Models\Player;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use App\Repositories\PlayerRepository;

class PlayerController extends Controller
{

    protected $player;

    public function __construct(Player $player){
        $this->player = $player;
    }

    public function index(Request $request)
    {
        try{
            $playerRepository = new PlayerRepository($this->player);

            $playerRepository
                ->selectAttributesRelated([
                    'position',
                    'city'
                ]);

            if ($request->has('filter')) {
                $playerRepository->filter($request->filter);                
            }

            if($request->has('att')){
                $playerRepository->selectAttributes($request->att);
            }

            $result  = $playerRepository->getResult();
            return response()->json( $result, 200 );
        }catch (\Exception $e) {
            return response()->json(['error' => 'An error occurred while processing the request.'], 500);
        }
    }

    public function show($id)
    {
        try {
            $player = $this->player
                ->with([
                    'position',
                    'city'
                ])->findOrFail($id);
                
            return response()->json($player, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Not found.'], 404);
        }
    }

    public function store(Request $request)
    {
        try {
            $this->validate($request, Player::rules(), Player::feedback());
            
            $player = Player::create($request->all());
            
            return response()->json($player, 201);
        } catch (ValidationException $e) {
            return response()->json(['error' => $e->errors()], 400);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error creating player.'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $player = $this->player->find($id);

            if ($player === null) {
                return response()->json(['error' => 'Not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($player->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $player->feedback());
            } else {
                $request->validate($player->rules(), $player->feedback());
            }

            $player->update($request->all());

            return response()->json([
                'msg' => 'Updated successfully',
                'citie' => $player
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $player = Player::findOrFail($id);
            
            $player->delete();

            return response()->json(['message' => 'Player removed successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error removing palyer.'], 500);
        }
    }
}

