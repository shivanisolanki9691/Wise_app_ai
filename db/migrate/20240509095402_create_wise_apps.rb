class CreateWiseApps < ActiveRecord::Migration[6.1]
  def change
    create_table :wise_apps do |t|
      t.string :icon
      t.string :app_name
      t.text :description
      t.string :app_type
      t.integer :numbers_of_app

      t.timestamps
    end
  end
end
