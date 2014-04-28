require './index_generator'

# we get only files from examples dir
IndexGenerator.new(Dir['./examples/*'].select { |f| File.file?(f) }).write

use Rack::Static,
  urls: ['/js', '/css', '/examples', '/sounds']

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}