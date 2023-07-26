<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlayersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('players', function (Blueprint $table) {
            $table->id();
            $table->string('first_name', 35)->nullable(false);
            $table->string('last_name', 35)->nullable(false);
            $table->integer('number')->nullable(false);
            $table->unsignedBigInteger('position_id')->nullable(false);
            $table->unsignedBigInteger('city_id')->nullable(false);
            $table->timestamps();

            $table->foreign('position_id')->references('id')->on('position_players');
            $table->foreign('city_id')->references('id')->on('cities');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('players', function (Blueprint $table) {
            $table->dropForeign(['position_id']);
            $table->dropForeign(['city_id']);
        });

        Schema::dropIfExists('players');
    }

}
