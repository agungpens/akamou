<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DokumenMoa extends Model
{
    use HasFactory;


    protected $table = 'dokumen_moa';
    protected $guarded = ['id'];

    public function doc_mou (){
        return $this->belongsTo(DokumenMou::class, 'nomor_mou', 'nomor_mou');
    }
}
