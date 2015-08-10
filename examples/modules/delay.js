'use strict'
function FX(AC) {
    var yo = {};
    
    yo.Delay = function (options) {    
        function DelayNode (context, options) {
            this.feedback = context.createGain();
            this.feedback.gain.value = options['feedback'] || 0.5;
            this.feedback.connect(this);

            this.delayTime.value = options['delay'] || 1.0;
            this.connect(this.feedback);
        }

        var delay = AC.createDelay(options.maxTime || 5.0);

        DelayNode.call(delay, AC, options);
        
        return delay;
    }

    yo.AutoWah = function (options) {
        function AutoWahNode(options) {
            this.filter = AC.createBiquadFilter();
            this.filter.type = "bandpass";
            this.filter.gain.value = 1000;
            this.filter.frequency.value = 1000.0;
            this.filter.Q.value = 10.0;
            
            
            var lfo = AC.createOscillator();
            var lfo_amp = AC.createGain();
            lfo.frequency.value = 1;
            lfo_amp.gain.value = 500.0;
            lfo.connect(lfo_amp);
            lfo_amp.connect(filter.detune);
            lfo.start();
        }

        var fx = AutoWahNode(AC, options)
    }

    return yo;
}
