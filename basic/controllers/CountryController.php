<?php

namespace app\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use app\models\Country;

//get all rows from the country table order by name
//$countries = Country::find()->orderBy('name')->all();

//get the first row where code country is US
//$country = Country::findOne('US');

//display united states
//echo $country->name;

//modifies the country name from united states to U.S.A
//$country->name = 'U.S.A';
//$country->save();

class CountryController extends Controller{
	public function actionIndex(){
		$query = Country::find();
		$pagination = new Pagination([
			'defaultPageSize' => 5,
			'totalCount' => $query->count(),
		]);

		$countries = $query->orderBy('name')
			->offset($pagination->offset)
			->limit($pagination->limit)
			->all();

		return $this->render('index', [
			'countries' => $countries,
			'pagination' => $pagination,
		]);
	}
}