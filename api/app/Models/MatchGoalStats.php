<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchGoalStats extends Model
{
    use HasFactory;

    protected $table = 'match_goal_stats';
    public $timestamps = true;

    protected $fillable = [
        'minute',
        'awn',
        'soccer_match_id',
        'player_goal_id',
        'player_assist_id',
    ];

    public function rules()
    {
        return [
            'minute' => 'required|integer',
            'awn' => 'boolean',
            'soccer_match_id' => 'required|exists:soccer_matches,id',
            'player_goal_id' => 'required|exists:match_lineup,id',
            'player_assist_id' => 'nullable|exists:match_lineup,id',
        ];
    }

    public function feedback()
    {
        return [
            'minute.required' => 'O campo "minute" é obrigatório.',
            'minute.integer' => 'O campo "minute" deve ser um número inteiro.',
            'awn.boolean' => 'O campo "awn" deve ser booleano.',
            'soccer_match_id.required' => 'O campo "soccer_match_id" é obrigatório.',
            'soccer_match_id.exists' => 'O valor fornecido para o campo "soccer_match_id" não existe na tabela "soccer_matches".',
            'player_goal_id.required' => 'O campo "player_goal_id" é obrigatório.',
            'player_goal_id.exists' => 'O valor fornecido para o campo "player_goal_id" não existe na tabela "match_lineup".',
            'player_assist_id.exists' => 'O valor fornecido para o campo "player_assist_id" não existe na tabela "match_lineup".',
        ];
    }

    public function soccerMatch()
    {
        return $this->belongsTo(SoccerMatch::class, 'soccer_match_id');
    }

    public function playerGoal()
    {
        return $this->belongsTo(MatchLineup::class, 'player_goal_id');
    }

    public function playerAssist()
    {
        return $this->belongsTo(MatchLineup::class, 'player_assist_id');
    }
}
