<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Coach;
use App\Models\City;

class CoachSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $city = City::where('name', 'Belém do Piauí')->first();

        if ($city) {
            $coaches = [
                ['first_name' => 'João', 'last_name' => 'Silva', 'city_id' => $city->id],
                ['first_name' => 'Maria', 'last_name' => 'Santos', 'city_id' => $city->id],
                ['first_name' => 'Pedro', 'last_name' => 'Souza', 'city_id' => $city->id],
                ['first_name' => 'Ana', 'last_name' => 'Lima', 'city_id' => $city->id],
                ['first_name' => 'Lucas', 'last_name' => 'Ferreira', 'city_id' => $city->id],
                ['first_name' => 'Mariana', 'last_name' => 'Almeida', 'city_id' => $city->id],
            ];

            foreach ($coaches as $coachData) {
                Coach::create($coachData);
            }

            $this->command->info('Seeding de técnicos concluído.');
        } else {
            $this->command->info('Cidade de Belém do Piauí não encontrada. Execute a seeder de cidades primeiro.');
        }
    }
}

