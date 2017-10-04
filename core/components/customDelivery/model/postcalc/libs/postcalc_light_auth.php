<?php
if ( $postcalc_config_pass ) {
    $postcalc_light_pass='';
    if ( isset($_COOKIE['postcalc_light_pass']) ) $postcalc_light_pass = $_COOKIE['postcalc_light_pass'];
    if ( isset($_POST['postcalc_light_pass']) ) { 
        $postcalc_light_pass = $_POST['postcalc_light_pass']; 
        setcookie('postcalc_light_pass',$postcalc_light_pass,time()+$postcalc_config_pass_keep_days*86400);
    }
    if ( $postcalc_light_pass != $postcalc_config_pass ) 
        die("<form method='POST'><b>Пароль:</b><input type='password' name='postcalc_light_pass'><input type='submit' value='Авторизоваться'> </form>");
}