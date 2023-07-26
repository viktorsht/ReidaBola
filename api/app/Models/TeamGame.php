<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TeamGame extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'abb',
        'user_id'
    ];

    public function rules()
    {
        return [
            'name' => 'required|string|min:5|max:50|unique:team_games',
            'abb' => 'required|string|unique:team_games|max:3',
            'user_id' => 'required|integer|exists:users,id|unique:team_games'
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O campo nome é obrigatório.',
            'name.string' => 'O campo nome deve ser uma string.',
            'name.min' => 'O campo nome deve ter no mínimo 5 caracteres.',
            'name.max' => 'O campo nome deve ter no máximo 50 caracteres.',
            'name.unique' => 'O valor do campo nome já está sendo usado.',
            'abb.required' => 'O campo abrevação é obrigatório.',
            'abb.string' => 'O campo abrevação deve ser uma string.',
            'abb.max' => 'O campo abrevação deve ter no máximo 3 caracteres.',
            'abb.unique' => 'O valor do campo abrevação já está sendo usado.',
            'user_id.required' => 'O campo user_id é obrigatório.',
            'user_id.integer' => 'O campo user_id deve ser um número inteiro.',
            'user_id.exists' => 'O valor do campo user_id não existe na tabela de usuários.',
            'user_id.unique' => 'Usuário já possue equipe virtual.',
        ];
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    
}
