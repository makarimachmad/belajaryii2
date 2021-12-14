<?php

namespace app\resources;

class Comment extends \app\models\Comment
{
	public function fields(){
		return ['id', 'title', 'body'];
	}

	public function extraFields(){
		return ['post_id', 'created_at', 'updated_at', 'updated_by', 'created_by'];
	}
}