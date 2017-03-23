
multiRoomApp.filter('removeUnderScore', function () {
  return function (input) {
      return input.replace(/_/g, ' ');
  };
});
multiRoomApp.filter('removeDash',function(){
        return function (input) {
        return input.replace(/-/g,'');
};
});
multiRoomApp.filter('removeDot', function(){
        return function(input) {
                return input.replace(/\./g,'');
};
});
multiRoomApp.filter('removeChromeCast',function(){
        return function(input) {
                return input.replace(/chromecast/g,'');
};
});
multiRoomApp.filter('removeAlsa',function(){
        return function(input){
                return input.replace(/alsa output/g,'');
};
});
multiRoomApp.filter('firstFifteen',function(){
        return function(input){
                return input.substring(0,13);
};
});

