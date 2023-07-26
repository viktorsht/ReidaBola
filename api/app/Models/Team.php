<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use HasFactory;

    protected $table = 'teams';
    protected $fillable = ['name', 'abb', 'championship_id'];

    public function championship()
    {
        return $this->belongsTo(Championship::class);
    }

    public function rules($id = '')
    {
        return [
            'name' => 'required|unique:status_lineups,name,' . $id . '|min:5',
            'abb' => 'required|unique:status_lineups,abb,' . $id . '|size:2'
        ];
    }

    public function feedback()
    {
        return [
            'name.required' => 'O campo nome é obrigatório.',
            'name.string' => 'O campo nome deve ser uma string.',
            'name.max' => 'O campo nome deve ter no máximo 34 caracteres.',
            'name.unique' => 'Já existe uma equipe com esse nome.',
            'abb.required' => 'O campo abreviação é obrigatório.',
            'abb.string' => 'O campo abreviação deve ser uma string.',
            'abb.size' => 'O campo abreviação deve ter exatamente 3 caracteres.',
            'abb.unique' => 'Já existe uma equipe com essa abreviação.',
            'championship_id.required' => 'O campo ID do campeonato é obrigatório.',
            'championship_id.exists' => 'O ID do campeonato fornecido não existe.',
        ];
    }
}
