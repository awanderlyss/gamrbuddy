class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :gamertag
      t.string :img_url
      t.string :desc

      t.timestamps
    end
  end
end
