class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :header
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
