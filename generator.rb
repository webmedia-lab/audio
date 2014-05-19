require 'mote'

class Generator
  def initialize(data)
    @data = data
  end

  def generate(destination)
    File.open(destination, 'w') do |file|
      file.write(Mote.parse(File.read('index.mote'), self, [:data]).call(data: @data))
    end
  end
end

data = {
  files: Dir['examples/*.*'],
  links: [
          {
            url: 'http://noisehack.com/custom-audio-effects-javascript-web-audio-api/',
            label: 'Programming custom audio effects with web audio API',
            tags: 'dsp effects javascript-node'
          },

          {
            url: 'http://musicdsp.org/',
            label: 'Collection of DSP algorithms and resources',
            tags: 'dsp'
          },
         ]
}

Generator.new(data).generate('index.html')
