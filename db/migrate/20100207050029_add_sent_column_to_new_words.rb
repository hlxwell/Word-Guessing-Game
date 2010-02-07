class AddSentColumnToNewWords < ActiveRecord::Migration
  def self.up
    add_column :new_words, :sent, :boolean, :default => false
  end

  def self.down
    remove_column :new_words, :sent
  end
end
