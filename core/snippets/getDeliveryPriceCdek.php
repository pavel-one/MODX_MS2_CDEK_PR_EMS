<?php
if(!class_exists('CalculatePriceDeliveryCdek')) {
    require_once MODX_CORE_PATH.'components/customDelivery/model/cdek/calc/CalculatePriceDeliveryCdek.class.php';
}
function getPrice ($id, $cityId, $tpl, $tarif) {
  global $modx;
  $resource = $modx->getObject('modResource', $id);
  $calc = new CalculatePriceDeliveryCdek();
  $weight = $resource->get('weight');
  $calc->setSenderCityId($modx->getOption('CdekSenderCity'));
  $calc->setReceiverCityId($cityId);
  $calc->addTariffPriority($tarif);
  $calc->setDateExecute('2012-08-20');
  $calc->addGoodsItemBySize($weight, '1', '1', '1');
  
  if ($calc->calculate() === true) {
      $res = $calc->getResult();
      $priceDelivery = $res['result']['price'];

      $minPeriod = $res['result']['deliveryPeriodMin'];
      $maxPeriod = $res['result']['deliveryPeriodMax'];
      
      echo $modx->getChunk($tpl, array(
        'min' => $minPeriod,
        'max' => $maxPeriod,
        'price' => $priceDelivery,
        'tarif' => $tarif
        ));
      
      return;
  } else {
      $err = $calc->getError();
      $modx->log(1, 'ошибка в расчете сдэк: '.print_r($err,1));

      return ;
  }
}
$tarifs = explode(',', $tarifs);
foreach ($tarifs as $item) {
  getPrice ($id, $cityId, $tpl, $item);
}