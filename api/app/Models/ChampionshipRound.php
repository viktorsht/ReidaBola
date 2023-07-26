<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChampionshipRound extends Model
{
    use HasFactory;

    protected $table = 'championship_rounds';

    protected $fillable = [
        'name',
        'round',
    ];

    public static function rules()
    {
        return [
            'name' => 'required|string|max:25',
            'round' => 'required|integer',
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O nome da rodada é obrigatório.',
            'name.string' => 'O nome da rodada deve ser uma string.',
            'name.max' => 'O nome da rodada deve ter no máximo 25 caracteres.',
            'round.required' => 'O número da rodada é obrigatório.',
            'round.integer' => 'O número da rodada deve ser um número inteiro.',
        ];
    }

}
