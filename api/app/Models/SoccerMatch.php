<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SoccerMatch extends Model
{
    use HasFactory;

    protected $table = 'soccer_matches';

    protected $fillable = [
        'team1_edition_id',
        'team2_edition_id',
        'championship_edition_id',
        'stadium_football_id',
        'championship_round_id',
    ];

    public static function rules()
    {
        return [
            'team1_edition_id' => 'required|exists:team_editions,id',
            'team2_edition_id' => 'required|exists:team_editions,id',
            'championship_edition_id' => 'required|exists:championship_editions,id',
            'stadium_football_id' => 'required|exists:stadium_footballs,id',
            'championship_round_id' => 'required|exists:championship_rounds,id',
        ];
    }

    public static function feedback()
    {
        return [
            'team1_edition_id.required' => 'O ID da equipe 1 da edição é obrigatório.',
            'team1_edition_id.exists' => 'O ID da equipe 1 da edição selecionada não existe.',
            'team2_edition_id.required' => 'O ID da equipe 2 da edição é obrigatório.',
            'team2_edition_id.exists' => 'O ID da equipe 2 da edição selecionada não existe.',
            'championship_edition_id.required' => 'O ID da edição do campeonato é obrigatório.',
            'championship_edition_id.exists' => 'O ID da edição do campeonato selecionada não existe.',
            'stadium_football_id.required' => 'O ID do estádio de futebol é obrigatório.',
            'stadium_football_id.exists' => 'O ID do estádio de futebol selecionado não existe.',
            'championship_round_id.required' => 'O ID da rodada do campeonato é obrigatório.',
            'championship_round_id.exists' => 'O ID da rodada do campeonato selecionada não existe.',
        ];
    }

    public function team1Edition()
    {
        return $this->belongsTo(TeamEdition::class, 'team1_edition_id');
    }

    public function team2Edition()
    {
        return $this->belongsTo(TeamEdition::class, 'team2_edition_id');
    }

    public function championshipEdition()
    {
        return $this->belongsTo(ChampionshipEdition::class);
    }

    public function stadiumFootball()
    {
        return $this->belongsTo(StadiumFootball::class);
    }

    public function championshipRound()
    {
        return $this->belongsTo(ChampionshipRound::class);
    }
}
