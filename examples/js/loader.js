function Loader(context){
  self = this;
  this.context = context;
  this.sounds = {};

  this.load = function load(url) {
    var request = new XMLHttpRequest();

    request.open('GET', url, true);
    request.responseType = 'arraybuffer';
    request.onload = function(){
      context.decodeAudioData( request.response,
                               function(buffer){ self.sounds[url.split('/').pop()] = buffer; },
                               function(error){ console.log(error) } );
    }

    request.send();
  }

 this.get = function(sound){
   this.sounds[sound];
 }
}
