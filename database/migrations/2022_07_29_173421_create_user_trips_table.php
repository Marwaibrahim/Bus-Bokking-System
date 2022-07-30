<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_trips', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trip_id')->unsigned();
            $table->integer('seat_id')->unsigned();
            $table->integer('user_id')->unsigned();
            $table->integer('depature')->unsigned();
            $table->integer('destenation')->unsigned();

            $table->foreign('trip_id')->references('id')->on('trips')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('seat_id')->references('id')->on('bus_seates')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('subscribers')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('depature')->references('id')->on('cities')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('destenation')->references('id')->on('cities')->onUpdate('cascade')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_trips');
    }
};
