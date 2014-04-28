class IndexGenerator
  def initialize(root)
    @root = root
    @files = []
  end

  def write_index
    find_files

    File.open('index.html', 'w') { |file| file.write(parse_content) }
  end

  private

  def find_files
    dir = Dir.new(@root)
    dir.entries.each do |entry|
      @files << entry unless File.directory?("#{@root}/#{entry}")
    end
  end

  def parse_content
    file_content = '<h2>Webmedia-lab files:</h2>'
    @files.each do |file|
      file_content << "<a href='#{file}'>#{file}</a><br>"
    end

    file_content
  end
end