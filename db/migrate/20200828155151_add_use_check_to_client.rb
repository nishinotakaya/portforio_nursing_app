class AddUseCheckToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :use_check, :boolean
  end
end
