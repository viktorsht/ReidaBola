<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Team;
use App\Models\Championship;

class TeamSeeder extends Seeder
{
    public function run()
    {
        $championship = Championship::where('name', 'Belenense')->first();

        if (!$championship) {
            $this->command->warn('Campeonato Belenense não encontrado. Certifique-se de criar o campeonato antes de executar o seeder de equipes.');
            return;
        }

        $teams = [
            ['name' => 'Villa Real', 'abb' => 'VRL'],
            ['name' => 'TDS', 'abb' => 'TDS'],
            ['name' => 'Palmeiras', 'abb' => 'PAL'],
            ['name' => 'Carquejo', 'abb' => 'CAR'],
            ['name' => 'Corinthians', 'abb' => 'COR'],
            ['name' => 'Russim', 'abb' => 'RUS'],
        ];

        foreach ($teams as $team) {
            if (strlen($team['abb']) !== 3) {
                $this->command->warn('A equipe ' . $team['name'] . ' não será criada, pois a abreviação não contém 3 caracteres.');
                continue;
            }
            
            $team['championship_id'] = $championship->id;
            Team::create($team);
        }
    }
}
