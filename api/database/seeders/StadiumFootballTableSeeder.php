<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\StadiumFootball;
use App\Models\City;

class StadiumFootballTableSeeder extends Seeder
{
    public function run()
    {
        $cities = City::all();

        foreach ($cities as $city) {
            StadiumFootball::create([
                'name' => 'Estádio ' . $city->name,
                'city_id' => $city->id,
            ]);
        }
    }
}
