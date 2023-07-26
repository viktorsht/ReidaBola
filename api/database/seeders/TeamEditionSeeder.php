<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\TeamEdition;
use App\Models\Team;
use App\Models\ChampionshipEdition;
use App\Models\Coach;
use App\Models\City;
use Faker\Factory as Faker;

class TeamEditionSeeder extends Seeder
{
    public function run()
    {
        $teams = [
            'Villa Real',
            'TDS',
            'Palmeiras',
            'Carquejo',
            'Corinthians',
            'Russim'
        ];

        $championshipName = 'Belenense';
        $championshipEdition = ChampionshipEdition::whereHas('championship', function ($query) use ($championshipName) {
            $query->where('name', $championshipName);
        })->latest('id')->first();

        if ($championshipEdition) {
            $belemDoPiauiCity = City::where('name', 'Belém do Piauí')->first();

            if ($belemDoPiauiCity) {
                $championshipId = $championshipEdition->id;
                $faker = Faker::create();

                foreach ($teams as $name) {
                    $team = Team::where('name', $name)->first();

                    $coachFirstName = $faker->firstName;
                    $coachLastName = $faker->lastName;

                     $coach = Coach::firstOrCreate([
                        'first_name' => $coachFirstName,
                        'last_name' => $coachLastName,
                        'city_id' => $belemDoPiauiCity->id
                    ]);

                    $teamEdition = TeamEdition::create([
                        'team_id' => $team->id,
                        'championship_edition_id' => $championshipId,
                        'coach_id' => $coach->id
                    ]);

                    // $this->command->warn($teamEdition);
                }

            }else{
                $this->command->warn('City Belém do Piauí not found. Make sure to create the city before running the team edition seeder.');
                return;
            }

        }else{
            $this->command->warn('Championship edition Belenense not found. Make sure to create the championship edition before running the team edition seeder.');
            return;
        }

    }
}

