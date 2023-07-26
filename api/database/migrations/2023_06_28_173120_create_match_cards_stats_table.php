<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchCardsStatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_cards_stats', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('minute')->nullable(false);
            $table->boolean('card_yellow')->default(false);
            $table->boolean('card_red')->default(false);
            $table->unsignedBigInteger('soccer_match_id')->nullable(false);
            $table->unsignedBigInteger('player_commit_id')->nullable(false);
            $table->unsignedBigInteger('player_suffer_id')->nullable(false);
            $table->timestamps();
        
            $table->foreign('soccer_match_id')->references('id')->on('soccer_matches');
            $table->foreign('player_commit_id')->references('id')->on('match_lineup');
            $table->foreign('player_suffer_id')->references('id')->on('match_lineup');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('match_cards_stats', function (Blueprint $table) {
            $table->dropForeign(['soccer_match_id']);
            $table->dropForeign(['player_commit_id']);
            $table->dropForeign(['player_suffer_id']);
        });

        Schema::dropIfExists('match_cards_stats');
    }

}
