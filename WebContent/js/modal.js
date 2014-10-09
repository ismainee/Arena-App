function modalshow(){
  var width,height,padding,top,left,modalbak,modalwin;
  width   = 200;
  height  = 100;
  padding = 44;
  top     = (window.innerHeight-height-padding)/4;
  left    = (window.innerWidth-width-padding)/4; 

  modalbak = document.getElementById("modalbak");
  modalbak.style.display = "block";

  modalwin = document.getElementById("modalwin");
  modalwin.style.top     = top+"px";
  modalwin.style.left    = left+"px";
  modalwin.style.display = "block";
}
function modalhide(){

  document.getElementById("modalbak").style.display = "none";
  document.getElementById("modalwin").style.display = "none";
}