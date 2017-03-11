class CreateGiphies < ActiveRecord::Migration[5.0]
  def change
    create_table :giphies do |t|
      t.string :url
      t.boolean :default, default: false
      t.string :creator
      t.text :message

      t.timestamps
    end
  end
end
