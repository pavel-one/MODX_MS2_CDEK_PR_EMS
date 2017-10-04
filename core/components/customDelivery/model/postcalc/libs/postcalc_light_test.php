<?php
// ==== ПРОСТЕЙШИЙ ВЫЗОВ БИБЛИОТЕКИ PostcalcLight. НАЧНИТЕ С НЕГО.
// Загружаем библиотеку
require_once 'postcalc_light_lib.php';
extract($arrPostcalcConfig,EXTR_PREFIX_ALL,'postcalc_config');
// Заголовок с указанием набора символов. 
header("Content-Type: text/html; charset=$postcalc_config_cs");
// Красивости - таблица стилей
?>
<style>
    BODY {font-family: sans-serif;}
    TABLE {font-family: sans-serif;background-color:#EEE}
    TR:nth-child(2n+1){background-color:#DDF}
    TD {padding:0.2em;padding-left:0.5em}
    .postcalc_error {background-color:#FDD; color:red}
    .postcalc_center {text-align:center}
</style>
<?php
// === Исходные данные
$From='Москва';
$To='Санкт-Петербург';
$Weight=1000;
$Valuation=500;
$Country='RU';

// Обращаемся к функции getPostcalc
$arrResponse = postcalc_request($From,$To,$Weight,$Valuation,$Country);

// Если вернулась строка - это сообщение об ошибке.
if ( !is_array($arrResponse) ) {
    echo "<span class='postcalc_error'>Произошла ошибка:</span><br> $arrResponse";
    if ( count(error_get_last()) ){
        $arrError=error_get_last();
        echo "<br><span class='postcalc_error'>Ошибка PHP, строка $arrError[line] в файле $arrError[file]:</span><br> $arrError[message]";
    };
} else {
// Вернулся массив, Status=='OK'. Выводим таблицу отправлений
echo "<table>\n<tr><th>Название</th><th>Доставка</th><th>Сроки</th></tr>\n";
// Выводим список тарифов
foreach ( $arrResponse['Отправления'] as $parcel )
	echo "<tr><td>$parcel[Название] </td><td>$parcel[Доставка] руб.</td><td class='postcalc_center'>$parcel[СрокДоставки]</td></tr>\n";
echo "</table>\n";
}
