<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MatchLineup extends Model
{
    use HasFactory;

    protected $table = 'match_lineup';
    protected $fillable = [
        'player_edition_id',
        'soccer_match_id',
        'status_lineup_id'
    ];

    public function playerEdition()
    {
        return $this->belongsTo(PlayerEdition::class, 'player_edition_id');
    }

    public function soccerMatch()
    {
        return $this->belongsTo(SoccerMatch::class, 'soccer_match_id');
    }

    public function statusLineup()
    {
        return $this->belongsTo(StatusLineup::class, 'status_lineup_id');
    }

    public function rules()
    {
        return [
            'player_edition_id' => 'required|exists:player_editions,id',
            'soccer_match_id' => 'required|exists:soccer_matches,id',
            'status_lineup_id' => 'required|exists:status_lineups,id',
        ];
    }

    public function feedback()
    {
        return [
            'player_edition_id.required' => 'Player edition ID is required.',
            'player_edition_id.exists' => 'Invalid player edition ID.',
            'soccer_match_id.required' => 'Soccer match ID is required.',
            'soccer_match_id.exists' => 'Invalid soccer match ID.',
            'status_lineup_id.required' => 'Status lineup ID is required.',
            'status_lineup_id.exists' => 'Invalid status lineup ID.',
        ];
    }


}
