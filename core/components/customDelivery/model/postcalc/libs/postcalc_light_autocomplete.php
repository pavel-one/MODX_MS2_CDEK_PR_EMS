<?php
header('content-type: application/json; charset=utf-8');
require_once 'postcalc_light_lib.php';
if ( isset($_GET['input_value']) ) {
    $input_value = htmlspecialchars($_GET['input_value'], ENT_QUOTES);
    echo postcalc_autocomplete($input_value, $arrPostcalcConfig['autocomplete_items']);
}
