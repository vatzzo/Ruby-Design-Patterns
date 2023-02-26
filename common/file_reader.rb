class FileReader
  # TODO: Move to config
  DEFAULT_PATH = "/Users/mateuszlata/Desktop/Projects/private/Ruby Design Patterns/"

  class FileList
    include Enumerable
  
    def initialize(files)
      @files = files
    end
  
    def each &block
      files.each do |file_path|
        File.open(file_path)
            .tap { |file| block.call file }
            .then { |file| file.close }
      end
    end
  
    private
  
    attr_reader :files
  end

  def initialize(file_format:, relative_path:)
    @file_format = file_format
    @relative_path = relative_path
  end

  def self.call(...)
    new(...).call
  end

  def call
    FileList.new files
  end

  private

  attr_reader :file_format, :relative_path

  def files
    @files ||= Dir.glob("*.json", base: data_path)
                  .map { |file_name| [data_path, file_name].join "/" }
  end

  def data_path 
    @data_path ||= DEFAULT_PATH + relative_path
  end                
end
