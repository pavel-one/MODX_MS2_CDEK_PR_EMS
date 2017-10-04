<?php
require 'postcalc_light_lib.php';
extract($arrPostcalcConfig,EXTR_PREFIX_ALL,'postcalc_config');
header("Content-Type: text/html; charset=$postcalc_config_cs");
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Статистика PostcalcLight</title>
        <meta charset='<?=$postcalc_config_cs?>'> 
        <style>
          BODY {font-family: sans-serif,Arial;}
          TABLE {background-color: grey}
          TR {background-color: white}
          TD {text-align: right; padding-right:0.5em}
          A {color: blue; text-decoration: none;}
          A:active {color: red; }
          A:visited {color: blue; }
          A:hover {text-decoration: underline; color: green; }
       </style>
    </head>
    <body>
        <h1> Статистика PostcalcLight </h1> 
<?php
require 'postcalc_light_auth.php';
/**
 * Вспомогательная функция - делает summary после каждой таблицы с данными за месяц. 
 * Используется только в postcalc_light_stat.php.
 * 
 * @ignore
 * @param integer $num_requests_month
 * @param float $size_month
 * @param float $time_month
 * @return string
 */
function postcalc_month_summary($num_requests_month,$size_month,$time_month,$num_failed_requests_month){
    $out='';
    $out .="Число успешных запросов: $num_requests_month<br>\n"; 
    // Может быть и так, что число успешных запросов равно нулю. Маленький workaround, чтобы не делить на 0.
    $num_requests_month=$num_requests_month?$num_requests_month:1;
    $out .="Средний размер ответа: ".round($size_month/$num_requests_month)." байт<br>\n";
    $out .="Входящий трафик: " .number_format(($size_month/1024),1,'.','')." Кбайт<br>\n";
    $out .="Среднее время запроса: " .number_format(($time_month/$num_requests_month),3,'.','')." сек.<br>\n";
    $out .="Число неуспешных соединений: $num_failed_requests_month<br>\n";
           
return $out;
}

$arrStat = postcalc_get_stat_arr();
if (!$arrStat) die("Файлы журнала в каталоге $postcalc_config_cache_dir не обнаружены!"); 
$out = '';

$month='';$month_current='';
$size_month=0;$time_month=0;$num_requests_month=0;$num_failed_requests_month=0;
foreach ( $arrStat as $date => $arr_values ) {
    $month = substr($date,0,7);
    // Начало нового месяца
    if  ( $month != $month_current ) {
        // Если это не самый первый месяц, до него уже была таблица. 
        // Ставим для нее закрывающий тэг и делаем summmary.
        if ($month_current) { 
            $out .= "</table>\n";
            $out .=postcalc_month_summary($num_requests_month,$size_month,$time_month,$num_failed_requests_month);
            $size_month=0;$time_month=0;$num_requests_month=0;
        }
        $out .="<h2><a href='postcalc_light_view_log.php?date=$month' target='postcalc_view_log'>$month</a></h2>
                <table>
                <tr><th>Дата</th><th>Запросов</th><th>Ср.время</th><th>Ср.размер</th><th>Ошибки</th></tr>
                ";
    $month_current = $month;
    }
    $size=0;$num_requests=0;$time_elapsed=0;
    extract($arr_values);
    $size_month += $size * $num_requests;
    $time_month += $time_elapsed * $num_requests;
    $num_requests_month += $num_requests;
    $num_failed_requests_month +=$errors;
    $out .= "<tr>"
            . "<td><a href='postcalc_light_view_log.php?date=$date' target='postcalc_view_log'>$date</a></td>"
            . "<td>$num_requests</td>"
            . "<td>$time_elapsed</td>"
            . "<td>$size</td>"
            . "<td>";
    if ($errors>0) $out .= "<a href='postcalc_light_view_log.php?date=$date&errorlog=1' target='postcalc_view_log'>$errors</a></td>";
    $out .= "</tr>\n";
        
}
    // Закрывающий тэг самой последней таблицы и ее summary.
    $out  .= "</table>\n";
    $out .=postcalc_month_summary($num_requests_month,$size_month,$time_month,$num_failed_requests_month);
echo $out;
   
?>
        
    </body>
</html>