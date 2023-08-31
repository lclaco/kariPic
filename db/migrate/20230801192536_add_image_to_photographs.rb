class AddImageToPhotographs < ActiveRecord::Migration[7.0]
  def change
    add_column :photographs, :image, :string, after: :caption
  end
end
