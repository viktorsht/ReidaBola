<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class State extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'abb'];

    public function rules($id = '')
    {
        return [
            'name' => 'required|unique:states,name,' . $id . '|min:5',
            'abb' => 'required|unique:states,abb,' . $id . '|size:2'
        ];
    }

    public function feedback(){
        return [
            'name.required' => 'O campo nome é obrigatório.',
            'name.unique' => 'Já existe um estado com esse nome.',
            'name.min' => 'O campo nome deve ter pelo menos 5 caracteres.',
            'abb.required' => 'O campo abreviação é obrigatório.',
            'abb.unique' => 'Já existe um estado com essa abreviação.',
            'abb.size' => 'O campo abreviação deve ter exatamente 2 caracteres.'
        ];
    }

    public function cities()
    {
        return $this->hasMany(City::class);
    }


}
