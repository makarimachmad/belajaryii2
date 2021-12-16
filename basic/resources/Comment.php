<?php

namespace app\resources;

class Comment extends \app\models\Comment
{
	// public function fields(){
	// 	return ['id', 'title', 'body', 'post_id'];
	// }

	public function extraFields(){
		//return ['post_id', 'created_at', 'updated_at', 'updated_by', 'created_by'];
		return ['post'];
	}

	public function getPost(){
		return $this->hasOne(Post::class, ['id' => 'post_id']);
	}
}