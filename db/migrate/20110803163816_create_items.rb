class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :header
      t.string :dim
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
