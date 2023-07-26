<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Player;
use App\Models\PositionPlayer;
use App\Models\City;

class PlayerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $positions = PositionPlayer::all();
        $city = City::where('name', 'Belém do Piauí')->first();

        if (!$city) {
            $this->command->info('Cidade não encontrada.');
            return;
        }

        $playersData = [
            ['first_name' => 'Pedro', 'last_name' => 'Silva', 'number' => 1],
            ['first_name' => 'João', 'last_name' => 'Santos', 'number' => 2],
            ['first_name' => 'Lucas', 'last_name' => 'Fernandes', 'number' => 3],
            ['first_name' => 'Gabriel', 'last_name' => 'Oliveira', 'number' => 4],
            ['first_name' => 'Matheus', 'last_name' => 'Costa', 'number' => 5],
            ['first_name' => 'Daniel', 'last_name' => 'Ribeiro', 'number' => 6],
            ['first_name' => 'Bruno', 'last_name' => 'Pereira', 'number' => 7],
            ['first_name' => 'Gustavo', 'last_name' => 'Almeida', 'number' => 8],
            ['first_name' => 'Rafael', 'last_name' => 'Rodrigues', 'number' => 9],
            ['first_name' => 'Fernando', 'last_name' => 'Carvalho', 'number' => 10],
            ['first_name' => 'Eduardo', 'last_name' => 'Ferreira', 'number' => 11],
        ];

        $totalPlayers = 500; // Total de jogadores
        $playersCount = count($playersData);

        for ($i = 21 + 1; $i <= $totalPlayers; $i++) {
            $firstName = $this->generateFirstName();
            $lastName = $this->generateLastName();
            $number = $this->generateRandomNumber();

            $position = $positions->random();

            Player::create([
                'first_name' => $firstName,
                'last_name' => $lastName,
                'number' => $number,
                'position_id' => $position->id,
                'city_id' => $city->id,
            ]);
        }

        $this->command->info('Seeding de jogadores concluído.');
    }

    /**
     * Gera um nome de jogador aleatório.
     *
     * @return string
     */
    private function generateFirstName()
    {
        $firstNames = [
            'Alex', 'Bernardo', 'Caio', 'Diego', 'Eduardo', 'Fábio', 'Gabriel', 'Hugo', 'Ícaro', 'Jorge',
            'Alisson', 'Alberto', 'Tavares', 'Thales', 'Tales', 'Moisés', 'Carlos', 'Messi', 'Cristiano',
            'Ronaldo', 'Fernando', 'Gustavo', 'Henrique', 'Igor', 'Julio', 'Kevin', 'Lucas', 'Marcelo', 'Nelson',
            'Otávio', 'Paulo', 'Rafael', 'Samuel', 'Thiago', 'Ulisses', 'Valter', 'William', 'Xavier', 'Yago', 'Zélio',
            'André', 'Bruno', 'Carlos', 'Daniel', 'Eduardo', 'Felipe', 'Gustavo', 'Hugo', 'Igor', 'João',
            'Leonardo', 'Marcelo', 'Nelson', 'Otávio', 'Pedro', 'Rafael', 'Samuel', 'Thiago', 'Ulisses', 'Vitor',
            'Alexandre', 'Bernardo', 'César', 'Diego', 'Erick', 'Fernando', 'Gabriel', 'Henrique', 'Ivan', 'Jorge',
            'Lucas', 'Márcio', 'Nathan', 'Orlando', 'Paulo', 'Ricardo', 'Sérgio', 'Tiago', 'Vinicius', 'Wagner',
            'Aiden', 'Beckett', 'Carter', 'Declan', 'Ezra', 'Finn', 'Gideon', 'Hudson', 'Ian', 'Jaxon',
            'Kai', 'Landon', 'Maxwell', 'Nolan', 'Oscar', 'Paxton', 'Quincy', 'Ryder', 'Sawyer', 'Tristan',
            'Victor', 'Wesley', 'Xander', 'Yahir', 'Zane', 'Asher', 'Bryson', 'Caden', 'Dexter', 'Elias',
            'Fletcher', 'Grayson', 'Holden', 'Isaiah', 'Jasper', 'Knox', 'Liam', 'Maddox', 'Nathaniel', 'Orion'
        ];

        $firstNames = array_unique($firstNames);
        
        return $firstNames[array_rand($firstNames)];
    }

    /**
     * Gera um sobrenome de jogador aleatório.
     *
     * @return string
     */
    private function generateLastName()
    {        
        $lastNames = [
            'Silva', 'Santos', 'Fernandes', 'Oliveira', 'Costa', 'Ribeiro', 'Pereira', 'Almeida', 'Rodrigues', 'Carvalho',
            'Gomes', 'Martins', 'Ramos', 'Alves', 'Lima', 'Araújo', 'Cruz', 'Mendes', 'Nunes', 'Sousa',
            'Castro', 'Ferreira', 'Monteiro', 'Melo', 'Cardoso', 'Teixeira', 'Correia', 'Cavalcanti', 'Nascimento', 'Coelho',
            'Moraes', 'Andrade', 'Freitas', 'Barbosa', 'Pinto', 'Tavares', 'Macedo', 'Siqueira', 'Campos', 'Borges'
        ];
        
        $lastNames = array_unique($lastNames);
        return $lastNames[array_rand($lastNames)];
    }

    /**
     * Gera um número de camisa aleatório.
     *
     * @return int
     */
    private function generateRandomNumber()
    {
        return rand(1, 99);
    }
}
