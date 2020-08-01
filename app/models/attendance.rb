class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  

  # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  # 出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  validate :started_at_than_finished_at_fast_if_invalid
  
  validate :started_at_than_finished_at, on: :attendance_update
  
   # 編集用出勤時間が存在しない場合、退勤時間は無効
  #validate :edit_finished_at_is_invalid_without_a_edit_started_at
   # 編集用出勤・退勤時間どちらも存在する時、出勤時間より早い退勤時間は無効
  #validate :edit_started_at_than_edit_finished_at_fast_if_invalid
  
  #validate :edit_started_at_than_edit_finished_at, on: :attendance_update


  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end

  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if started_at > finished_at
    end
  end
  
  def started_at_than_finished_at
    errors.add(:started_at, "と退社時間の入力が必要です。") if started_at.present? && finished_at.blank?
  end
  
  # 編集用出勤時間が入力されてなく、編集用退勤時間が入力されている場合
  #def edit_finished_at_is_invalid_without_a_edit_started_at
    #errors.add(:edit_started_at, "が必要です") if edit_started_at.blank? && edit_finished_at.present?
  #end
  
  # 編集用出勤時間が編集用退勤時間の時間を超えている場合
 # def edit_started_at_than_edit_finished_at_fast_if_invalid
    #if edit_started_at.present? && edit_finished_at.present?
      #errors.add(:edit_started_at, "より早い退勤時間は無効です") if edit_started_at > edit_finished_at
   # end
  #end
  
  # 編集用出勤時間のみ入力されている場合
  #def edit_started_at_than_edit_finished_at
    # errors.add(:edit_started_at, "と退社時間の入力が必要です。") if edit_started_at.present? && edit_finished_at.blank?
  #end
  
  
  
  
end
    