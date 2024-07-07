# app/services/list_directory_files_service.rb
class ListDirectoryFilesService
    def initialize(directory_path)
      @directory_path = directory_path
    end
  
    def list_files
      files = {}
      i=0
      Dir.glob(File.join(@directory_path, '*')).each do |file_path|
        next unless File.file?(file_path)
        file_name = File.basename(file_path)
        files[i] = file_name
        i += 1
      end
      files
    end
  end
  