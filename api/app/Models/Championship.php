<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Championship extends Model
{
    use HasFactory;

    protected $table = 'championships';

    protected $fillable = [
        'name',
        'city_id',
    ];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public static function rules()
    {
        return [
            'name' => 'required|max:35|unique:championships',
            'city_id' => 'required|exists:cities,id',
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O nome do campeonato é obrigatório.',
            'name.max' => 'O nome do campeonato deve ter no máximo :max caracteres.',
            'name.unique' => 'O nome do campeonato já está em uso.',
            'city_id.required' => 'O ID da cidade é obrigatório.',
            'city_id.exists' => 'A cidade selecionada não existe.',
        ];
    }
    
}
