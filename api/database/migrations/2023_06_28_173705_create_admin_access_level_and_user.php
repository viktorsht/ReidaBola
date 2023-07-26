<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// use Illuminate\Database\Migrations\Migration;
// use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Hash;
use App\Models\AccessLevel;
use App\Models\User;

class CreateAdminAccessLevelAndUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Criar o nível de acesso "Admin e Usuário"
        $accessLevelAdmin = new AccessLevel();
        $accessLevelAdmin->name = 'Admin';
        $accessLevelAdmin->save();
        $accessLevelUser = new AccessLevel();
        $accessLevelUser->name = "Usuário";
        $accessLevelUser->save();

        // Criar o usuário com o nível de acesso "Admin"
        $userAdmin = new User();
        $userAdmin->email = 'admin@reidaboa.1bertojunior.com';
        $userAdmin->password = Hash::make('Admin@reidabola2023');
        $userAdmin->first_name = 'Admin';
        $userAdmin->last_name = 'Root';
        $userAdmin->nick = 'admin';
        $userAdmin->access_level_id = $accessLevelAdmin->id;
        $userAdmin->save();
        
        $user = new User();
        $user->email = '1bertojunior@reidabola.1bertojunior.com';
        $user->password = Hash::make('Key@2023');
        $user->first_name = 'Humberto';
        $user->last_name = 'Júnior';
        $user->nick = '1berto_junior';
        $user->access_level_id = $accessLevelUser->id;
        $user->save();

        $user1 = new User();
        $user1->email = 'vitor1@reidaboa.1bertojunior.com';
        $user1->password = Hash::make('123456789!A');
        $user1->first_name = 'Vitor';
        $user1->last_name = 'Santos';
        $user1->nick = 'vitor_santos';
        $user1->access_level_id = $accessLevelUser->id;
        $user1->save();

        $user2 = new User();
        $user2->email = 'vitor2@reidaboa.1bertojunior.com';
        $user2->password = Hash::make('123456789!A');
        $user2->first_name = 'vitor';
        $user2->last_name = 'santos';
        $user2->nick = 'vitorsantos';
        $user2->access_level_id = $accessLevelUser->id;
        $user2->save();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Remover o usuário com o nível de acesso "Admin"
        User::where('email', 'admin@reidaboa.1bertojunior.com')->delete();

        // Remover o nível de acesso "Admin"
        AccessLevel::where('name', 'Admin')->delete();
    }
}
