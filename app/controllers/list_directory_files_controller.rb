# app/controllers/list_directory_files_controller.rb
class ListDirectoryFilesController < ApplicationController
    def index
      directory_path = Rails.root.join('public')
      @files = ListDirectoryFilesService.new(directory_path).list_files
    end
  end
  