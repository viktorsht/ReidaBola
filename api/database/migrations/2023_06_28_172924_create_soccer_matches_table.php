<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSoccerMatchesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('soccer_matches', function (Blueprint $table) {
            $table->id();
            $table->dateTime('date_time')->nullable(false);
            $table->unsignedBigInteger('team1_edition_id')->nullable(false);
            $table->unsignedBigInteger('team2_edition_id')->nullable(false);
            $table->unsignedBigInteger('championship_edition_id')->nullable(false);
            $table->unsignedBigInteger('stadium_football_id')->nullable(false);
            $table->unsignedBigInteger('championship_round_id')->nullable(false);
            $table->timestamps();
    
            $table->foreign('team1_edition_id')->references('id')->on('team_editions')->onDelete('cascade');
            $table->foreign('team2_edition_id')->references('id')->on('team_editions')->onDelete('cascade');
            $table->foreign('championship_edition_id')->references('id')->on('championship_editions')->onDelete('cascade');
            $table->foreign('stadium_football_id')->references('id')->on('stadium_footballs')->onDelete('cascade');
            $table->foreign('championship_round_id')->references('id')->on('championship_rounds')->onDelete('cascade');
        });
    }
    
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('soccer_matches', function (Blueprint $table) {
            $table->dropForeign(['team1_edition_id']);
            $table->dropForeign(['team2_edition_id']);
            $table->dropForeign(['championship_edition_id']);
            $table->dropForeign(['stadium_football_id']);
            $table->dropForeign(['championship_round_id']);
        });

        Schema::dropIfExists('soccer_matches');
    }



}
