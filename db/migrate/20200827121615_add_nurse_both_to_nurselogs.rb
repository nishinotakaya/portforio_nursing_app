class AddNurseBothToNurselogs < ActiveRecord::Migration[5.1]
  def change
    add_column :nurselogs, :nurse_both, :string
  end
end
