function Player(context){
  this.context = context;
  this.sounds = {};
    
  this.load = function load(url) {
    var request = new XMLHttpRequest();

    request.open('GET', url, true);
    request.responseType = 'arraybuffer';
    request.onload = function(){
      context.decodeAudioData( request.response, 
                               function(buffer){ sounds[url] = buffer; },
                               function(error){ console.log(error) } );
    }

    request.send();
  }  

  this.play = function(url) {
    var source = context.createBufferSource();
    source.buffer = this.sounds[url];
    source.connect(context.destination);
    source.start(0);
  }
}

window.addEventListener('load', function(){
  window.AudioContext = window.AudioContext || window.webkitAudioContext;

  var player = new Player(new AudioContext());
  player.load('/sounds/reload.wav');

  document.querySelector('html').addEventListener('click', function(){
    player.play('/sounds/reload.wav');
  });
});
