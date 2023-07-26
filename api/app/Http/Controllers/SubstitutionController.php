<?php

namespace App\Http\Controllers;

use App\Models\Substitution;
use Illuminate\Http\Request;

class SubstitutionController extends Controller
{
    private $substitution;

    public function __construct(Substitution $substitution)
    {
        $this->substitution = $substitution;
    }

    public function index()
    {
        try {
            $substitutions = $this->substitution->all();
            return $substitutions;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve substitutions'], 500);
        }
    }

    public function show($id)
    {
        try {
            $substitution = $this->substitution->find($id);

            if ($substitution === null) {
                return response()->json(['error' => 'Substitution not found'], 404);
            }

            return $substitution;
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to retrieve substitution'], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();

            $substitution = new Substitution([
                'minute' => isset($data['minute']) ? $data['minute'] : null,
                'soccer_match_id' => isset($data['soccer_match_id']) ? $data['soccer_match_id'] : null,
                'team_edition_id' => isset($data['team_edition_id']) ? $data['team_edition_id'] : null,
                'player_in_id' => isset($data['player_in_id']) ? $data['player_in_id'] : null,
                'player_out_id' => isset($data['player_out_id']) ? $data['player_out_id'] : null,
            ]);

            $substitution->save();

            return response()->json([
                'msg' => 'Substitution created successfully',
                'substitution' => $substitution
            ], 201);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create substitution'], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $substitution = $this->substitution->find($id);

            if ($substitution === null) {
                return response()->json(['error' => 'Substitution not found'], 404);
            }

            if ($request->method() === "PATCH") {
                $requestData = $request->all();

                $rules = array();
                foreach ($substitution->rules() as $input => $rule) {
                    if (array_key_exists($input, $requestData)) {
                        $rules[$input] = $rule;
                    }
                }

                $request->validate($rules, $substitution->feedback());
            } else {
                $request->validate($substitution->rules(), $substitution->feedback());
            }

            $substitution->update($request->all());

            return response()->json([
                'msg' => 'Substitution updated successfully',
                'substitution' => $substitution
            ], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update substitution'], 500);
        }
    }

    public function destroy($id)
    {
        try {
            $substitution = $this->substitution->find($id);

            if ($substitution === null) {
                return response()->json(['error' => 'Substitution not found'], 404);
            }

            $substitution->delete();

            return response()->json(['msg' => 'Substitution deleted successfully'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete substitution'], 500);
        }
    }
}
