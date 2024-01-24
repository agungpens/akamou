<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DokumenMou extends Model
{
    use HasFactory;


    protected $table = 'dokumen_mou';
    protected $guarded = ['id'];
}
