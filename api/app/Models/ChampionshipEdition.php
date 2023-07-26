<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChampionshipEdition extends Model
{
    use HasFactory;

    protected $table = 'championship_editions';

    protected $fillable = [
        'year',
        'start',
        'end',
        'championship_id',
    ];

    protected $dates = [
        'start',
        'end',
    ];

    public function championship()
    {
        return $this->belongsTo(Championship::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public static function rules()
    {
        return [
            'year' => 'required|date',
            'start' => 'required|date',
            'end' => 'required|date',
            'championship_id' => 'required|exists:championships,id',
        ];
    }

    public static function feedback()
    {
        return [
            'year.required' => 'O ano é obrigatório.',
            'year.date' => 'O ano deve estar no formato de data.',
            'start.required' => 'A data de início é obrigatória.',
            'start.date' => 'A data de início deve estar no formato de data.',
            'end.required' => 'A data de término é obrigatória.',
            'end.date' => 'A data de término deve estar no formato de data.',
            'championship_id.required' => 'O ID do campeonato é obrigatório.',
            'championship_id.exists' => 'O campeonato selecionado não existe.',
        ];
    }
}
