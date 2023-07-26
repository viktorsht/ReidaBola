<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChampionshipEditionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('championship_editions', function (Blueprint $table) {
            $table->id();
            $table->datetime('start')->nullable(false);
            $table->datetime('end')->nullable(false);
            $table->unsignedBigInteger('championship_id')->nullable(false);
            $table->timestamps();

            $table->foreign('championship_id')->references('id')->on('championships');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('championship_editions', function (Blueprint $table) {
            $table->dropForeign(['championship_id']);
        });

        Schema::dropIfExists('championship_editions');
    }

}
