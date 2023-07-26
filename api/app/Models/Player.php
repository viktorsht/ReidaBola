<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Player extends Model
{
    protected $table = 'players';
    
    protected $fillable = [
        'first_name',
        'last_name',
        'number',
        'position_id',
        'city_id',
    ];

    public static function rules()
    {
        return [
            'first_name' => 'required|string|max:35',
            'last_name' => 'required|string|max:35',
            'number' => 'required|integer',
            'position_id' => 'required|exists:position_players,id',
            'city_id' => 'required|exists:cities,id',
        ];
    }

    public static function feedback()
    {
        return [
            'first_name.required' => 'O primeiro nome é obrigatório.',
            'first_name.string' => 'O primeiro nome deve ser uma string.',
            'first_name.max' => 'O primeiro nome não pode exceder 35 caracteres.',
            'last_name.required' => 'O último nome é obrigatório.',
            'last_name.string' => 'O último nome deve ser uma string.',
            'last_name.max' => 'O último nome não pode exceder 35 caracteres.',
            'number.required' => 'O número é obrigatório.',
            'number.integer' => 'O número deve ser um valor inteiro.',
            'position_id.required' => 'A posição é obrigatória.',
            'position_id.exists' => 'A posição selecionada é inválida.',
            'city_id.required' => 'A cidade é obrigatória.',
            'city_id.exists' => 'A cidade selecionada é inválida.',
        ];
    }

    public function position()
    {
        return $this->belongsTo(PositionPlayer::class, 'position_id');
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }
}

