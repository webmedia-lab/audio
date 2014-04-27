require './models/index_generator'

index_generator = IndexGenerator.new 'public'
index_generator.write_index

use Rack::Static,
  urls: ['/images', '/js', '/css']

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('public/index.html', File::RDONLY)
  ]
}