<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubstitutionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('substitutions', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('minute')->nullable(false);
            $table->unsignedBigInteger('soccer_match_id')->nullable(false);
            $table->unsignedBigInteger('team_edition_id')->nullable(false);
            $table->unsignedBigInteger('player_in_id')->nullable(false);
            $table->unsignedBigInteger('player_out_id')->nullable(false);
            $table->timestamps();
        
            $table->foreign('soccer_match_id')->references('id')->on('soccer_matches');
            $table->foreign('team_edition_id')->references('id')->on('team_editions');
            $table->foreign('player_in_id')->references('id')->on('match_lineup');
            $table->foreign('player_out_id')->references('id')->on('match_lineup');
        });
        
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('substitutions', function (Blueprint $table) {
            $table->dropForeign(['soccer_match_id']);
            $table->dropForeign(['team_edition_id']);
            $table->dropForeign(['player_in_id']);
            $table->dropForeign(['player_out_id']);
        });

        Schema::dropIfExists('substitutions');
    }

}
