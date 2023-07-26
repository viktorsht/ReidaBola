<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeamGameEdition extends Model
{
    use HasFactory;

    protected $table = 'team_game_editions';

    protected $fillable = [
        'team_game_id',
        'championship_edition_id'
    ];

    public function rules()
    {
        return [
            'team_game_id' => 'required|integer|exists:team_games,id',
            'championship_edition_id' => 'required|integer|exists:championship_editions,id'
        ];
    }

    public static function feedback()
    {
        return [
            'team_game_id.required' => 'O campo team_game_id é obrigatório.',
            'team_game_id.integer' => 'O campo team_game_id deve ser um número inteiro.',
            'team_game_id.exists' => 'O valor do campo team_game_id não existe na tabela de team_games.',
            'championship_edition_id.required' => 'O campo championship_edition_id é obrigatório.',
            'championship_edition_id.integer' => 'O campo championship_edition_id deve ser um número inteiro.',
            'championship_edition_id.exists' => 'O valor do campo championship_edition_id não existe na tabela de championship_editions.'
        ];
    }

    public function teamGame()
    {
        return $this->belongsTo(TeamGame::class, 'team_game_id');
    }

    public function championshipEdition()
    {
        return $this->belongsTo(ChampionshipEdition::class, 'championship_edition_id');
    }
}
