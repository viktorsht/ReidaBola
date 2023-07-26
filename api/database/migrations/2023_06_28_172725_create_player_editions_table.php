<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlayerEditionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('player_editions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('player_id')->nullable(false);
            $table->unsignedBigInteger('team_edition_id')->nullable(false);
            $table->timestamps();

            $table->foreign('player_id')->references('id')->on('players');
            $table->foreign('team_edition_id')->references('id')->on('team_editions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('player_editions', function (Blueprint $table) {
            $table->dropForeign(['player_id']);
            $table->dropForeign(['team_edition_id']);
        });

        Schema::dropIfExists('player_editions');
    }

}
