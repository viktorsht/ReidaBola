<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchLineupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_lineup', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('player_edition_id')->nullable(false);
            $table->unsignedBigInteger('soccer_match_id')->nullable(false);
            $table->unsignedBigInteger('status_lineup_id')->nullable(false);
            $table->timestamps();
        
            $table->foreign('player_edition_id')->references('id')->on('player_editions');
            $table->foreign('soccer_match_id')->references('id')->on('soccer_matches');
            $table->foreign('status_lineup_id')->references('id')->on('status_lineups');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('match_lineup', function (Blueprint $table) {
            $table->dropForeign(['player_edition_id']);
            $table->dropForeign(['soccer_match_id']);
            $table->dropForeign(['status_lineup_id']);
        });

        Schema::dropIfExists('match_lineup');
    }

}
