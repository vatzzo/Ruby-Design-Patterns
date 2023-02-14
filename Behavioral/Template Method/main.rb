dir_path = File.expand_path File.dirname(__FILE__).concat("/data")
file_paths = Dir.glob("*.{json,yml}", base: dir_path)
                .map { |file_name| [dir_path, file_name].join "/" }

file_paths.each do |path|
  # TODO: Hash map
  if path.match? /\.json$/
    file = File.open path
      # TODO: Algorithm      
    file.close
  end
end
