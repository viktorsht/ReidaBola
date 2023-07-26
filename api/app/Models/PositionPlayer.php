<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PositionPlayer extends Model
{
    use HasFactory;

    protected $table = 'position_players';

    protected $fillable = [
        'name',
        'abb',
    ];

    public static function rules()
    {
        return [
            'name' => 'required|string|max:35|unique:position_players',
            'abb' => 'required|string|size:3|unique:position_players',
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O nome é obrigatório.',
            'name.string' => 'O nome deve ser uma string.',
            'name.max' => 'O nome não pode exceder 35 caracteres.',
            'name.unique' => 'O nome já está em uso.',
            'abb.required' => 'A abreviação é obrigatória.',
            'abb.string' => 'A abreviação deve ser uma string.',
            'abb.size' => 'A abreviação deve ter 3 caracteres.',
            'abb.unique' => 'A abreviação já está em uso.',
        ];
    }
}
