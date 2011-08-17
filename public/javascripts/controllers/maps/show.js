$(document).ready(function(){
  setReloadTime(5); // In this example we'll use 5 seconds.
});

function setReloadTime(secs){
  if (arguments.length == 1) {
    if (reloadTimer) clearTimeout(reloadTimer);
    reloadTimer = setTimeout("setReloadTime()", Math.ceil(parseFloat(secs) * 1000));
  }
  else {
    location.reload();
  }
}