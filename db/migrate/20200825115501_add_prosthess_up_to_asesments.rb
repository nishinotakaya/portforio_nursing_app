class AddProsthessUpToAsesments < ActiveRecord::Migration[5.1]
  def change
    add_column :asesments, :prosthss_up, :boolean
  end
end
