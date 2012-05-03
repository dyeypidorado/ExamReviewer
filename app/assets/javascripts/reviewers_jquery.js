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
  $.post(path, {choice: choice}, 
    function(data){
      alert(data);
    });
}
