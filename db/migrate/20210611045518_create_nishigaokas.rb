class CreateNishigaokas < ActiveRecord::Migration[5.2]
  def change
    create_table :nishigaokas do |t|

      t.timestamps
    end
  end
end
