<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlayerGameScore extends Model
{
    use HasFactory;

    protected $table = 'player_game_scores';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'name',
    ];

    public function rules()
    {
        return [
            'name' => 'required|string|max:35',
        ];
    }

    public function feedback()
    {
        return [
            'name.required' => 'O campo "name" é obrigatório.',
            'name.string' => 'O campo "name" deve ser uma string.',
            'name.max' => 'O campo "name" deve ter no máximo 35 caracteres.',
        ];
    }

}
