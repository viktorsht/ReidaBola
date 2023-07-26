<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Championship;
use App\Models\City;

class ChampionshipSeeder extends Seeder
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
            Championship::create([
                'name' => 'Belenense',
                'city_id' => $city->id,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
