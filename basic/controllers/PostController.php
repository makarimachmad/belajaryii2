<?php

namespace app\controllers;

use app\resources\Post;
use yii\rest\ActiveController;

class PostController extends ActiveController
{
    public $modelClass = Post::class;
}