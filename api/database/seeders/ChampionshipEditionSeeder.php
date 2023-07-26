<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\ChampionshipEdition;
use App\Models\Championship;

class ChampionshipEditionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $championship = Championship::where('name', 'Belenense')->first();

        if ($championship) {
            $edition = ChampionshipEdition::create([
                'start' => '2023-10-01 00:00:00', // Data e hora de início no formato Y-m-d H:i:s
                'end' => '2023-12-14 00:00:00', // Data e hora de término no formato Y-m-d H:i:s
                'championship_id' => $championship->id,
            ]);

            $this->command->info('Edição do Campeonato de Belém do Piauí criada com sucesso.');
        }
    }
}
