/**
  * Универсальный плагин для инициализации автодополнения и валидации полей ввода формы.
  * Требует jquery-ui с поддержкой autocomplete и tooltip. 
  * Если определена глобальная переменная OldIE (версии MS Internet Explorer менее 8-й), 
  * отключает tooltip и выводит сообщение об ошибке через alert().
  * 
  * Принимает строку - id формы. Далее проходит в цикле по полям типа input.
  * 
  * Если встречает поле с атрибутом data-autocomplete-url, инициализирует autocomplete,
  * в качестве url для ajax передает адрес, записанный в этом атрибуте.
  * При этом автоматически инициализируется проверка ошибок.
  * 
  * Если встречает поле с атрибутами data-range, инициализирует проверку ошибок
  * в функции validate_range.
  */
 (function( $ ){
    
    
    $.fn.postcalc_light_form = function( form_id ) {
        if (typeof OldIE==='undefined') { $("[id^='postcalc_']").tooltip(); }
        init_form(form_id);
    }
    
    debug = function(message){
       if ( location.search.indexOf('DEBUG') < 0 ) { return; }
        
       if ( location.search.indexOf('DIALOG') > -1 ) {
           $('<div />').html(message).dialog();
       } else if ( location.search.indexOf('CONSOLE') > -1 ) {
           console.log( message );
       } else {
           alert( message );
       }
       return;
    }
    
    init_form = function(form_id) {
           // Стилизуем кнопку submit на форме. После стилизации блокировка кнопки submit 
           // при неправильном вводе в одно из полей формы также блокирует всю форму.
           submitButton= $('#'+form_id).find(':submit').get(0);
           $(submitButton).button();
           
           // Если страна - не Россия, затемняем поле ввода Куда, т.к. оно игнорируется
           // Выключать (disable) нельзя, т.к. ломается логика формы
            if ( $('#postcalc_country').val() != 'RU') { 
                $('label[for="postcalc_to"]').addClass('ui-state-disabled'); 
                $('#postcalc_to').addClass('ui-state-disabled');
            }
            $( '#postcalc_country' ).change(function() {
            
                    if ( $('#postcalc_country').val() != 'RU' ) { 
                        $('label[for="postcalc_to"]').addClass('ui-state-disabled');
                        $('#postcalc_to').addClass('ui-state-disabled');
                    } else {
                        $('label[for="postcalc_to"]').removeClass('ui-state-disabled');
                        $('#postcalc_to').removeClass('ui-state-disabled');
                    }
                    
            });
           
         // Устанавливаем автодополнение для полей ввода, которые имеют атрибут autocomplete-url
           $('#'+form_id+' input').each(function(index,objInput){
               if  ( $(objInput).attr('data-autocomplete-url') ) {
                    autocomplete( objInput );
               }
         // Обработчики валидации
               if  ( $(objInput).attr('data-range')  ) {
                    validate_range(objInput);
               }
          });
      }
      validate_range = function(objInput){
            $(objInput).blur(
                function(e) { _validate_range(objInput); }              
            );
 
            // Пользователь нажал Enter
            $(objInput).keypress(function(e){
                if(e.keyCode == 13){
                      return _validate_range(objInput); 
                 }
            });
      },
      _validate_range = function(objInput){
                arr = $(objInput).attr('data-range').split(',');
                if ( Number(objInput.value) >= Number(arr[0]) && Number(objInput.value) <= Number(arr[1]) ) {
                    // Если пользователь нажал Enter в поле которое ранее не проходило валидацию, 
                    // в 1-й раз только активируем поле и submit, а во 2-й раз - передаем форму. 
                    input_ok(objInput);
                    if  ( $(objInput).prop('ValidationFailed') ) {
                        $(objInput).prop('ValidationFailed',false);
                        return false;
                    } 
                    return true;
                } else {
                    input_bad(objInput);
                    return false;
                }
      },
      input_bad = function(objInput){
              $(objInput).addClass( 'ui-state-error' );
              $(objInput).prop('ValidationFailed',true);
              // Сообщение об ошибке - из атрибута validation-error, если он установлен
              errorMessage=( $(objInput).attr('data-validation-error') ) ?
                        $(objInput).attr('data-validation-error') : 'Ошибка при валидации поля';
              $(objInput).attr('title',errorMessage);
              if (typeof OldIE==='undefined') {
                  $(objInput).tooltip({ 
                                  tooltipClass: 'ui-state-error',
                                  position: { my: "left top+4", at: "left bottom" }
                             });
                  $(objInput).tooltip('enable');
                  $(objInput).tooltip('open');
              } else {
                  alert(errorMessage);
              }
              // Ищем 1-ю кнопку типа Submit.
              submitButton=$(objInput.form).find(':submit').get(0);
              $(submitButton).button("disable");
      },
      input_ok = function(objInput){
          $(objInput).removeClass( 'ui-state-error' )
                     .attr('title','');
          if (typeof OldIE==='undefined') {
                  $(objInput).tooltip('disable');
          }
          submitButton=$(objInput.form).find(':submit').get(0);
          $(submitButton).button("enable");
      },
      autocomplete = function(objInput){
          $(objInput).autocomplete({
           source: function(request,response) {
              $.ajax({
                url: $(objInput).attr('data-autocomplete-url'),
                dataType: "json",
                dataFilter: function(data,dataType){
                    var arrJSON = '';
                    var errMessages = '';
                    var jsonStart = data.indexOf('[');
                    var jsonEnd = data.indexOf(']');
                    // Если в выдаче есть что-то, кроме массива json, это сообщения PHP.
                    if ( jsonStart > -1 && jsonEnd > -1 ) {
                       arrJSON = data.substring(jsonStart,jsonEnd+1);
                      
                       if ( jsonStart > 0 ) {
                            errMessages +=  data.substring(0,jsonStart);
                       }
                       if ( data.length > jsonEnd+2 ) {
                           errMessages +=  data.substring(jsonEnd+1);
                       }
                       // На пробелы не реагируем
                       errMessages = errMessages.replace(/^\s+|\s+$/gm,'');
                       if  ( errMessages.length > 0 ) { debug(errMessages); }
                    }
                    // Возвращаем "очищенный" от возможного вывода в начале и конце массив JSON
                    return arrJSON;
                },
                data: {
                // Переменные, которые отправляются на сервер. Значение из привязанного комбо - request.term
                   input_value: request.term
                },
                success: function(data,textStatus) {
                   // Если вернули пустой массив - не найдено ничего
                  if (!data.length) {
                       input_bad(objInput);
                    } else {
                      response($.map( data, function(item) {
                         return {
                           label: item.label,
                           value: item.value
                         }
                     }));
                  }
                },
                error: function(jqXHR,textStatus,errorThrown){
                  // Большинство полей в jqXHR неинформативно. getAllResponseHeaders() - набор заголовков, status - 200, statusText - OK.
                  alert("An error occurred! \ntextStatus: "+textStatus+"\nerrorThrown: "+errorThrown+"\nRESPONSE:\n"+jqXHR.responseText);
                }
                        
              });
            },  // Конец source 
            minLength: 2,
            autoFocus: true,
            delay: 200,
           // blur - щелкнули мышью или нажали табулятор. Проверяем, есть ли объект arrValidate
           change: function() { 
               // Если масссив arrValidate не существует, значит, еще не было ни одного запроса,
               // а изменение значения по умолчанию было. Это ошибка всегда.
               if ( !$(objInput).prop('arrValidate') ) {
                    input_bad(objInput);
                    return;
               }
              // Если нет в массиве objInput.value- выдаем ошибку
               if ( $.inArray(objInput.value.toString(),objInput.arrValidate) < 0 ) {
                   input_bad(objInput);
               } else {
                   input_ok(objInput); 
               }
             },
            // Можно проверять по этому массиву - ввод мимо него невозможен
            response: function(e,ui) { 
                 // Сохраняем ответ серверного скрипта для дальнейшей проверки
                arrValidate=[];
                $.each(ui.content, function(i,obj){ arrValidate[i]=obj.value.toString(); });
                $(objInput).prop('arrValidate',arrValidate);
                if (typeof OldIE==='undefined') {
                    $(objInput).tooltip('close');
                }
            },
            // Выбрали пункт меню явно
            select: function(e,ui) { 
               if ( $.inArray(ui.item.value.toString(),objInput.arrValidate) < 0 ) {
                   input_bad(objInput);
               } else {
                   input_ok(objInput); 
               }
            }

          });
       } // Конец autocomplete

})( jQuery );