function next_item(link){
  $(link).parent().hide();
  $(link).parent().next().toggle();
}

function prev_item(link){
  $(link).parent().hide();
  $(link).parent().prev().toggle();
}
