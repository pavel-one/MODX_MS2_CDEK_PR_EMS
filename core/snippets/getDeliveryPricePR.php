<?php
//$id = 3;
//$city = 'Ростов-на-Дону';
//city
//tpl
$res = $modx->getObject('modResource', $id);
$price = $res->get('price');
$weight = $res->get('weight');
function getPostCalc ($price, $weight, $city) {
  global $modx;
  require_once MODX_CORE_PATH.'components/customDelivery/model/postcalc/libs/postcalc_light_lib.php';
  $cost = 0;
	$cityName = $city;
	if (empty($cityName)) {
		return $cost;
	}
	$weight = floatval($weight) * 1000;
	$postcalc_from = 117216; //индекс города-отправителя
	$postcalc_to = $cityName; //куда отправляем
	$postcalc_weight = $weight; //вес
	$postcalc_valuation = 100; //оценка посылки
	$postcalc_country = 'RU';
	$arrResponse = postcalc_request($postcalc_from, $postcalc_to, $postcalc_weight, $postcalc_valuation, $postcalc_country);
	if ( !is_array($arrResponse) ) {
		$modx->log(1, 'Ошибка postcalc '.$arrResponse);
    if ( !is_array(error_get_last()) ){
        $arrError = error_get_last();
        $modx->log(1, 'Массив ошибки postcalc '.print_r($arrResponse, 1));
    };
    $textDeliveryCdek = 'Ошибка автоматического расчета Почты России, стоимость доставки посчитает для вас менеджер вручную.';
	} else {
	  $arr = $arrResponse['Отправления'];
	  $respons = array();
	  foreach ($arr as $item) {
	    $respons[] = array(
	      'name' => $item['Название'],
	      'price' => $item['Доставка'],
	      'time' => $item['СрокДоставки'],
	      'city' => $city
	      );
	  }
	return $respons;
	}
}

foreach (getPostCalc($price, $weight, $city) as $item) {
	echo $modx->getChunk($tpl, $item);
}