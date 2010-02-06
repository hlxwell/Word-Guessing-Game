class CreateNewWords < ActiveRecord::Migration
  def self.up
    create_table :new_words do |t|
      t.integer :word_id
      t.integer :user_id
      t.string :note
      t.timestamps
    end
  end
  
  def self.down
    drop_table :new_words
  end
end
