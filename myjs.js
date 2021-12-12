var nav = $("nav");

var lastScrollY = 0;
window.addEventListener('scroll', function(){
  var st = this.scrollY;
  // 判斷是向上捲動，而且捲軸超過 200px
  if( st < lastScrollY) {
    nav.show();
  }else{
    nav.hide();
  }
  lastScrollY = st;
});