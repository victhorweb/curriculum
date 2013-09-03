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


function showCustomer(str)
{
var xmlhttp;
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","http://localhost:3000/admin/people/getcustomer/"+str);
xmlhttp.send();
}
