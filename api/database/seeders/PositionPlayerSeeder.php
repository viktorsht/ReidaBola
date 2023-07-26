<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PositionPlayer;

class PositionPlayerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
{
        $positions = [
            ['name' => 'Goleiro', 'abb' => 'GOL'],
            ['name' => 'Zagueiro', 'abb' => 'ZAG'],
            ['name' => 'Lateral', 'abb' => 'LAT'],
            ['name' => 'Volante', 'abb' => 'VOL'],
            ['name' => 'Meio-campista', 'abb' => 'MEI'],
            ['name' => 'Atacante', 'abb' => 'ATA'],
        ];

        foreach ($positions as $position) {
            PositionPlayer::create($position);
        }

        $this->command->info('Seeding de posições de jogadores concluído.');
    }
}

