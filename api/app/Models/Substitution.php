<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Substitution extends Model
{
    protected $table = 'substitutions';
    public $timestamps = true;

    protected $fillable = [
        'minute',
        'soccer_match_id',
        'team_edition_id',
        'player_in_id',
        'player_out_id',
    ];

    public function rules()
    {
        return [
            'minute' => 'required|integer',
            'soccer_match_id' => 'required|exists:soccer_matches,id',
            'team_edition_id' => 'required|exists:team_editions,id',
            'player_in_id' => 'required|exists:match_lineup,id',
            'player_out_id' => 'required|exists:match_lineup,id',
        ];
    }

    public function feedback()
    {
        return [
            'minute.required' => 'O campo "minute" é obrigatório.',
            'minute.integer' => 'O campo "minute" deve ser um número inteiro.',
            'soccer_match_id.required' => 'O campo "soccer_match_id" é obrigatório.',
            'soccer_match_id.exists' => 'O valor fornecido para o campo "soccer_match_id" não existe na tabela "soccer_matches".',
            'team_edition_id.required' => 'O campo "team_edition_id" é obrigatório.',
            'team_edition_id.exists' => 'O valor fornecido para o campo "team_edition_id" não existe na tabela "team_editions".',
            'player_in_id.required' => 'O campo "player_in_id" é obrigatório.',
            'player_in_id.exists' => 'O valor fornecido para o campo "player_in_id" não existe na tabela "match_lineup".',
            'player_out_id.required' => 'O campo "player_out_id" é obrigatório.',
            'player_out_id.exists' => 'O valor fornecido para o campo "player_out_id" não existe na tabela "match_lineup".',
        ];
    }

    public function soccerMatch()
    {
        return $this->belongsTo(SoccerMatch::class, 'soccer_match_id');
    }

    public function teamEdition()
    {
        return $this->belongsTo(TeamEdition::class, 'team_edition_id');
    }

    public function playerIn()
    {
        return $this->belongsTo(MatchLineup::class, 'player_in_id');
    }

    public function playerOut()
    {
        return $this->belongsTo(MatchLineup::class, 'player_out_id');
    }
}
