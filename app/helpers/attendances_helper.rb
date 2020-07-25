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
  
  # attendancesカラムのuserカラムの終了予定時間と指定勤務時間を引いて再出 ()の数に気を付ける！
  def over_time(tomorrow, plan_finished_at, designated_work_end_time, started_at)
    if (started_at.present? && plan_finished_at.present?) && #勤務開始時間と終了予定時間が存在して、かつ 
      ((designated_work_end_time.hour < started_at.hour) || #指定勤務終了予定時間より勤務開始時間の方が大きい場合又は 
      ((designated_work_end_time.hour == started_at.hour) && (designated_work_end_time.min < started_at.min)))
      #勤務終了予定時間と勤務開始時間が同じ、かつ、勤務終了予定時間（分）より開始時間（分）の方が大きい場合18時代での出勤した時の条件
      if tomorrow == true #翌日チェックtrue
        format("%.2f", (((plan_finished_at.hour - started_at.hour) * 60) + #勤務終了予定時間から勤務開始時間を引く
                         (plan_finished_at.min - started_at.min) / 60.0) + 24) #勤務終了予定時間から勤務開始時間を引く
      else
        format("%.2f", ((((plan_finished_at.hour - started_at.hour) * 60) + 
                         (plan_finished_at.min - started_at.min)) / 60.0))
      end                   
    else                     
      if tomorrow == true 
          format("%.2f", (((plan_finished_at.hour - designated_work_end_time.hour) * 60) + 
                           (plan_finished_at.min - designated_work_end_time.min) / 60.0) + 24)
      else
          format("%.2f", ((((plan_finished_at.hour - designated_work_end_time.hour) * 60) +
                           (plan_finished_at.min - designated_work_end_time.min)) / 60.0))
      end
    end
  end

end
    
