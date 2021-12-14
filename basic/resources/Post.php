<?php

namespace app\resources;

class Post extends \app\models\Post
{
	public function fields(){
		return ['id', 'title', 'body'];
	}

	public function extraFields(){
		return ['created_at', 'updated_at', 'updated_by', 'created_by'];
	}
}