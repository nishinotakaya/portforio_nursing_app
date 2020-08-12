class CreateAdlChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :adl_checks do |t|
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
