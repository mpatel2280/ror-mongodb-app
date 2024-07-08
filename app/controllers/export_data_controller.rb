# app/controllers/data_controller.rb
class ExportDataController < ApplicationController
    def export
        directory_path = Rails.root.join('public')
        @files = ListDirectoryFilesService.new(directory_path).list_files
        
        # @files.each do |k, file|
        #     logger.info @files[k]
        # end

        data = @files.map do |k, file_data|
            {
              column1: file_data[:file_path],
              column2: file_data[:file_name], 
              column3: file_data[:file_size]
            }

          end
            
        excel_data = ExportToExcelService.new(data).generate
  
        send_data excel_data, type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                           filename: "data.xlsx"
    end
  end
  