<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StadiumFootball extends Model
{
    use HasFactory;
    
    protected $table = 'stadium_footballs';

    protected $fillable = [
        'name',
        'city_id',
    ];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id', 'id');
    }

    public static function rules()
    {
        return [
            'name' => 'required|max:35|unique:stadium_footballs',
            'city_id' => 'required|exists:cities,id',
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O nome do estádio é obrigatório.',
            'name.max' => 'O nome do estádio deve ter no máximo :max caracteres.',
            'name.unique' => 'O nome do estádio já está em uso.',
            'city_id.required' => 'O ID da cidade é obrigatório.',
            'city_id.exists' => 'A cidade selecionada não existe.',
        ];
    }
}

