class CreateMonikers < ActiveRecord::Migration[6.0]
  def change
    create_table :monikers do |t|
      t.string :name

      t.timestamps
    end
  end
end
