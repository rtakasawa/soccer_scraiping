class CreateNishigaokas < ActiveRecord::Migration[5.2]
  def change
    create_table :nishigaokas do |t|
      t.date :match_day, null: false
      t.text :contents, null: false
      t.timestamps
    end
  end
end
