module AttendancesHelper

  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出社' if attendance.started_at.nil?
      return '退社' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    return false
  end

  # 出勤時間と退勤時間を受け取り、在社時間を計算して返します。
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  
  def over_time(tomorrow, plan_finished_at, designated_work_end_time)
    if tomorrow == true
      format("%.2f", (((plan_finished_at.hour - designated_work_end_time.hour) * 60) + 
                       (plan_finished_at.min - designated_work_end_time.min) / 60.0) + 24)
    else
      format("%.2f", ((((plan_finished_at.hour - designated_work_end_time.hour) * 60) +
                       (plan_finished_at.min - designated_work_end_time.min)) / 60.0)) 
    end
  end

end
