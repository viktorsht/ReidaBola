<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTeamEditionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('team_editions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('team_id')->nullable(false);
            $table->unsignedBigInteger('championship_edition_id')->nullable(false);
            $table->unsignedBigInteger('coach_id')->nullable(false);
            $table->timestamps();

            $table->foreign('team_id')->references('id')->on('teams');
            $table->foreign('championship_edition_id')->references('id')->on('championship_editions');
            $table->foreign('coach_id')->references('id')->on('coaches');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('team_editions', function (Blueprint $table) {
            $table->dropForeign(['team_id']);
            $table->dropForeign(['championship_edition_id']);
            $table->dropForeign(['coach_id']);
        });

        Schema::dropIfExists('team_editions');
    }

}
