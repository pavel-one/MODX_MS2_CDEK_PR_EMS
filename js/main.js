//доставка
$(document).ready(function() {
  $('select[name=city]').select2({
    language: 'ru',
    placeholder: 'Город не выбран',
    ajax: {
      url: 'http://api.cdek.ru/city/getListByTerm/jsonp.php?callback=?',
      dataType: "jsonp",
      data: function (params) {
        return {
          q: params.term, // search term
          name_startsWith: params.term,
        };
      },
      processResults: function (resp) {
        var citys = [];
        if (typeof(resp.geonames) != 'object') {
          return false;
        }
        resp.geonames.forEach(function(item, i) {
	        var obj = {};
	        obj.id = item.name;
	        obj.text = item.name;
	        obj.cityName = item.cityName;
	        obj.regionName = item.regionName;
	        obj.post = item.postCodeArray;
	        obj.idCDEK = item.id;
	        citys.push(obj);
        });
        return {
          results: citys,
        };
      },
    },
	minimumInputLength: 3,
	templateSelection: function (data) {
	  console.log(data);
    setSession(data.idCDEK, data.cityName);
	  if (data.id === '') {
	    return 'Город не выбран';
	  }
	  if (data.idCDEK == undefined) {
	  	return data.text;
	  }
	    /*
	    раскомментировать, если нужна подгрузка индексов
	    $('[name=zip]').removeAttr('disabled');
      $('[name=zip] option').remove();
	    $('[name=index]').removeAttr('disabled');
      $('[name=index] option').remove();
  	  data.post.forEach(function (item) {
  	    $('[name=zip]').append('<option value="'+item+'">'+item+'</option>');
  	    $('[name=index]').append('<option value="'+item+'">'+item+'</option>');
  	  });
	    */
      $('[name=state]').removeAttr('disabled');
      $('[name=state]').val(data.regionName);

      $('[name=region]').removeAttr('disabled');
      $('[name=region]').val(data.regionName);


	  return data.text;
	}
  });
  function setSession(id, name) {
    if (id == undefined) {
      return false;
    }
    $.ajax({
        type: "POST",
        url: "assets/components/customDelivery/session.php",
        data: {
          cityId: id,
          cityName: name
        },
        success: function(res) {
          $(document).find('input[name=delivery]').attr('checked', false);
          var statusBlock = $('.statusDelivery');
          statusBlock.text('');
        }
    });
  }
  $('#msOrder [type=radio]').change(function() {
    var id = $(this).val();
    var statusBlock = $('.statusDelivery');
    if (id == 45 || id == 46 || id == 5) {
      setTimeout(function() {
        $.ajax({
            type: "POST",
            url: "assets/components/customDelivery/sessionGetStatus.php",
            success: function(res) {
              statusBlock.text(res);
            }
        });
      }, 1500)
    } else {
      statusBlock.text('');
    }
    
  })
})