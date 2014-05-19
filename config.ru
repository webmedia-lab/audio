use Rack::Static,
  urls: ['/js', '/css', '/examples', '/sounds']

app = proc do |env|
  headers = {
    'Content-Type'  => 'text/html',
    'Cache-Control' => 'public, max-age=86400'
  }

  [ 200, headers, File.open('index.html', File::RDONLY) ]
end

run app
