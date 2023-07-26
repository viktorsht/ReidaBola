<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeamEdition extends Model
{
    protected $table = 'team_editions';
    protected $fillable = [
        'team_id',
        'championship_edition_id',
        'coach_id'
    ];

    public function team()
    {
        return $this->belongsTo(Team::class);
    }

    public function championshipEdition()
    {
        return $this->belongsTo(ChampionshipEdition::class);
    }

    public function coach()
    {
        return $this->belongsTo(Coach::class);
    }

    public function rules()
    {
        return [
            'team_id' => 'required|exists:teams,id',
            'championship_edition_id' => 'required|exists:championship_editions,id',
            'coach_id' => 'required|exists:coaches,id'
        ];
    }

    public function feedback()
    {
        return [
            'team_id.required' => 'The team ID is required.',
            'team_id.exists' => 'The selected team ID does not exist.',
            'championship_edition_id.required' => 'The championship edition ID is required.',
            'championship_edition_id.exists' => 'The selected championship edition ID does not exist.',
            'coach_id.required' => 'The coach ID is required.',
            'coach_id.exists' => 'The selected coach ID does not exist.'
        ];
    }
}

