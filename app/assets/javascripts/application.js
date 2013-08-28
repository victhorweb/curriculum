function load_cities(state) {
  var str = "";
  $("#person_city_id").children().remove();
  $.get("/states/"+state.value+"/cities").done(function(cs) {
    $.each(cs,function(key,city) {
      str += "<option value='"+city.id+"'>"+city.name+"</option>";
    })
    $("#person_city_id").append(str);
  });
}
