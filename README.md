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

# Сниппеты вывода доставки на странице товара
Сделаны снипеты вывода стоимости доставки на странице товара

## Установка
1. Создаем новые сниппеты в MODX и называем их **getDeliveryPricePR** и **getDeliveryPriceCdek**
2. Ставим галочку на поле "Статичный"
3. В появившемся поле "Статичный файл" прописываем **core/snippets/getDeliveryPricePR.php** и во втором сниппете **core/snippets/getDeliveryPriceCdek.php**

## Вызов Почты России на странице товара

Почта россии вызывается вот так, мы передаем id товара, имя города и шаблон test

	[[!getDeliveryPricePR?
	  &id=`[[*id]]`
	  &city=`Ростов-на-Дону`
	  &tpl=`test`
	]]

### Пример чанка **test**

	<b>Имя отправления: </b> - [[+name]] <br>
	<b>Срок поставки в [[+city]]: </b> - [[+time]] дней<br>
	<b>Стоимость доставки: </b> - [[+price]] р.<br>
	<hr>

## Вызов СДЭК на странице товара

Передаем id товара, id города сдэк, шаблон и тарифы, тарифы можете посмотреть в оф документации

	[[!getDeliveryPriceCdek?
	  &id=`[[*id]]`
	  &cityId=`438`
	  &tpl=`test2`
	  &tarifs=`1, 10, 62`
	]]

### Пример чанка **test2**

	Стоимость доставки СДЭК 
	{if $tarif == '1'}
	Экспресс лайт дверь-дверь
	{elseif $tarif == '10'}
	Экспресс лайт склад-склад
	{elseif $tarif == '62'}
	Магистральный экспресс склад-склад
	{/if}
	в ваш город составит {$price}, период доставки: {if $min == $max}{$min} дня {else}от {$min} дней, до {$max} дней{/if} <br>

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