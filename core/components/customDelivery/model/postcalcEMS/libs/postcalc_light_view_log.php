<?php
require 'postcalc_light_config.php';
extract($arrPostcalcConfig,EXTR_PREFIX_ALL,'postcalc_config');
// Выдаем заголовок с указанием на кодировку
header("Content-Type: text/html; charset=$postcalc_config_cs");
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Просмотр журнала PostcalcLight</title>
        <meta charset='<?=$postcalc_config_cs?>'> 
        <style>
          BODY {font-family: sans-serif,Arial;}
          A {color: blue; text-decoration: none;}
          A:active {color: red; }
          A:visited {color: blue; }
          A:hover {text-decoration: underline; color: green; }
       </style>
    </head>
    <body>
        <h2> Просмотр журнала PostcalcLight </h2>
<?php
require 'postcalc_light_auth.php';
foreach (glob("$postcalc_config_cache_dir/postcalc_*.log") as $logfile ) 
   echo " <a href='?logfile=".rawurlencode($logfile)."'>".basename($logfile)."</a> \n";

?>
     <pre>
<?php
if ( isset($_GET['logfile']) && strpos($_GET['logfile'],"$postcalc_config_cache_dir/postcalc_") === 0 ) {
    echo "<h2>Файл журнала: ".  basename($_GET['logfile'])."</h2>\n";
    $fp=fopen($_GET['logfile'],'r');
    while ( $logline = fgets($fp) ) echo rawurldecode($logline);
    fclose($fp);
}
if ( isset($_GET['date']) ) {
    $date = $_GET['date'];
    $month = substr($date,0,7);
    $file_prefix = isset($_GET['errorlog']) ? 'postcalc_error_' : 'postcalc_light_';
    $logfile="$postcalc_config_cache_dir/$file_prefix$month.log";
    if ( file_exists($logfile) ) {
    echo "<h2>Дата: $date</h2>\n";
    $fp=fopen($logfile,'r');
    while ( $logline = fgets($fp) ) 
            if ( strpos($logline,$date) ===0 ) echo rawurldecode($logline);
    fclose($fp);
    } else {
        echo "<h3>Не найден файл $logfile!</h3>";
    }
}
?>
    </pre>    
    </body>
</html>