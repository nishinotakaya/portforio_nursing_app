class AddClientToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :client, :boolean, default: false #利用者
  end
end
