<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PlayerEdition extends Model
{
    protected $table = 'player_editions';
    
    protected $fillable = [
        'player_id',
        'team_edition_id',
    ];

    public static function rules()
    {
        return [
            'player_id' => [
                'required',
                'exists:players,id',
                function ($attribute, $value, $fail) {
                    $teamEditionId = request()->input('team_edition_id');

                    $exists = PlayerEdition::where('team_edition_id', $teamEditionId)
                        ->where('player_id', $value)
                        ->exists();

                    if ($exists) {
                        $fail(__('validation.unique', ['attribute' => __('validation.attributes.player_id')]));
                    }
                },
            ],
            'team_edition_id' => 'required|exists:team_editions,id',
        ];
    }

    public static function feedback()
    {
        return [
            'player_id.required' => 'O ID do jogador é obrigatório.',
            'player_id.exists' => 'O ID do jogador selecionado é inválido.',
            'player_id.unique' => 'O jogador já está associado a esta edição de equipe.',
            'team_edition_id.required' => 'O ID da edição do time é obrigatório.',
            'team_edition_id.exists' => 'O ID da edição do time selecionada é inválido.',
        ];
    }


    public function player()
    {
        return $this->belongsTo(Player::class);
    }

    public function teamEdition()
    {
        return $this->belongsTo(TeamEdition::class);
    }
}
