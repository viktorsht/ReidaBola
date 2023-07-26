<?php

namespace Database\Seeders;

use App\Models\ChampionshipRound;
use App\Models\StadiumFootball;
use App\Models\StatusLineup;
use App\Models\TeamGame;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        $this->call(StatesTableSeeder::class);
        $this->call(PiauiCitiesTableSeeder::class);
        $this->call(StadiumFootballTableSeeder::class);
        $this->call(ChampionshipSeeder::class);
        $this->call(ChampionshipEditionSeeder::class);
        $this->call(CoachSeeder::class);
        $this->call(PositionPlayerSeeder::class);
        $this->call(PlayerSeeder::class);
        $this->call(TeamSeeder::class);
        $this->call(TeamEditionSeeder::class);
        $this->call(PlayerEditionSeeder::class);
        $this->call(StatusLineupSeeder::class);
        $this->call(ChampionshipRoundSeeder::class);
        $this->call(SoccerMatchSeeder::class);
        $this->call(MatchLineupSeeder::class);
    }
}
