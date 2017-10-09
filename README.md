Автоматический расчет доставки СДЭК, Почты России и EMS  
Это дополнение к статьи на [modx.pro](https://modx.pro/howto/13418-the-correct-calculation-of-shipping-sdek-pr-ems-part-1/ "Перейти на сайт") 
 
# Установка  

+ Распаковать архив в корень сайта
+ Каждый из методов доставки нужно добавить как отдельный сервис согласно документации minishop2 выполнив в консоле или сниппете один раз код:

***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'msDeliveryHandlerCDEK',
	        '{core_path}components/customDelivery/model/cdek/CDEK.php'
	    );
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'postCalcDelivery',
	        '{core_path}components/customDelivery/model/postcalc/postcalc.php'
	    );
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->addService('delivery', 'postCalcDeliveryEms',
	        '{core_path}components/customDelivery/model/postcalcEMS/postcalcems.php'
	    );
	}

После этого добавив новые методы доставки в настройках minishop2 и указав нужный класс обработчика: **msDeliveryHandlerCDEK**,**postCalcDelivery** или **postCalcDeliveryEms** соответственно

# Сниппет вывода доставки на странице товара
Для примера сделан сниппет вывода стоимости доставки Почты России для сдэк приблизительно тоже самое надо

## Установка
1. Создаем новый сниппет в MODX и называем его **getDeliveryPricePR**
2. Ставим галочку на поле "Статичный"
3. В появившемся поле "Статичный файл" прописываем **core/snippets/getDeliveryPricePR.php**

## Вызов на странице товара

	[[!getDeliveryPricePR?
	  &id=`[[*id]]`
	  &city=`Ростов-на-Дону`
	  &tpl=`test`
	]]

## Пример чанка **test**

	<b>Имя отправления: </b> - [[+name]] <br>
	<b>Срок поставки в [[+city]]: </b> - [[+time]] дней<br>
	<b>Стоимость доставки: </b> - [[+price]] р.<br>
	<hr>

# Внимание

Это хоть и готовое решение но использовать его хотя бы не взглянув код или не прочитав статью на modx.pro я крайне не рекомендую, особенно JS часть кода. Ну и конечно же делайте бэккапы господа

# Удаление

***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'msDeliveryHandlerCDEK');
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'postCalcDelivery');
	}
***
	if ($miniShop2 = $modx->getService('miniShop2')) {
	    $miniShop2->removeService('payment', 'postCalcDeliveryEms');
	}