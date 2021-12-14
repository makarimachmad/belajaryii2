<?php

namespace app\controllers;

use app\resources\Comment;
use yii\rest\ActiveController;

class CommentController extends ActiveController
{
    public $modelClass = Comment::class;
}