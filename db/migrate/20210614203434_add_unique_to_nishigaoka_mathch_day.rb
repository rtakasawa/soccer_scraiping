class AddUniqueToNishigaokaMathchDay < ActiveRecord::Migration[5.2]
  def up
    add_index :nishigaokas, :match_day, unique: true
  end
  def down
    remove_index :nishigaokas, :match_day
  end
end
