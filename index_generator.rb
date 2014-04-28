class IndexGenerator
  def initialize(files, destination = 'index.html')
    @destination = destination
    @files = files
  end

  def write
    File.open(@destination, 'w') { |file| file.write(generate_content) }
  end

  private
  # FIXME: delegate html generation to a templating engine (mote?)
  def generate_content
    file_content = '<h2>Webmedia-lab files:</h2>'
    @files.each do |file|
      file_content << "<a href='#{file}'>#{file}</a><br>"
    end

    file_content
  end
end