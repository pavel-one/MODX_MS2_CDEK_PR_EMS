Автоматический расчет доставки СДЭК, Почты России и EMS  
Это дополнение к статьи на [modx.pro](https://modx.pro/howto/13418-the-correct-calculation-of-shipping-sdek-pr-ems-part-1/ "Перейти на сайт") 
 
# Установка  

+ Распаковать архив в корень сайта
+ Каждый из методов доставки нужно добавить как отдельный сервис согласно документации minishop2 выполнив в консоле или сниппете один раз код:

***
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

После этого добавив новые методы доставки в настройках minishop2 и указав нужный класс обработчика: **CDEKdelivery**,**PostcalcPRdelivery** или **PostcalcEMSdelivery** соответственно

# Внимание

Это хоть и готовое решение но использовать его хотя бы не взглянув код или не прочитав статью на modx.pro я крайне не рекомендую, особенно JS часть кода. Ну и конечно же делайте бэккапы господа

# Удаление

***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'CDEKdelivery');
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'PostcalcPRdelivery');
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'PostcalcEMSdelivery');
	}