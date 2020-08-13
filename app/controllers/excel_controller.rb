class ExcelController < ApplicationController
  class ExcelController < ApplicationController
  include ExcelTemplateHelper

  def sample1
    create_data
    send_data(
      excel_render('lib/excel_templates/sample1.xlsx').stream.string,
      type: 'application/vnd.ms-excel',
      filename: "#{@datetime.strftime("%Y%m%d_%H%M%S")}_sample1（#{@name}）.xlsx"
    )
  end

  private

  def create_data
    @datetime = Time.now
    @name = 'm-kubo'
    @multi_lines_text = "Remember kids,\nthe magic is with in you.\nI'm princess m-kubo."
  end
  end
end
