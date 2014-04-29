$(function(){
  $('input[name="commit"]').on('click', function(e){
    e.preventDefault();
    var city = $("#weather_city").val();
    var apiUrl = "http://api.openweathermap.org/data/2.5/forecast?q=" + city + ",us&mode=json&units=imperial";
    var currentTemp = "";

    $.get(apiUrl, function(data){
      console.log(data.list[0].main.temp);
      $('#weather_temp').val(data.list[0].main.temp);
      $('#new_weather').submit();
    });

  });

});



