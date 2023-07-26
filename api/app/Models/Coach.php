<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coach extends Model
{
    use HasFactory;

    protected $table = 'coaches';

    protected $fillable = [
        'first_name',
        'last_name',
        'city_id',
    ];

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public static function rules()
    {
        return [
            'first_name' => 'required|string|max:35',
            'last_name' => 'required|string|max:35',
            'city_id' => 'required|exists:cities,id',
        ];
    }

    public static function feedback()
    {
        return [
            'first_name.required' => 'O primeiro nome é obrigatório.',
            'first_name.string' => 'O primeiro nome deve ser uma string.',
            'first_name.max' => 'O primeiro nome não pode exceder 35 caracteres.',
            'last_name.required' => 'O sobrenome é obrigatório.',
            'last_name.string' => 'O sobrenome deve ser uma string.',
            'last_name.max' => 'O sobrenome não pode exceder 35 caracteres.',
            'city_id.required' => 'O ID da cidade é obrigatório.',
            'city_id.exists' => 'A cidade selecionada não existe.',
        ];
    }
}
