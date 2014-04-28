;
NodeList.prototype.each = function(callback) {
  var self = this;
  for(var i = 0; i < this.length; i++){
    callback.call(self, this[i], i);
  }
}
