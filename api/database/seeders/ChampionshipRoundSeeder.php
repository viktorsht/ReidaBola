<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ChampionshipRound;

class ChampionshipRoundSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rounds = [
            [
                'name' => '1ª Rodada',
                'round' => 1,
            ],
            [
                'name' => '2ª Rodada',
                'round' => 2,
            ],
            [
                'name' => '3ª Rodada',
                'round' => 3,
            ],
            [
                'name' => '4ª Rodada',
                'round' => 4,
            ],
            [
                'name' => '5ª Rodada',
                'round' => 5,
            ],
            [
                'name' => '6ª Rodada',
                'round' => 6,
            ],
            [
                'name' => '7ª Rodada',
                'round' => 7,
            ],
            [
                'name' => '8ª Rodada',
                'round' => 8,
            ],
        ];

        foreach ($rounds as $roundData) {
            ChampionshipRound::create([
                'name' => $roundData['name'],
                'round' => $roundData['round'],
            ]);
        }
    }
}
