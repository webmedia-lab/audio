function Player(context){
  self = this;
  this.context = context;
  this.sounds = new Loader(context);
  this.params = {};

  this.load = function(sound) {
    this.sounds.load(sound);
  }
}
