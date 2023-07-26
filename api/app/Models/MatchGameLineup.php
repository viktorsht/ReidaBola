<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchGameLineup extends Model
{
    use HasFactory;

    protected $table = 'match_game_lineups';

    protected $fillable = [
        'team_game_edition_id',
        'player_lineup_id',
        'championship_round_id',
        'status'
    ];

    public function rules()
    {
        return [
            'team_game_edition_id' => 'required|integer|exists:team_game_editions,id',
            'player_lineup_id' => 'required|integer|exists:match_lineup,id',
            'championship_round_id' => 'required|integer|exists:championship_rounds,id',
            'status' => 'required|boolean'
        ];
    }

    public static function feedback()
    {
        return [
            'team_game_edition_id.required' => 'O campo team_game_edition_id é obrigatório.',
            'team_game_edition_id.integer' => 'O campo team_game_edition_id deve ser um número inteiro.',
            'team_game_edition_id.exists' => 'O valor do campo team_game_edition_id não existe na tabela de team_game_editions.',
            'player_lineup_id.required' => 'O campo player_lineup_id é obrigatório.',
            'player_lineup_id.integer' => 'O campo player_lineup_id deve ser um número inteiro.',
            'player_lineup_id.exists' => 'O valor do campo player_lineup_id não existe na tabela de match_lineup.',
            'championship_round_id.required' => 'O campo championship_round_id é obrigatório.',
            'championship_round_id.integer' => 'O campo championship_round_id deve ser um número inteiro.',
            'championship_round_id.exists' => 'O valor do campo championship_round_id não existe na tabela de championship_rounds.',
            'status.required' => 'O campo status é obrigatório.',
            'status.boolean' => 'O campo status deve ser um valor booleano.'
        ];
    }

    public function teamGameEdition()
    {
        return $this->belongsTo(TeamGameEdition::class, 'team_game_edition_id');
    }

    public function playerLineup()
    {
        return $this->belongsTo(MatchLineup::class, 'player_lineup_id');
    }

    public function championshipRound()
    {
        return $this->belongsTo(ChampionshipRound::class, 'championship_round_id');
    }
}
