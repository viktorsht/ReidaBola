<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StatesTableSeeder extends Seeder
{
    
    public function run()
    {
        $states = [
            ['name' => 'Acre', 'abb' => 'AC', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Alagoas', 'abb' => 'AL', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Amapá', 'abb' => 'AP', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Amazonas', 'abb' => 'AM', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Bahia', 'abb' => 'BA', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Ceará', 'abb' => 'CE', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Distrito Federal', 'abb' => 'DF', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Espírito Santo', 'abb' => 'ES', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Goiás', 'abb' => 'GO', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Maranhão', 'abb' => 'MA', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Mato Grosso', 'abb' => 'MT', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Mato Grosso do Sul', 'abb' => 'MS', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Minas Gerais', 'abb' => 'MG', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Pará', 'abb' => 'PA', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Paraíba', 'abb' => 'PB', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Paraná', 'abb' => 'PR', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Pernambuco', 'abb' => 'PE', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Piauí', 'abb' => 'PI', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Rio de Janeiro', 'abb' => 'RJ', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Rio Grande do Norte', 'abb' => 'RN', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Rio Grande do Sul', 'abb' => 'RS', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Rondônia', 'abb' => 'RO', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Roraima', 'abb' => 'RR', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Santa Catarina', 'abb' => 'SC', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'São Paulo', 'abb' => 'SP', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Sergipe', 'abb' => 'SE', 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Tocantins', 'abb' => 'TO', 'created_at' => now(), 'updated_at' => now()],
        ];
        
        DB::table('states')->insert($states);
    }
}
