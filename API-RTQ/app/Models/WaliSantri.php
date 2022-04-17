<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Lumen\Auth\Authorizable;

class WaliSantri extends Model
{
    protected $table = "tb_wali_santri";

    protected $guarded = [''];

    public $timestamps = false;

    public function getUser()
    {
        return $this->belongsTo("App\Models\User", "id", "id");
    }
}