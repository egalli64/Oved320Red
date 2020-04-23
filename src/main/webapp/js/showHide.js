function showHide() {
	
  var show = document.getElementById('show1');
  var hide = document.getElementById('hide1')
  
  if (show.style.display === "none") {
    show.style.display = "block";
    hide.style.display = 'none';
  } else {
    show.style.display = "none";
    hide.style.display='block';
  }
}