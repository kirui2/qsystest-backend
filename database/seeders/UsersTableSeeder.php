<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UsersTableSeeder extends Seeder
{
    public function run()
    {
        // Inserting a sample user
        User::create([
            'name' => 'Operator Test',
            'email' => 'op@gmail.com',
            'password' => Hash::make('password'),
        ]);
    }
}
