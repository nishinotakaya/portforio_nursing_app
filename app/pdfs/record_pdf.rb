class RecordPdf < Prawn::Document

    def initialize(record)
  
      super(
        page_size: 'A4',
        top_margin: 40,
        bottom_margin: 30,
        left_margin: 20,
        right_margin: 20
      )
  
      font 'app/assets/fonts/ipaexm.ttf' # fontをパスで指定
  
      @record = record
  
    end
  
  end