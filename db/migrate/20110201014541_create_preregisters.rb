class CreatePreregisters < ActiveRecord::Migration
  def self.up
    create_table :preregisters do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :preregisters
  end
end
