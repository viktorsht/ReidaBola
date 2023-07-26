<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return [
        "success" => true
    ];
});

Route::prefix('v1')->group(function () {
    // AUTH ROUTES PUBLIC
    Route::post('login', 'App\Http\Controllers\AuthController@login');
    Route::post('register', 'App\Http\Controllers\AuthController@register');

    // PROTECTED
    Route::middleware('jwt.auth')->group(function(){
        // AUTH ROUTES PROTECTED
        Route::post('logout', 'App\Http\Controllers\AuthController@logout');
        Route::post('me', 'App\Http\Controllers\AuthController@me');
        Route::post('refresh', 'App\Http\Controllers\AuthController@refresh');

        // INDEX AND SHOW USER
        Route::get('accessLevel', 'App\Http\Controllers\AccessLevelController@index');
        Route::get('accessLevel/{id}', 'App\Http\Controllers\AccessLevelController@show');

        Route::get('state', 'App\Http\Controllers\StateController@index');
        Route::get('state/{id}', 'App\Http\Controllers\StateController@show');

        Route::get('city', 'App\Http\Controllers\CityController@index');
        Route::get('city/{id}', 'App\Http\Controllers\CityController@show');

        Route::get('stadium', 'App\Http\Controllers\StadiumFootballController@index');
        Route::get('stadium/{id}', 'App\Http\Controllers\StadiumFootballController@show');

        Route::get('championship', 'App\Http\Controllers\ChampionshipController@index');
        Route::get('championship/{id}', 'App\Http\Controllers\ChampionshipController@show');

        Route::get('championshipEdition', 'App\Http\Controllers\ChampionshipEditionController@index');
        Route::get('championshipEdition/{id}', 'App\Http\Controllers\ChampionshipEditionController@show');

        Route::get('coach', 'App\Http\Controllers\CoachController@index');
        Route::get('coach/{id}', 'App\Http\Controllers\CoachController@show');

        Route::get('positionPlayer', 'App\Http\Controllers\PositionPlayerController@index');
        Route::get('positionPlayer/{id}', 'App\Http\Controllers\PositionPlayerController@show');

        Route::get('player', 'App\Http\Controllers\PlayerController@index');
        Route::get('player/{id}', 'App\Http\Controllers\PlayerController@show');

        Route::get('team', 'App\Http\Controllers\TeamController@index');
        Route::get('team/{id}', 'App\Http\Controllers\TeamController@show');

        Route::get('teamEdition', 'App\Http\Controllers\TeamEditionController@index');
        Route::get('teamEdition/{id}', 'App\Http\Controllers\TeamEditionController@show');

        Route::get('playerEdition', 'App\Http\Controllers\PlayerEditionController@index');
        Route::get('playerEdition/{id}', 'App\Http\Controllers\PlayerEditionController@show');

        Route::get('statusLineup', 'App\Http\Controllers\StatusLineupController@index');
        Route::get('statusLineup/{id}', 'App\Http\Controllers\StatusLineupController@show');

        Route::get('championshipRound', 'App\Http\Controllers\ChampionshipRoundController@index');
        Route::get('championshipRound/{id}', 'App\Http\Controllers\ChampionshipRoundController@show');

        Route::get('soccerMatch', 'App\Http\Controllers\SoccerMatchController@index');
        Route::get('soccerMatch/next', 'App\Http\Controllers\SoccerMatchController@next');       
        Route::get('soccerMatch/{id}', 'App\Http\Controllers\SoccerMatchController@show');        

        Route::get('matchLineup', 'App\Http\Controllers\MatchLineupController@index');
        Route::get('matchLineup/{id}', 'App\Http\Controllers\MatchLineupController@show'); 

        Route::get('substitution', 'App\Http\Controllers\SubstitutionController@index');
        Route::get('substitution/{id}', 'App\Http\Controllers\SubstitutionController@show');        

        Route::get('teamGame', 'App\Http\Controllers\TeamGameController@index');
        Route::get('teamGame/{id}', 'App\Http\Controllers\TeamGameController@show');        
        Route::post('teamGame', 'App\Http\Controllers\TeamGameController@store');
        Route::post('teamGame/{id}', 'App\Http\Controllers\TeamGameController@update');

        Route::get('teamGameEdition', 'App\Http\Controllers\TeamGameEditionController@index');
        Route::get('teamGameEdition/{id}', 'App\Http\Controllers\TeamGameEditionController@show');        
        Route::post('teamGameEdition', 'App\Http\Controllers\TeamGameEditionController@store');
        Route::post('teamGameEdition/{id}', 'App\Http\Controllers\TeamGameEditionController@update');

        Route::apiResource('matchGameLineup', 'App\Http\Controllers\MatchGameLineupController');


        // Route::get('matchCardsStats', 'App\Http\Controllers\MatchCardsStatsController@index');
        // Route::get('matchCardsStats/{id}', 'App\Http\Controllers\MatchCardsStatsController@show');

        Route::get('matchGoalStats', 'App\Http\Controllers\MatchGoalStatsController@index');
        Route::get('matchGoalStats/{id}', 'App\Http\Controllers\MatchGoalStatsController@show');
        
        Route::get('playerGameScoreChampionshipEdition', 'App\Http\Controllers\PlayerGameScoreChampionshipEditionController@index');
        Route::get('playerGameScoreChampionshipEdition/{id}', 'App\Http\Controllers\PlayerGameScoreChampionshipEditionController@show');

        Route::get('playerGameScore', 'App\Http\Controllers\PlayerGameScoreController@index');
        Route::get('playerGameScore/{id}', 'App\Http\Controllers\PlayerGameScoreController@show');

        // ROUTES ADMIN
        Route::middleware(['access.level:1'])->group(function () {
            // Rotas acessíveis apenas para usuários com nível de acesso 1
            Route::post('accessLevel', 'App\Http\Controllers\AccessLevelController@store');
            Route::post('accessLevel/{id}', 'App\Http\Controllers\AccessLevelController@update');
            Route::delete('accessLevel/{id}', 'App\Http\Controllers\AccessLevelController@destroy');

            Route::post('state', 'App\Http\Controllers\StateController@store');
            Route::post('state/{id}', 'App\Http\Controllers\StateController@update');
            Route::delete('state/{id}', 'App\Http\Controllers\StateController@destroy');

            Route::post('city', 'App\Http\Controllers\CityController@store');
            Route::post('city/{id}', 'App\Http\Controllers\CityController@update');
            Route::delete('city/{id}', 'App\Http\Controllers\CityController@destroy');

            Route::post('stadium', 'App\Http\Controllers\StadiumFootballController@store');
            Route::post('stadium/{id}', 'App\Http\Controllers\StadiumFootballController@update');
            Route::delete('stadium/{id}', 'App\Http\Controllers\StadiumFootballController@destroy');

            Route::post('championship', 'App\Http\Controllers\ChampionshipController@store');
            Route::post('championship/{id}', 'App\Http\Controllers\ChampionshipController@update');
            Route::delete('championship/{id}', 'App\Http\Controllers\ChampionshipController@destroy');

            Route::post('coach', 'App\Http\Controllers\CoachController@store');
            Route::post('coach/{id}', 'App\Http\Controllers\CoachController@update');
            Route::delete('coach/{id}', 'App\Http\Controllers\CoachController@destroy');

            Route::post('positionPlayer', 'App\Http\Controllers\PositionPlayerController@store');
            Route::post('positionPlayer/{id}', 'App\Http\Controllers\PositionPlayerController@update');
            Route::delete('positionPlayer/{id}', 'App\Http\Controllers\PositionPlayerController@destroy');

            Route::post('player', 'App\Http\Controllers\PlayerController@store');
            Route::post('player/{id}', 'App\Http\Controllers\PlayerController@update');
            Route::delete('player/{id}', 'App\Http\Controllers\PlayerController@destroy');

            Route::post('team', 'App\Http\Controllers\TeamController@store');
            Route::post('team/{id}', 'App\Http\Controllers\TeamController@update');
            Route::delete('team/{id}', 'App\Http\Controllers\TeamController@destroy');

            Route::post('teamEdition', 'App\Http\Controllers\TeamEditionController@store');
            Route::post('teamEdition/{id}', 'App\Http\Controllers\TeamEditionController@update');
            Route::delete('teamEdition/{id}', 'App\Http\Controllers\TeamEditionController@destroy');

            Route::post('playerEdition', 'App\Http\Controllers\PlayerEditionController@store');
            Route::post('playerEdition/{id}', 'App\Http\Controllers\PlayerEditionController@update');
            Route::delete('playerEdition/{id}', 'App\Http\Controllers\PlayerEditionController@destroy');
            
            Route::post('statusLineup', 'App\Http\Controllers\StatusLineupController@store');
            Route::post('statusLineup/{id}', 'App\Http\Controllers\StatusLineupController@update');
            Route::delete('statusLineup/{id}', 'App\Http\Controllers\StatusLineupController@destroy');

            Route::post('championshipRound', 'App\Http\Controllers\ChampionshipRoundController@store');
            Route::post('championshipRound/{id}', 'App\Http\Controllers\ChampionshipRoundController@update');
            Route::delete('championshipRound/{id}', 'App\Http\Controllers\ChampionshipRoundController@destroy');

            Route::post('soccerMatch', 'App\Http\Controllers\SoccerMatchController@store');
            Route::post('soccerMatch/{id}', 'App\Http\Controllers\SoccerMatchController@update');
            Route::delete('soccerMatch/{id}', 'App\Http\Controllers\SoccerMatchController@destroy');

            Route::post('matchLineup', 'App\Http\Controllers\MatchLineupController@store');
            Route::post('matchLineup/{id}', 'App\Http\Controllers\MatchLineupController@update');
            Route::delete('matchLineup/{id}', 'App\Http\Controllers\MatchLineupController@destroy');

            Route::post('substitution', 'App\Http\Controllers\SubstitutionController@store');
            Route::post('substitution/{id}', 'App\Http\Controllers\SubstitutionController@update');
            Route::delete('substitution/{id}', 'App\Http\Controllers\SubstitutionController@destroy');
            
            Route::delete('teamGame/{id}', 'App\Http\Controllers\TeamGameController@destroy');

            Route::delete('teamGameEdition/{id}', 'App\Http\Controllers\TeamGameEditionController@destroy');




            // Route::post('matchCardsStats', 'App\Http\Controllers\MatchCardsStatsController@store');
            // Route::post('matchCardsStats/{id}', 'App\Http\Controllers\MatchCardsStatsController@update');
            // Route::delete('matchCardsStats/{id}', 'App\Http\Controllers\MatchCardsStatsController@destroy');

            Route::post('matchGoalStats', 'App\Http\Controllers\MatchGoalStatsController@store');
            Route::post('matchGoalStats/{id}', 'App\Http\Controllers\MatchGoalStatsController@update');
            Route::delete('matchGoalStats/{id}', 'App\Http\Controllers\MatchGoalStatsController@destroy');

            Route::post('playerGameScoreChampionshipEdition', 'App\Http\Controllers\PlayerGameScoreChampionshipEditionController@store');
            Route::post('playerGameScoreChampionshipEdition/{id}', 'App\Http\Controllers\PlayerGameScoreChampionshipEditionController@update');
            Route::delete('playerGameScoreChampionshipEdition/{id}', 'App\Http\Controllers\PlayerGameScoreChampionshipEditionController@destroy');

            Route::post('playerGameScore', 'App\Http\Controllers\PlayerGameScoreController@store');
            Route::post('playerGameScore/{id}', 'App\Http\Controllers\PlayerGameScoreController@update');
            Route::delete('playerGameScore/{id}', 'App\Http\Controllers\PlayerGameScoreController@destroy');

        });

    });

});
