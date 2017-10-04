<?php
if(!class_exists('msDeliveryInterface')) {
    require_once dirname(dirname(dirname(dirname(__FILE__)))) . '/minishop2/model/minishop2/msdeliveryhandler.class.php';
}
if(!class_exists('CalculatePriceDeliveryCdek')) {
    require_once MODX_CORE_PATH.'components/customDelivery/model/cdek/calc/CalculatePriceDeliveryCdek.class.php';
}



class msDeliveryHandlerCDEK extends msDeliveryHandler implements msDeliveryInterface {
    public $modx;
    public $ms2;
    public function getCost(msOrderInterface $order, msDelivery $delivery, $cost = 0) {
    	$calc = new CalculatePriceDeliveryCdek();
        $cart = $order->ms2->cart->status();
        $weight = $cart['total_weight'];
        //$cart_cost = $cart['total_cost'];
        $cityId = $_SESSION['cityId'];

        $calc->setSenderCityId($this->modx->getOption('CdekSenderCity'));
        $calc->setReceiverCityId($cityId);
        $calc->addTariffPriority($this->modx->getOption('CdekIdTariff'));
        $calc->setModeDeliveryId($this->modx->getOption('CdekIdType'));
        $calc->setDateExecute('2012-08-20');
        $calc->addGoodsItemBySize($weight, '1', '1', '1');
        //$calc->addGoodsItemByVolume($weight, '0.1');
        //добавочная стоимость
        $add_price = $delivery->get('price');
        if (preg_match('/%$/', $add_price)) {
            $add_price = str_replace('%', '', $add_price);
            $add_price = $cost / 100 * $add_price;
        }
        if ($calc->calculate() === true) {
            $res = $calc->getResult();
            $priceDelivery = $res['result']['price'];

            $minPeriod = $res['result']['deliveryPeriodMin'];
            $maxPeriod = $res['result']['deliveryPeriodMax'];
            $deliveryCost = $priceDelivery + $add_price;
            if ($minPeriod == $maxPeriod) {
                $textDeliveryCdek = 'Стоимость доставки CDEK в '.$_SESSION['cityName'].' составит '.$deliveryCost.'р срок доставки составит '.$maxPeriod.' дня';
            } else {
                $textDeliveryCdek = 'Стоимость доставки CDEK в '.$_SESSION['cityName'].' составит '.$deliveryCost.'р срок доставки составит от '.$minPeriod.' дней до '.$maxPeriod.' дней';
            }
            session_start();
            $_SESSION['statusDelivery'] = $textDeliveryCdek;
            return intval($deliveryCost) + intval($cost);
        } else {
            $err = $calc->getError();
            $this->modx->log(1, 'ошибка в расчете сдэк: '.print_r($err,1));
            $textDeliveryCdek = 'Ошибка в автоматическом расчете СДЭК, стоимость доставки посчитает для вас менеджер вручную';
            session_start();
            $_SESSION['statusDelivery'] = $textDeliveryCdek;
            return intval($cost) + intval($add_price);
        }
        
    }
} 


?>