class AddProsthessDownToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :prosthss_down, :boolean
  end
end
