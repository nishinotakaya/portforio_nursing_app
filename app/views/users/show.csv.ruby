require 'csv'

CSV.generate do |csv|
    

  column_names = %w(worked_on started_at finished_at note )
  csv << column_names
  @attendances.each do |attendance|
  started_at = attendance.started_at 
  attendance.started_at.present? ? started_at = attendance.started_at.strftime('%R')
                                  : started_at = nil
  attendance.finished_at.present? ? finished_at = attendance.finished_at.strftime('%R')
                                  : finished_at = nil
                                  
   l(attendance.worked_on, format: :short)
   
    column_values = [
      attendance.worked_on,
      started_at,
      finished_at,
      attendance.note,
    ]
    csv << column_values
  end
end