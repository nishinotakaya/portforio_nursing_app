class AddNurseWorkedOnToNurselogs < ActiveRecord::Migration[5.1]
  def change
    add_column :nurselogs, :nurse_worked_on, :date #看護日誌日付
  end
end
