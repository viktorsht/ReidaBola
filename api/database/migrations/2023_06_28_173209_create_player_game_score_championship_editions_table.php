<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlayerGameScoreChampionshipEditionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('player_game_score_championship_editions', function (Blueprint $table) {
            $table->id();
            $table->decimal('score', 8, 2)->nullable(false);
            $table->unsignedBigInteger('player_game_score_id')->nullable(false);
            $table->unsignedBigInteger('championship_edition_id')->nullable(false);
            $table->timestamps();
        
            $table->foreign('player_game_score_id', 'fk_player_game_score')->references('id')->on('player_game_scores');
            $table->foreign('championship_edition_id', 'fk_championship_edition')->references('id')->on('championship_editions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('player_game_score_championship_editions', function (Blueprint $table) {
            $table->dropForeign('fk_player_game_score');
            $table->dropForeign('fk_championship_edition');
        });

        Schema::dropIfExists('player_game_score_championship_editions');
    }


}
