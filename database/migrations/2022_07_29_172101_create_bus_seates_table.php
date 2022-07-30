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
        Schema::create('bus_seates', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('seat_number');
            $table->boolean('booked')->default(0);
            $table->integer('bus_id')->unsigned();
            $table->foreign('bus_id')->references('id')->on('buses')->onUpdate('cascade')->onDelete('cascade');
            $table->index(['seat_number', 'bus_id']);

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bus_seates');
    }
};
