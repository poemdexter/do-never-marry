class Reasons < ActiveRecord::Migration
  def up
    create_table :reasons do |t|
        t.string :text
    end
  end

  def down
    drop_table :reasons
  end
end
