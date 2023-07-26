<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusLineup extends Model
{
    use HasFactory;

    protected $table = 'status_lineups';
    protected $fillable = [
        'name',
        'status'
    ];

    public static function rules($id = null)
    {
        return [
            'name' => 'required|unique:status_lineups,name,' . $id . '|min:5|max:35',
            'status' => 'required|boolean',
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O campo nome é obrigatório.',
            'name.string' => 'O campo nome deve ser uma string.',
            'name.unique' => 'Já existe um estado com esse nome.',
            'name.min' => 'O campo nome deve ter pelo menos 5 caracteres.',
            'name.max' => 'O campo nome deve ter no máximo 35 caracteres.',
            'status.required' => 'O campo status é obrigatório.',
            'status.boolean' => 'O campo status deve ser um booleano.',
        ];
    }
}
