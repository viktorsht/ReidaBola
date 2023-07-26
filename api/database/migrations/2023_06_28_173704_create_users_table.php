<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->string('first_name')->nullable(false);
            $table->string('last_name')->nullable(false);
            $table->string('nick')->unique()->nullable(false);
            $table->unsignedBigInteger('access_level_id')->nullable();            
            $table->timestamps();

            $table->foreign('access_level_id')->references('id')->on('access_levels');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['access_level_id']);
            $table->dropColumn('access_level_id');
        });
        Schema::dropIfExists('users');
    }
}
