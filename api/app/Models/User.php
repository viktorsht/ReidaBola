<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name',
        'last_name',
        'nick',
        'email',
        'password',
        'access_level_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

    public static function rules()
    {
        return [
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8|regex:/^(?=.*[!@#$%^&*-])(?=.*[A-Z])(?=.*\d)/',
            'first_name' => 'required',
            'last_name' => 'required',
            'nick' => 'required|unique:users',
            'access_level_id' => 'required|integer|min:1|exists:access_levels,id'
        ];
    }

    public static function feedback()
    {
        return [
            'email.required' => 'O campo e-mail é obrigatório.',
            'email.email' => 'O e-mail fornecido é inválido.',
            'email.unique' => 'O e-mail fornecido já está em uso.',
            'password.required' => 'O campo senha é obrigatório.',
            'password.min' => 'A senha deve ter no mínimo 8 caracteres.',
            'password.regex' => 'A senha deve conter pelo menos um caractere especial, uma letra maiúscula e um número.',
            'first_name.required' => 'O campo nome é obrigatório.',
            'last_name.required' => 'O campo sobrenome é obrigatório.',
            'nick.required' => 'O campo nickname é obrigatório.',
            'nick.unique' => 'O nickname fornecido já está em uso.',
            'access_level_id.required' => 'O campo nível de acesso é obrigatório.',
            'access_level_id.integer' => 'O campo nível de acesso deve ser um valor válido.',
            'access_level_id.min' => 'O campo nível de acesso deve ser um número positivo acima de 0.',
            'access_level_id.exists' => 'O nível de acesso fornecido não existe.'
        ];
    }

    // Relação com o nível de acesso
    public function accessLevel()
    {
        return $this->belongsTo(AccessLevel::class);
    }

    // public function teamGame(){
    //     return $this->hasOne(TeamGame::class);
    // }
}
