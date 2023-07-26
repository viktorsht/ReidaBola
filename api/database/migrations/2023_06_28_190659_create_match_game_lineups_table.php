<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchGameLineupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_game_lineups', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('team_game_edition_id');
            $table->unsignedBigInteger('player_lineup_id');
            $table->unsignedBigInteger('championship_round_id');
            $table->boolean('status');
            $table->timestamps();
        
            $table->foreign('team_game_edition_id')->references('id')->on('team_game_editions');
            $table->foreign('player_lineup_id')->references('id')->on('match_lineup');
            $table->foreign('championship_round_id')->references('id')->on('championship_rounds');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('match_game_lineups', function (Blueprint $table) {
            $table->dropForeign(['team_game_edition_id']);
            $table->dropForeign(['player_lineup_id']);
            $table->dropForeign(['championship_round_id']);
        });

        Schema::dropIfExists('match_game_lineups');
    }

}
