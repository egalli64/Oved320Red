function showHide(id1, id2) {
	
  var id1 = document.getElementById(id1);
  var id2 = document.getElementById(id2)
  
  if (id1.style.display === "none") {
    id1.style.display = "block";
    id2.style.display = 'none';
  } else {
    id1.style.display = "none";
    id2.style.display='block';
  }
}