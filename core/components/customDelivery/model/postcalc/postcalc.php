<?php
if(!class_exists('msDeliveryInterface')) {
    require_once dirname(dirname(dirname(dirname(__FILE__)))) . '/minishop2/model/minishop2/msdeliveryhandler.class.php';
}
require_once __DIR__.'/libs/postcalc_light_lib.php';
class postCalcDelivery extends msDeliveryHandler implements msDeliveryInterface {
    public $modx;
    public $ms2;
    public function getCost(msOrderInterface $order, msDelivery $delivery, $cost = 0) {
		$cityName = $_SESSION['cityName'];
		if (empty($cityName)) {
			return $cost;
		}
        $add_price = $delivery->get('price');
        if (preg_match('/%$/', $add_price)) {
            $add_price = str_replace('%', '', $add_price);
            $add_price = $cost / 100 * $add_price;
        }
        $cart = $order->ms2->cart->status();
        $weight = $cart['total_weight'];
        $weight = floatval($weight) * 1000;
		$postcalc_from = 117216;
		$postcalc_to = $cityName;
		$postcalc_weight = $weight;
		$postcalc_valuation = 100;
		$postcalc_country = 'RU';
		$arrResponse = postcalc_request($postcalc_from, $postcalc_to, $postcalc_weight, $postcalc_valuation, $postcalc_country);
		if ( !is_array($arrResponse) ) {
			$this->modx->log(1, 'Ошибка postcalc '.$arrResponse);
		    if ( !is_array(error_get_last()) ){
		        $arrError = error_get_last();
		        $this->modx->log(1, 'Массив ошибки postcalc '.print_r($arrResponse, 1));
		    };
            $textDeliveryCdek = 'Ошибка автоматического расчета Почты России, стоимость доставки посчитает для вас менеджер вручную.';
            session_start();
            $_SESSION['statusDelivery'] = $textDeliveryCdek;
            $deliveryCost = $add_price;
		} else {
			//$this->modx->log(1, 'Расчет postcalc '.print_r($arrResponse['Отправления'], 1));
			$deliveryCost = $arrResponse['Отправления']['ЦеннаяПосылка']['Доставка'];
			$deliveryCost = $deliveryCost + $add_price;
            $textDeliveryCdek = 'Стоимость доставки Почтой России в '.$cityName.' составит '.$deliveryCost.'р срок доставки составит '.$arrResponse['Отправления']['ЦеннаяПосылка']['СрокДоставки'].' дня';
            session_start();
            $_SESSION['statusDelivery'] = $textDeliveryCdek;
		}

    	return $deliveryCost + $cost;
    }
}




?>