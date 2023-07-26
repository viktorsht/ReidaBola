<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlayerGameScoreChampionshipEdition extends Model
{
    use HasFactory;

    protected $table = 'player_game_score_championship_editions';
    protected $primaryKey = 'id';
    public $timestamps = true;

    protected $fillable = [
        'score',
        'player_game_score_id',
        'championship_edition_id',
    ];

    public function rules()
    {
        return [
            'score' => 'required|numeric',
            'player_game_score_id' => 'required|exists:player_game_scores,id',
            'championship_edition_id' => 'required|exists:championship_editions,id',
        ];
    }

    public function feedback()
    {
        return [
            'score.required' => 'O campo "score" é obrigatório.',
            'score.numeric' => 'O campo "score" deve ser um valor numérico.',
            'player_game_score_id.required' => 'O campo "player_game_score_id" é obrigatório.',
            'player_game_score_id.exists' => 'O valor fornecido para o campo "player_game_score_id" não existe na tabela "player_game_scores".',
            'championship_edition_id.required' => 'O campo "championship_edition_id" é obrigatório.',
            'championship_edition_id.exists' => 'O valor fornecido para o campo "championship_edition_id" não existe na tabela "championship_editions".',
        ];
    }

    public function playerGameScore()
    {
        return $this->belongsTo(PlayerGameScore::class, 'player_game_score_id');
    }

    public function championshipEdition()
    {
        return $this->belongsTo(ChampionshipEdition::class, 'championship_edition_id');
    }
}
