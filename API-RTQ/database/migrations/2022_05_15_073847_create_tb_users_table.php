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
        Schema::create('tb_users', function (Blueprint $table) {
            $table->id();
            $table->string("nama", 100);
            $table->string("email", 100)->nullable();
            $table->string("password", 100);
            $table->text("alamat")->nullable();
            $table->integer("id_role")->nullable();
            $table->string("no_hp", 30)->nullable();
            $table->string("gambar")->nullable();
            $table->string("tempat_lahir")->nullable();
            $table->date("tanggal_lahir")->nullable();
            $table->string("jenis_kelamin")->enum("L", "P")->nullable();
            $table->string("token")->nullable();
            $table->string("status")->enum("1", "0")->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tb_users');
    }
};
