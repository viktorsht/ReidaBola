<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchCardsStats extends Model
{
    use HasFactory;

    protected $table = 'match_cards_stats';
    public $timestamps = true;

    protected $fillable = [
        'minute',
        'card_yellow',
        'card_red',
        'soccer_match_id',
        'player_commit_id',
        'player_suffer_id',
    ];

    public function rules()
    {
        return [
            'minute' => 'required|integer',
            'card_yellow' => 'boolean',
            'card_red' => 'boolean',
            'soccer_match_id' => 'required|exists:soccer_matches,id',
            'player_commit_id' => 'required|exists:match_lineup,id',
            'player_suffer_id' => 'required|exists:match_lineup,id',
        ];
    }

    public function feedback()
    {
        return [
            'minute.required' => 'O campo "minute" é obrigatório.',
            'minute.integer' => 'O campo "minute" deve ser um número inteiro.',
            'card_yellow.boolean' => 'O campo "card_yellow" deve ser booleano.',
            'card_red.boolean' => 'O campo "card_red" deve ser booleano.',
            'soccer_match_id.required' => 'O campo "soccer_match_id" é obrigatório.',
            'soccer_match_id.exists' => 'O valor fornecido para o campo "soccer_match_id" não existe na tabela "soccer_matches".',
            'player_commit_id.required' => 'O campo "player_commit_id" é obrigatório.',
            'player_commit_id.exists' => 'O valor fornecido para o campo "player_commit_id" não existe na tabela "match_lineup".',
            'player_suffer_id.required' => 'O campo "player_suffer_id" é obrigatório.',
            'player_suffer_id.exists' => 'O valor fornecido para o campo "player_suffer_id" não existe na tabela "match_lineup".',
        ];
    }

    public function soccerMatch()
    {
        return $this->belongsTo(SoccerMatch::class, 'soccer_match_id');
    }

    public function playerCommit()
    {
        return $this->belongsTo(MatchLineup::class, 'player_commit_id');
    }

    public function playerSuffer()
    {
        return $this->belongsTo(MatchLineup::class, 'player_suffer_id');
    }
}
