<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;

    protected $table = 'cities';

    protected $fillable = [
        'name',
        'abb',
        'state_id'
    ];

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public static function rules()
    {
        return [
            'name' => 'required|unique:cities',
            'abb' => 'required|unique:cities',
            'state_id' => 'required|exists:states,id'
        ];
    }

    public static function feedback()
    {
        return [
            'name.required' => 'O campo nome é obrigatório.',
            'name.unique' => 'O nome fornecido já está em uso.',
            'abb.required' => 'O campo abreviação é obrigatório.',
            'abb.unique' => 'A abreviação fornecida já está em uso.',
            'state_id.required' => 'O campo estado é obrigatório.',
            'state_id.exists' => 'O estado selecionado não existe.'
        ];
    }

}
