Автоматический расчет доставки СДЭК, Почты России и EMS  
Это дополнение к статьи на [modx.pro](https://modx.pro/topic/13418/ "Перейти на сайт")  
# Установка  
Каждый из методов доставки нужно добавить как отдельный сервис согласно документации minishop2  
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'CDEKdelivery',
	        '{core_path}components/customDelivery/model/cdek/CDEK.php'
	    );
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'PostcalcPRdelivery',
	        '{core_path}components/customDelivery/model/postcalc/postcalc.php'
	    );
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'PostcalcEMSdelivery',
	        '{core_path}components/customDelivery/model/postcalcEMS/postcalcems.php'
	    );
	}
соответственно