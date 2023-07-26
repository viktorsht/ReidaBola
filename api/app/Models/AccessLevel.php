<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AccessLevel extends Model
{
    protected $table = 'access_levels';

    protected $fillable = [
        'name',
    ];

    public static function getAccessLevelIdByName($name = "Usuário")
    {
        $accessLevel = AccessLevel::where('name', $name)->first();
        $result = ($accessLevel) ? $accessLevel->id : 0;
        return $result;
    }

    // Relação com os usuários
    public function users()
    {
        return $this->hasMany(User::class);
    }

}
