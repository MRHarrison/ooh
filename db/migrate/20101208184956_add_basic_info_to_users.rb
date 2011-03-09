class AddBasicInfoToUsers < ActiveRecord::Migration
    def self.up
      add_column :users, :bio, :string
      add_column :users, :sex, :string
      add_column :users, :birthday, :date
      add_column :users, :hometown, :string
      add_column :users, :current_city, :string
      add_column :users, :religious_views, :string
      add_column :users, :political_views, :string
      add_column :users, :favorite_quotations, :string
      add_column :users, :interested_in, :string
      add_column :users, :looking_for, :string
    end

    def self.down
      remove_column :users, :sex
      remove_column :users, :bio
      remove_column :users, :birthday
      remove_column :users, :hometown
      remove_column :users, :current_city
      remove_column :users, :religious_views
      remove_column :users, :political_views
      remove_column :users, :favorite_quotations
      remove_column :users, :interested_in
      remove_column :users, :looking_for
    end
end
