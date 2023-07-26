<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StatusLineup;

class StatusLineupSeeder extends Seeder
{
    public function run()
    {
        $statusLineups = [
            ['name' => 'Escalado', 'status' => true],
            ['name' => 'Banco de Reserva', 'status' => false]
        ];

        foreach ($statusLineups as $statusLineup) {
            StatusLineup::create($statusLineup);
        }
    }
}
