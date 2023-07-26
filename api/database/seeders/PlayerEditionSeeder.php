<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\PlayerEdition;
use App\Models\TeamEdition;
use App\Models\PositionPlayer;
use App\Models\Player;

class PlayerEditionSeeder extends Seeder
{
    public function run()
    {
        $teamEditions = TeamEdition::all();
        $positions = PositionPlayer::all();

        foreach ($teamEditions as $teamEdition) {
            $this->command->info("Associating players to Team Edition ID: {$teamEdition->id}");

            $players = Player::inRandomOrder()->get();
            $playersCount = 0;

            $positionsCount = [
                'Goleiro' => 3,
                'Zagueiro' => 4,
                'Lateral' => 4,
                'Volante' => 4,
                'Meio-campista' => 6,
                'Atacante' => 6,
            ];

            foreach ($positions as $position) {
                $playersByPosition = $players->filter(function ($player) use ($position) {
                    return $player->position_id == $position->id;
                });

                $playersToAssociate = min($positionsCount[$position->name], $playersByPosition->count());

                $selectedPlayers = $playersByPosition->take($playersToAssociate);

                foreach ($selectedPlayers as $player) {
                    PlayerEdition::create([
                        'player_id' => $player->id,
                        'team_edition_id' => $teamEdition->id,
                    ]);

                    $playersCount++;
                }
            }

            if ($playersCount < 12) {
                $this->command->error("Not enough players available for Team Edition ID: {$teamEdition->id}");
            }
        }

        $this->command->info('Player Editions seeding completed.');
    }
}
