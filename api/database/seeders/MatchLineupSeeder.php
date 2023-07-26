<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\MatchLineup;
use App\Models\PlayerEdition;
use App\Models\Player;
use App\Models\StatusLineup;
use App\Models\Championship;
use App\Models\ChampionshipEdition;
use App\Models\ChampionshipRound;
use App\Models\SoccerMatch;

class MatchLineupSeeder extends Seeder
{

    public function run()
    {
        $roundNumber = 1;
        $championshipRound = ChampionshipRound::where('round', $roundNumber)->first();

        if (!$championshipRound) {
            $this->command->error('Championship round not found.');
            return;
        }
        $championshipRoundId = $championshipRound->id;

        $championship = Championship::where('name', 'Belenense')->first();

        if (!$championship) {
            $this->command->error('Championship "Belenense" not found.');
            return;
        }
        $championshipId = $championship->id;

        $championshipEditions = ChampionshipEdition::where('championship_id', $championshipId)
            ->whereYear('start', '2023')
            ->first();
        
        $championshipEditionId = $championshipEditions->id;
        
        $soccerMatches = SoccerMatch::where('championship_edition_id', $championshipEditionId)
            ->where('championship_round_id', $championshipRoundId)
            ->get();

        foreach ($soccerMatches as $soccerMatch) {
                $id = $soccerMatch->id;
                $team1_edition_id = $soccerMatch->team1_edition_id;
                $team2_edition_id = $soccerMatch->team2_edition_id;

                $team1_players_editions = PlayerEdition::where('team_edition_id', $team1_edition_id)->get();
                $team2_players_editions = PlayerEdition::where('team_edition_id', $team2_edition_id)->get();
        }

        $team1_players_edition_id_selected = $this->selectPlayers($team1_players_editions);
        $team2_players_edition_id_selected = $this->selectPlayers($team2_players_editions);
        
        $tem1_status_lineup = $this->createMatchLineups($team1_players_edition_id_selected, 1, 1);
        $tem2_status_lineup = $this->createMatchLineups($team2_players_edition_id_selected, 1, 1);
    }


    public function getPlayerById($id = null){
        return Player::where('id', $id)->get();
    }

    public function getPlayersByTeamEdition($teamPlayers = null){
        $players = [];
        foreach ($teamPlayers as $teamEdition) {
            $players[] = $this->getPlayerById( $teamEdition->id );
        }
        return $players;
    }

    public function getLimitForPosition($positionId){
        $limits = [
            1 => 1,
            2 => 2,
            3 => 2,
            4 => 1,
            5 => 2,
            6 => 3
        ];

        return $limits[$positionId];
    }

    public function selectPlayers($players)
    {
        $positionCounts = [
            1 => 0,
            2 => 0,
            3 => 0,
            4 => 0,
            5 => 0,
            6 => 0
        ];

        $selectedPlayers = [];

        foreach ($players as $playerEdition) {
            $player = $this->getPlayerById($playerEdition->player_id);
            $positionId = $player[0]->position_id;

            if ($positionCounts[$positionId] < $this->getLimitForPosition($positionId)) {
                $selectedPlayers[] = $playerEdition->id;
                // $this->command->info( $player[0]->id );
                
                $positionCounts[$positionId]++;

                if (count($selectedPlayers) === 11) break;
            }
        }

        return $selectedPlayers;
    }

    public function createMatchLineups($playerEditionIds, $soccerMatchId, $statusLineupId){
        $matchLineups = [];
        
        foreach ($playerEditionIds as $playerEditionId) {
            $matchLineup = MatchLineup::create([
                'player_edition_id' => $playerEditionId,
                'soccer_match_id' => $soccerMatchId,
                'status_lineup_id' => $statusLineupId
            ]);
            
            $matchLineups[] = $matchLineup;
        }
        
        return $matchLineups;
    }



}
