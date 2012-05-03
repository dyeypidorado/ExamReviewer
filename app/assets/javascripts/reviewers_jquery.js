function next_item(link){
  $(link).parent(".item").hide();
  $(link).parent(".item").next(".item").toggle();
}

function prev_item(link){
  $(link).parent(".item").hide();
  $(link).parent(".item").prev(".item").toggle();
}

function check_answer( link, path){

  var choice = $(link).parent(".item").find("input[type=radio]:checked").val();
  if (choice !=null) {
    $.post(path, {choice: choice},
    function(data){
      alert(data);
    });
    $(link).parent(".item").children("input[type=hidden]").last().val("1");

    $(link).parent(".item").find("input[type=radio]:not(:checked)").closest("label").hide();
    var unchosen = $(link).parent(".item").find("input[type=radio]:not(:checked)");
    for(var i = 0; i < unchosen.length; i++){
      $(unchosen[i]).next("label").hide();
      $(unchosen[i]).hide();
    }
  }
}
