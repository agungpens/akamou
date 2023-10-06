<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FeedbackMou extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'feedback_mous';
    protected $guarded = ['id'];
}
