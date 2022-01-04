<?php

namespace app\models;

use Yii;
use yii\base\Model;

/**
 * Signup Form
 */

class SignupForm extends Model{
	public $username, $email, $password;

	/**
	 * @inheritdoc
	 */

	public function rules(){
		return[
			['username', 'trim'],
			['username', 'required'],
			['username', 'uniqe', 'targetClass' => '\app\models\User', 'message' => 'This username has already been taken'],
			['username', 'string', 'min' => 2, 'max' => 255],
			['email', 'trim'],
			['email', 'required'],
			['email', 'email'],
			['email', 'string', 'max' => 255],
			['email', 'uniqe', 'targetClass' => '\app\models\User', 'message' => 'this email has already been taken'],
			['password', 'required'],
			['password', 'string', 'min' => 6],
		];
	}

	/**
	 * sign user up
	 */

	public function signup(){
		if (!$this->validate()){
			return null;
		}

		$user = new User();
		$user -> username = $this->username;
		$user -> email = $this->email;
		$user -> setPassword($this->password);
		$user -> generateAuthKey();
		return $user->save() ? $user:null;
	}
}