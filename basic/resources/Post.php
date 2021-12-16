<?php

namespace app\resources;

class Post extends \app\models\Post
{
	// public function fields(){
	// 	return ['id', 'title', 'body'];
	// }

	public function extraFields(){
		//return ['comments', 'created_at', 'updated_at', 'updated_by', 'created_by'];
		return ['comments', 'created_by'];
	}

	public function getComments()
	{
		return $this->hasMany(Comment::class, ['post_id' => 'id']);
	}
}