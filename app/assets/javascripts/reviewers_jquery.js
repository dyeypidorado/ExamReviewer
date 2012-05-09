function next_item(link, path){
  check_answer(link, path);
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
    var reviewer = $(link).parent(".item").find("input[type=hidden]").first().val();
    var question = $(link).parent(".item").find("input[type=hidden]").last().val();
    $.post(path, {choice_id: choice, question_id: question, reviewer_id: reviewer },
    function(data){
      alert(data);
    });
    
    $(link).parent(".item").find("input[type=radio]:checked").replaceWith("You're answer was: ");
    
    var unchosen = $(link).parent(".item").find("input[type=radio]:not(:checked)");
    for(var i = 0; i < unchosen.length; i++){
      $(unchosen[i]).next("label").remove();
      $(unchosen[i]).next("br").remove();
      $(unchosen[i]).hide();
    }
  }
}
