class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :source_title
      t.text :content
      t.string :end_rhyme

      t.timestamps null: false
    end
  end
end
