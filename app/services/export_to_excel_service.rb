# app/services/export_to_excel_service.rb
require 'axlsx'

class ExportToExcelService
  def initialize(data)
    @data = data
  end

  def generate
    package = Axlsx::Package.new
    workbook = package.workbook

    workbook.add_worksheet(name: "Sheet 1") do |sheet|
      sheet.add_row ["Filepath", "Filename", "Filesize"]
      @data.each do |item|
        sheet.add_row [item[:column1], item[:column2], item[:column3]]
      end
    end

    package.to_stream.read
  end
end
