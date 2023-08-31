class CreatePhotographs < ActiveRecord::Migration[7.0]
  def change
    create_table :photographs do |t|
      t.text :caption
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
