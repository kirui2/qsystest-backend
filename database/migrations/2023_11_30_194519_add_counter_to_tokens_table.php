<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCounterToTokensTable extends Migration
{
    public function up()
    {
        Schema::table('tokens', function (Blueprint $table) {
            $table->unsignedInteger('counter')->default(0)->after('status');
        });
    }

    public function down()
    {
        Schema::table('tokens', function (Blueprint $table) {
            $table->dropColumn('counter');
        });
    }
}