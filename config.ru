use Rack::Static, urls: [''], index: 'index.html'

run ->(env){ [200, {}, File.open('./index.html', File::RDONLY)] }
