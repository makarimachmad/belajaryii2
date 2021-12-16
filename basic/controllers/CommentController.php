<?php

namespace app\controllers;

use app\resources\Comment;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use yii\filters\auth\HttpBearerAuth;

class CommentController extends ActiveController
{
    public $modelClass = Comment::class;

    public function behaviors(){
        $behaviors = parent::behaviors();
        $behaviors['authenticator']['only'] = ['create', 'update', 'delete'];
        $behaviors['authenticator']['authMethods'] = [
            HttpBearerAuth::class
        ];
        
        return $behaviors;
    }

    // public function actions()
    // {
    //     $actions = parent::actions();
    //     $actions['index']['prepareDataProvider'] = [$this, 'prepareDataProvider'];

    //     return $actions;
    // }

    // public function prepareDataProvider()
    // {
    //     return new ActiveDataProvider([
    //         'query' => $this->modelClass::find()->andWhere(['post_id' => \Yii::$app->request->get('postId')])
    //     ]);
    // }
}