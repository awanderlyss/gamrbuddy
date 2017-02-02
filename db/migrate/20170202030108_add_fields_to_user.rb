class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gamertag, :string
    add_column :users, :img_url, :string
    add_column :users, :desc, :string
  end
end
